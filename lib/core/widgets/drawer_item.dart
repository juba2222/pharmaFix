// =============================================================
// File: lib/core/widgets/drawer_item.dart
// Purpose: Reusable and atomic UI widget for a singular drawer menu item.
// Layer: Core / Presentation
// Dependencies: material.dart
// =============================================================

import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final bool isSubItem;
  final VoidCallback? onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.isSelected = false,
    this.isSubItem = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: isSubItem ? 32 : 16),
          leading: Icon(icon, color: isSelected ? const Color(0xFF01C653) : Colors.black87),
          title: Text(
            title,
            style: TextStyle(
              color: isSelected ? const Color(0xFF01C653) : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          onTap: onTap,
          dense: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
