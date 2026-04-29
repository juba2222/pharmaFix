// =============================================================
// File: lib/features/inventory/presentation/inventory_screen.dart
// Purpose: Full Inventory Screen with search, sort, filter & stock dialog.
// Layer: Presentation
// =============================================================

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/inventory_cubit.dart';
import 'bloc/inventory_state.dart';
import 'widgets/inventory_product_card.dart';
import 'add_product_screen.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final _searchController = TextEditingController();
  InventorySort _currentSort = InventorySort.name;
  bool _ascending = true;

  @override
  void initState() {
    super.initState();
    context.read<InventoryCubit>().loadInventory();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: BlocListener<InventoryCubit, InventoryState>(
        listener: (ctx, state) {
          if (state is InventoryError) {
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
          if (state is InventoryLoaded && state.items.isNotEmpty) {
            // Show success SnackBar after adding stock
          }
        },
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(),
              SliverToBoxAdapter(child: _buildStatsRow()),
              SliverToBoxAdapter(child: _buildToolbar()),
              _buildList(),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFab(),
    );
  }

  // ── AppBar with collapsible search ─────────────────────────
  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 130,
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text('المخزن الذكي',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontFamily: 'Cairo')),
      actions: [
        // Barcode scanner button
        IconButton(
          icon: const Icon(Icons.qr_code_scanner_rounded, color: Colors.black87),
          tooltip: 'مسح باركود',
          onPressed: _showBarcodeInputDialog,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 56, left: 16, right: 16, bottom: 10),
            child: TextField(
              controller: _searchController,
              onChanged: (v) => context.read<InventoryCubit>().search(v),
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'ابحث عن دواء أو باركود...',
                hintTextDirection: TextDirection.rtl,
                prefixIcon: const Icon(Icons.search, color: Color(0xFF01C653)),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          context.read<InventoryCubit>().search('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: const Color(0xFFF1F3F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Horizontal Stats Row ────────────────────────────────────
  Widget _buildStatsRow() {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (ctx, state) {
        int total = 0, expired = 0, near = 0, low = 0, empty = 0;
        if (state is InventoryLoaded) {
          final cubit = ctx.read<InventoryCubit>();
          total = state.items.length;
          expired = cubit.getExpiredCount(state.items);
          near = cubit.getNearExpiryCount(state.items);
          low = cubit.getLowStockCount(state.items);
          empty = cubit.getOutOfStockCount(state.items);
        }
        return SizedBox(
          height: 115,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            physics: const BouncingScrollPhysics(),
            children: [
              _StatCard(label: 'إجمالي', value: '$total', color: const Color(0xFF1565C0), icon: Icons.inventory_2_outlined),
              _StatCard(label: 'منتهية', value: '$expired', color: const Color(0xFFD32F2F), icon: Icons.event_busy_rounded),
              _StatCard(label: 'قريب الانتهاء', value: '$near', color: const Color(0xFFF57C00), icon: Icons.hourglass_bottom_rounded),
              _StatCard(label: 'نواقص', value: '$low', color: const Color(0xFF546E7A), icon: Icons.trending_down_rounded),
              _StatCard(label: 'منعدم', value: '$empty', color: const Color(0xFF6A1B9A), icon: Icons.remove_shopping_cart_rounded),
            ],
          ),
        );
      },
    );
  }

  // ── Toolbar: Sort + Low-stock filter ───────────────────────
  Widget _buildToolbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          // Sort dropdown
          Expanded(
            child: DropdownButtonFormField<InventorySort>(
              value: _currentSort,
              decoration: InputDecoration(
                labelText: 'ترتيب حسب',
                labelStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 12),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              items: const [
                DropdownMenuItem(value: InventorySort.name, child: Text('الاسم', style: TextStyle(fontFamily: 'Cairo', fontSize: 13))),
                DropdownMenuItem(value: InventorySort.lowStock, child: Text('الكمية', style: TextStyle(fontFamily: 'Cairo', fontSize: 13))),
                DropdownMenuItem(value: InventorySort.closestExpiry, child: Text('تاريخ الصلاحية', style: TextStyle(fontFamily: 'Cairo', fontSize: 13))),
              ],
              onChanged: (sort) {
                if (sort == null) return;
                setState(() => _currentSort = sort);
                context.read<InventoryCubit>().changeSort(sort);
              },
            ),
          ),
          const SizedBox(width: 12),
          // Ascending / Descending toggle
          GestureDetector(
            onTap: () {
              HapticFeedback.selectionClick();
              setState(() => _ascending = !_ascending);
              context.read<InventoryCubit>().changeSort(_currentSort, ascending: _ascending);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF1565C0).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF1565C0).withOpacity(0.3)),
              ),
              child: Row(children: [
                AnimatedRotation(
                  turns: _ascending ? 0.0 : 0.5,
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(Icons.sort_rounded, color: Color(0xFF1565C0), size: 20),
                ),
                const SizedBox(width: 4),
                Text(
                  _ascending ? 'تصاعدي' : 'تنازلي',
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    color: Color(0xFF1565C0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // ── Product List ────────────────────────────────────────────
  Widget _buildList() {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (ctx, state) {
        if (state is InventoryLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, __) => _ShimmerCard(),
              childCount: 5,
            ),
          );
        }
        if (state is InventoryLoaded) {
          if (state.items.isEmpty) {
            return const SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.inventory_2_outlined, size: 56, color: Colors.grey),
                    SizedBox(height: 12),
                    Text('لا توجد نتائج', style: TextStyle(fontFamily: 'Cairo', color: Colors.grey)),
                  ],
                ),
              ),
            );
          }
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => InventoryProductCard(item: state.items[i]),
                childCount: state.items.length,
              ),
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }

  // ── FAB: Add New Product ──────────────────────────────────
  Widget _buildFab() {
    return FloatingActionButton.extended(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: context.read<InventoryCubit>(),
            child: const AddProductScreen(),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF01C653),
      icon: const Icon(Icons.add_business_rounded, color: Colors.white),
      label: const Text('إضافة دواء جديد',
          style: TextStyle(color: Colors.white, fontFamily: 'Cairo', fontWeight: FontWeight.bold)),
    );
  }

  // ── Barcode Input Dialog ────────────────────────────────────
  void _showBarcodeInputDialog() {
    final barcodeCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('إدخال باركود', style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold)),
        content: TextField(
          controller: barcodeCtrl,
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: 'أدخل رقم الباركود...', prefixIcon: Icon(Icons.qr_code)),
          onSubmitted: (v) {
            Navigator.pop(ctx);
            _searchController.text = v;
            context.read<InventoryCubit>().search(v);
          },
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('إلغاء', style: TextStyle(fontFamily: 'Cairo'))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF01C653)),
            onPressed: () {
              Navigator.pop(ctx);
              _searchController.text = barcodeCtrl.text;
              context.read<InventoryCubit>().search(barcodeCtrl.text);
            },
            child: const Text('بحث', style: TextStyle(color: Colors.white, fontFamily: 'Cairo')),
          ),
        ],
      ),
    );
  }

  // ── Opening Stock Dialog ────────────────────────────────────
  void _showStockDialog(BuildContext context, String? productId) {
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
          left: 20, right: 20, top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 16),
            const Text('إضافة رصيد افتتاحي',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Cairo')),
            const SizedBox(height: 16),
            TextField(
              controller: qtyCtrl,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              decoration: _inputDecoration('الكمية (حبة / وحدة)', Icons.numbers_rounded),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: costCtrl,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              decoration: _inputDecoration('سعر التكلفة (₪)', Icons.attach_money_rounded),
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
                  backgroundColor: const Color(0xFF01C653),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  final qty = double.tryParse(qtyCtrl.text) ?? 0;
                  final cost = double.tryParse(costCtrl.text) ?? 0;
                  // Capture BEFORE pop to avoid deactivated widget error
                  final messenger = ScaffoldMessenger.of(context);
                  if (qty > 0 && productId != null) {
                    cubit.addOpeningStock(productId, qty, cost, selectedDate);
                  }
                  Navigator.pop(ctx);
                  messenger.showSnackBar(
                    const SnackBar(
                      content: Text('✅ تم إضافة الرصيد بنجاح', style: TextStyle(fontFamily: 'Cairo')),
                      backgroundColor: Color(0xFF01C653),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
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

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontFamily: 'Cairo'),
      prefixIcon: Icon(icon, color: const Color(0xFF01C653)),
      filled: true,
      fillColor: const Color(0xFFF8F9FA),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    );
  }
}

// ── Stat Card Widget ────────────────────────────────────────
class _StatCard extends StatelessWidget {
  final String label, value;
  final Color color;
  final IconData icon;

  const _StatCard({required this.label, required this.value, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.15), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 18, color: color),
              Text(value, style: TextStyle(color: color, fontSize: 26, fontWeight: FontWeight.bold)),
            ],
          ),
          const Spacer(),
          Text(label,
              style: TextStyle(color: color.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.bold, fontFamily: 'Cairo')),
        ],
      ),
    );
  }
}

// ── Shimmer Placeholder ─────────────────────────────────────
class _ShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
