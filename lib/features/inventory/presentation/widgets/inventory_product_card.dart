// =============================================================
// File: lib/features/inventory/presentation/widgets/inventory_product_card.dart
// Purpose: Premium animated card for inventory items.
// Layer: Presentation
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../domain/entities/inventory_item.dart';
import 'write_off_dialog.dart';
import '../bloc/inventory_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryProductCard extends StatefulWidget {
  final InventoryItem item;

  const InventoryProductCard({
    super.key,
    required this.item,
  });

  @override
  State<InventoryProductCard> createState() => _InventoryProductCardState();
}

class _InventoryProductCardState extends State<InventoryProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    // Only animate non-OK items
    if (widget.item.status != InventoryStatus.inStock) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Color get _expiryColor {
    final days = widget.item.daysUntilExpiry;
    if (days < 0) return const Color(0xFFD32F2F);
    if (days < 90) return const Color(0xFFF57C00);
    return const Color(0xFF388E3C);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => HapticFeedback.selectionClick(),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _statusColor.withOpacity(0.10),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  // Status stripe
                  Container(width: 5, color: _statusColor),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        children: [
                          _buildTopRow(),
                          const SizedBox(height: 8),
                          const Divider(height: 1),
                          const SizedBox(height: 8),
                          _buildBottomRow(),
                          const SizedBox(height: 12),
                          _buildActionsRow(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopRow() {
    return Row(
      children: [
        // Animated status icon
        ScaleTransition(
          scale: widget.item.status != 'IN STOCK'
              ? _scaleAnimation
              : const AlwaysStoppedAnimation(1.0),
          child: Icon(
            _statusIcon,
            color: _statusColor,
            size: 22,
          ),
        ),
        const SizedBox(width: 10),
        // Product name & barcode
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.productName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Cairo',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.item.barcode ?? 'بدون باركود',
                style: TextStyle(color: Colors.grey[500], fontSize: 11),
              ),
            ],
          ),
        ),
        // Status chip
        _buildStatusChip(),
      ],
    );
  }

  Widget _buildBottomRow() {
    final expiryText = widget.item.closestExpiry != null
        ? '${widget.item.closestExpiry!.day}/${widget.item.closestExpiry!.month}/${widget.item.closestExpiry!.year}'
        : 'غير محدد';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Formatted stock
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('الرصيد',
                style: TextStyle(color: Colors.grey, fontSize: 10, fontFamily: 'Cairo')),
            Text(
              widget.item.formattedStock,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 13, fontFamily: 'Cairo'),
            ),
          ],
        ),
        // Expiry date
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('صالح حتى',
                style: TextStyle(color: Colors.grey, fontSize: 10, fontFamily: 'Cairo')),
            Text(
              expiryText,
              style: TextStyle(
                color: _expiryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
        // Price
        Text(
          '${(widget.item.sellingPrice ?? 0.0).toStringAsFixed(2)} ₪',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF01C653),
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildActionsRow(BuildContext context) {
    return Row(
      children: [
        // Write-off Button
        Expanded(
          child: _ActionButton(
            label: 'تسوية / إتلاف',
            icon: Icons.remove_circle_outline_rounded,
            color: const Color(0xFFFF3D00),
            onTap: () => _showWriteOffDialog(context),
          ),
        ),
        const SizedBox(width: 10),
        // Add Stock Button
        Expanded(
          child: _ActionButton(
            label: 'إضافة رصيد',
            icon: Icons.add_circle_outline_rounded,
            color: const Color(0xFF00C853),
            onTap: () => _showStockDialog(context),
          ),
        ),
      ],
    );
  }

  void _showWriteOffDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => BlocProvider.value(
        value: context.read<InventoryCubit>(),
        child: WriteOffDialog(item: widget.item),
      ),
    );
  }

  void _showStockDialog(BuildContext context) {
    // We can reuse the logic from InventoryScreen or implement here.
    // For now, I'll implement a simple version or trigger the parent's logic if possible.
    // Since this is a standalone card, it's better to have it here or in a shared widget.
    // I'll implement the opening stock dialog here for consistency.
    _showOpeningStockDialog(context);
  }

  void _showOpeningStockDialog(BuildContext context) {
    final qtyCtrl = TextEditingController();
    final costCtrl = TextEditingController();
    DateTime selectedDate = DateTime.now().add(const Duration(days: 365));
    final cubit = context.read<InventoryCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
            ),
            const SizedBox(height: 16),
            const Text('إضافة رصيد افتتاحي',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Cairo')),
            const SizedBox(height: 16),
            TextField(
              controller: qtyCtrl,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              decoration: _dialogInputDecoration('الكمية (حبة / وحدة)', Icons.numbers_rounded),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: costCtrl,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              decoration: _dialogInputDecoration('سعر التكلفة (₪)', Icons.attach_money_rounded),
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('تاريخ انتهاء الصلاحية',
                  style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime.now().subtract(const Duration(days: 1)),
              lastDate: DateTime.now().add(const Duration(days: 3650)),
              onDateChanged: (d) => selectedDate = d,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C853),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  final qty = double.tryParse(qtyCtrl.text) ?? 0;
                  final cost = double.tryParse(costCtrl.text) ?? 0;
                  if (qty > 0) {
                    cubit.addOpeningStock(widget.item.productId, qty, cost, selectedDate);
                    Navigator.pop(ctx);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('✅ تم إضافة الرصيد بنجاح', style: TextStyle(fontFamily: 'Cairo')),
                        backgroundColor: Color(0xFF00C853),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                child: const Text('حفظ الرصيد',
                    style: TextStyle(color: Colors.white, fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _dialogInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13),
      prefixIcon: Icon(icon, color: const Color(0xFF00C853)),
      filled: true,
      fillColor: const Color(0xFFF8F9FA),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    );
  }

  Widget _buildStatusChip() {
    final labels = {
      InventoryStatus.expired: 'منتهي',
      InventoryStatus.outOfStock: 'نفذ',
      InventoryStatus.lowStock: 'نواقص',
      InventoryStatus.nearExpiry: 'قريب الانتهاء',
      InventoryStatus.inStock: 'متوفر',
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _statusColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        labels[widget.item.status] ?? 'غير معروف',
        style: TextStyle(
            color: _statusColor, fontSize: 9, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
      ),
    );
  }

  IconData get _statusIcon {
    switch (widget.item.status) {
      case InventoryStatus.expired:
      case InventoryStatus.outOfStock:
        return Icons.error_outline_rounded;
      case InventoryStatus.lowStock:
        return Icons.trending_down_rounded;
      case InventoryStatus.nearExpiry:
        return Icons.hourglass_bottom_rounded;
      default:
        return Icons.check_circle_outline_rounded;
    }
  }

  Color get _statusColor {
    switch (widget.item.status) {
      case InventoryStatus.expired:
      case InventoryStatus.outOfStock:
        return const Color(0xFFFF3D00);
      case InventoryStatus.lowStock:
        return const Color(0xFFFF9100);
      case InventoryStatus.nearExpiry:
        return const Color(0xFF7C4DFF);
      default:
        return const Color(0xFF00C853);
    }
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withOpacity(0.08),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: color.withOpacity(0.12),
        highlightColor: color.withOpacity(0.05),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.2), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


