import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pos_cubit.dart';
import '../bloc/pos_state.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildRow('الإجمالي المطلوب:', '\$${state.totalAmount.toStringAsFixed(2)}', Colors.black87),
              if (state.isDebt) ...[
                const Divider(height: 24),
                _buildRow('الدين המستحق:', '\$${state.debt.toStringAsFixed(2)}', Colors.red, isBold: true),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow(String label, String value, Color color, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(value, style: TextStyle(
          fontSize: isBold ? 20 : 24, 
          fontWeight: FontWeight.bold, 
          color: color,
        )),
      ],
    );
  }
}
