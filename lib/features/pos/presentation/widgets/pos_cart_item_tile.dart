// =============================================================
// File: lib/features/pos/presentation/widgets/pos_cart_item_tile.dart
// Purpose: Refactored clean tile using atomic components with Unit switching.
// Layer: Presentation (POS)
// =============================================================

import 'package:flutter/material.dart';
import '../../domain/entities/sale_item_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pos_cubit.dart';
import 'pos_item_quantity_selector.dart';
import 'pos_item_price_field.dart';

class PosCartItemTile extends StatefulWidget {
  final SaleItemEntity item;
  const PosCartItemTile({super.key, required this.item});

  @override
  State<PosCartItemTile> createState() => _PosCartItemTileState();
}

class _PosCartItemTileState extends State<PosCartItemTile> {
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController(text: widget.item.finalUnitPrice.toStringAsFixed(2));
  }

  @override
  void didUpdateWidget(PosCartItemTile old) {
    super.didUpdateWidget(old);
    if (old.item.finalUnitPrice != widget.item.finalUnitPrice) {
      _priceController.text = widget.item.finalUnitPrice.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PosCubit>();
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(children: [
        _buildHeader(cubit),
        if (widget.item.availableUnits.length > 1) ...[
          const SizedBox(height: 12),
          _buildUnitSelector(cubit),
        ],
        const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(height: 1)),
        _buildFooter(),
      ]),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      );

  Widget _buildHeader(PosCubit cubit) => Row(children: [
        PosItemQuantitySelector(
          quantity: widget.item.quantity,
          onIncrement: () => cubit.updateItemQuantity(widget.item.unitId, widget.item.quantity + 1),
          onDecrement: () => cubit.updateItemQuantity(widget.item.unitId, widget.item.quantity - 1),
        ),
        const SizedBox(width: 12),
        _itemInfo(),
      ]);

  Widget _buildUnitSelector(PosCubit cubit) {
    // Deduplicate units by name (trimmed) to avoid repeated labels
    final uniqueUnits = <String, SaleUnitInfo>{};
    for (var unit in widget.item.availableUnits) {
      final nameTrimmed = unit.name.trim();
      // Only add if we haven't seen this unit name before
      if (!uniqueUnits.containsKey(nameTrimmed)) {
        uniqueUnits[nameTrimmed] = unit;
      }
    }

    if (uniqueUnits.length <= 1) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: uniqueUnits.values.map((unit) {
          final isSelected = widget.item.unitId == unit.id;
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ChoiceChip(
              label: Text(unit.name, style: TextStyle(
                fontSize: 12, 
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              )),
              selected: isSelected,
              onSelected: (val) {
                if (val) {
                  cubit.changeItemUnit(widget.item.productId, unit.id);
                }
              },
              selectedColor: const Color(0xFF01C653),
              backgroundColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              side: BorderSide(color: isSelected ? Colors.transparent : Colors.grey.shade300),
              visualDensity: VisualDensity.compact,
            ),
          );
        }).toList().reversed.toList(),
      ),
    );
  }

  Widget _itemInfo() => Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(widget.item.productName, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          const SizedBox(height: 4),
          _priceRow(),
        ]),
      );

  Widget _priceRow() => Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        if (widget.item.appliedDiscount > 0) _discountBadge(),
        Text('الأساسي للوحدة: ${widget.item.originalUnitPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ]);

  Widget _discountBadge() => Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(4)),
        child: Text('خصم: ${widget.item.appliedDiscount.toStringAsFixed(2)}', style: TextStyle(fontSize: 11, color: Colors.red.shade700, fontWeight: FontWeight.w600)),
      );

  Widget _buildFooter() => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('الإجمالي', style: TextStyle(fontSize: 11, color: Color(0xFF71717A))),
          Text('${widget.item.subtotal.toStringAsFixed(2)} ر.س', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Color(0xFF01C653))),
        ]),
        Row(children: [
          const Text('سعر الوحدة:', style: TextStyle(fontSize: 12, color: Color(0xFF71717A))),
          const SizedBox(width: 8),
          PosItemPriceField(
              controller: _priceController,
              onPriceChanged: (p) => context.read<PosCubit>().updateItemPrice(widget.item.unitId, p)),
        ]),
      ]);
}
