import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pos_cubit.dart';
import '../bloc/pos_state.dart';
// Note: We'd normally use the AuthBloc to get userId, and a SessionProvider for sessionId.
// Here we mock userId and sessionId for the processCheckout matching the cubit's expectations.

class CheckoutConfirmLayer extends StatelessWidget {
  const CheckoutConfirmLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: state.status == CheckoutStatus.loading ? null : () => Navigator.pop(context),
              child: const Text('إلغاء', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: state.canConfirm && state.status != CheckoutStatus.loading
                  ? () => _onConfirm(context)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF01C653),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: state.status == CheckoutStatus.loading
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Text('تأكيد البيع', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  void _onConfirm(BuildContext context) {
    // These should ideally come from an Auth/Session context provider.
    // For now we pass placeholder/session values expected by Cubit.
    context.read<PosCubit>().processCheckout(
      sessionId: '1', // Ensure this matches an active int session ID
      userId: '1',
    ).then((_) {
      if (!context.mounted) return;
      if (context.read<PosCubit>().state.status == CheckoutStatus.success) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تمت عملية البيع بنجاح'), backgroundColor: Colors.green),
        );
      } else if (context.read<PosCubit>().state.status == CheckoutStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.read<PosCubit>().state.errorMessage ?? 'فشل البيع'), backgroundColor: Colors.red),
        );
      }
    });
  }
}
