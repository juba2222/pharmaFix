// =============================================================
// File: lib/features/pos/presentation/widgets/pos_search_bar.dart
// Purpose: Extracted search bar widget reading from the PosCubit.
// Layer: Presentation (POS)
// Dependencies: flutter, flutter_bloc, pos_cubit.dart
// =============================================================

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pos_cubit.dart';
import '../bloc/pos_state.dart';

class PosSearchBar extends StatefulWidget {
  const PosSearchBar({super.key});

  @override
  State<PosSearchBar> createState() => _PosSearchBarState();
}

class _PosSearchBarState extends State<PosSearchBar> {
  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _controller.text.trim().isNotEmpty) {
        _showOverlay();
      } else if (!_focusNode.hasFocus) {
        _hideOverlay();
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    _hideOverlay();
    super.dispose();
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    final posCubit = context.read<PosCubit>();
    final renderBox = context.findRenderObject() as RenderBox?;
    final width = renderBox?.size.width ?? MediaQuery.of(context).size.width - 32;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0.0, 56.0), // Approximate height of the search bar
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            child: BlocProvider.value(
              value: posCubit,
              child: _buildSearchResultsOverlay(),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _onQueryChanged(String query) {
    print('UI_DEBUG: Query changed to: $query');
    
    if (query.trim().isEmpty) {
      _hideOverlay();
      context.read<PosCubit>().searchProducts('');
      return;
    } else {
      if (_focusNode.hasFocus) {
        _showOverlay();
      }
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 100), () {
      if (mounted) {
        context.read<PosCubit>().searchProducts(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  textDirection: TextDirection.rtl,
                  onChanged: _onQueryChanged,
                  onSubmitted: (value) {
                    context.read<PosCubit>().lookupProduct(value);
                    _controller.clear();
                    _hideOverlay();
                  },
                  decoration: const InputDecoration(
                    hintText: 'ابحث عن منتج أو اقرأ الباركود...',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.qr_code_scanner, color: Color(0xFF01C653)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF01C653),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResultsOverlay() {
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        final query = _controller.text.trim();
        final hasResults = state.productSearchResults.isNotEmpty;
        
        if (query.isEmpty) return const SizedBox.shrink();
        
        if (!hasResults && query.length >= 2) {
           return Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: const Text('لم يتم العثور على نتائج', style: TextStyle(color: Colors.grey), textAlign: TextAlign.right),
          );
        }

        if (!hasResults) return const SizedBox.shrink();

        return Container(
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          constraints: const BoxConstraints(maxHeight: 300),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: state.productSearchResults.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final product = state.productSearchResults[index];
              return ListTile(
                title: Text(
                  product.localName ?? 'No Name',
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  product.barcode ?? 'No Barcode',
                  textAlign: TextAlign.right,
                ),
                trailing: const Icon(Icons.add_circle_outline, color: Color(0xFF01C653)),
                onTap: () {
                  context.read<PosCubit>().selectProduct(product);
                  _controller.clear();
                  _focusNode.unfocus();
                  _hideOverlay();
                  context.read<PosCubit>().searchProducts('');
                },
              );
            },
          ),
        );
      },
    );
  }
}
