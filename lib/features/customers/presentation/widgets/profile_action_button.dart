// =============================================================
// File: lib/features/customers/presentation/widgets/profile_action_button.dart
// Purpose: Reusable button for profile actions (Edit, Delete).
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';

class ProfileActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;

  const ProfileActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.textColor,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 18),
            const SizedBox(width: 8),
            Text(
              label, 
              style: TextStyle(
                color: textColor, 
                fontWeight: FontWeight.bold, 
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
