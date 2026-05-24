// =============================================================
// File: lib/features/suppliers/presentation/widgets/purchase_product_search.dart
// Purpose: TypeAhead search field for products in purchase invoice.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../../../core/di/injection_container.dart';
import '../../../inventory/domain/models/drug_suggestion_model.dart';
import '../../../inventory/domain/repositories/i_inventory_repository.dart';
import '../cubit/purchase_invoice_cubit.dart';
import 'item_entry_dialog.dart';

class PurchaseProductSearch extends StatelessWidget {
  const PurchaseProductSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TypeAheadField<DrugSuggestionModel>(
        suggestionsCallback: (pattern) async {
          final results = await sl<IInventoryRepository>().searchDrugSuggestions(pattern);
          if (pattern.isNotEmpty && !results.any((r) => r.name.toLowerCase() == pattern.toLowerCase())) {
            results.add(DrugSuggestionModel(
              id: 'new-${DateTime.now().millisecondsSinceEpoch}',
              name: pattern,
              source: DrugSource.newDrug,
              units: const [SuggestionUnit(name: 'علبة', conversionFactor: 1.0)],
            ));
          }
          return results;
        },
        itemBuilder: (context, suggestion) => ListTile(
          title: Text(suggestion.name),
          subtitle: Text(suggestion.barcode ?? ''),
          trailing: suggestion.source == DrugSource.local 
              ? const Icon(Icons.check_circle, color: Colors.green, size: 16) 
              : (suggestion.source == DrugSource.master 
                  ? const Icon(Icons.cloud_outlined, color: Colors.blue, size: 16)
                  : const Icon(Icons.add_circle_outline, color: Colors.red, size: 16)),
        ),
        onSelected: (s) => showDialog(context: context, builder: (_) => ItemEntryDialog(suggestion: s, cubit: context.read<PurchaseInvoiceCubit>())),
        builder: (context, controller, focusNode) => TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: const InputDecoration(hintText: 'ابحث عن منتج...', prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
        ),
      ),
    );
  }
}
