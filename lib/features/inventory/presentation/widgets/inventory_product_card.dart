// =============================================================
// File: lib/features/inventory/presentation/widgets/inventory_product_card.dart
// Purpose: Premium animated card for inventory items.
// Layer: Presentation
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../domain/entities/inventory_item.dart';

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


