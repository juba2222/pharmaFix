// =============================================================
// File: lib/features/customers/presentation/widgets/profile_app_bar.dart
// Purpose: Custom AppBar for Customer Profile Screen.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';
import 'dart:ui';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF7F9FC).withOpacity(0.8),
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.transparent),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF191C1E)),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'تفاصيل العميل', 
        style: TextStyle(
          color: Color(0xFF191C1E), 
          fontWeight: FontWeight.w800, 
          fontSize: 18,
          fontFamily: 'Manrope',
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Color(0xFF191C1E)),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
