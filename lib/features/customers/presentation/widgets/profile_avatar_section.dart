// =============================================================
// File: lib/features/customers/presentation/widgets/profile_avatar_section.dart
// Purpose: Avatar and basic info section for customer profile.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';
import '../../domain/entities/customer_entity.dart';
import 'profile_action_button.dart';

class ProfileAvatarSection extends StatelessWidget {
  final CustomerEntity customer;

  const ProfileAvatarSection({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: _buildDecoration(),
      child: Stack(
        children: [
          _buildGradientLine(),
          Column(
            children: [
              _buildAvatar(),
              const SizedBox(height: 20),
              _buildName(),
              const SizedBox(height: 4),
              _buildPhone(),
              const SizedBox(height: 32),
              _buildActions(),
            ],
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: const Color(0xFFECEEF1)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.04),
        blurRadius: 30,
        offset: const Offset(0, 8),
      ),
    ],
  );

  Widget _buildGradientLine() => Positioned(
    top: -32, left: -32, right: -32,
    child: Container(
      height: 4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF006E2A).withOpacity(0.1),
            const Color(0xFF006E2A).withOpacity(0.3),
            const Color(0xFF006E2A).withOpacity(0.1),
          ],
        ),
      ),
    ),
  );

  Widget _buildAvatar() => Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: 120, height: 120,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF006E2A).withOpacity(0.1), width: 2),
        ),
        child: const CircleAvatar(
          radius: 56,
          backgroundColor: Color(0xFFF7F9FC),
          backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDDKzKap-izYBVzacXAKYs76Y9WyyVTq03wx7W-ZyPdLydo8E0gQ7JbVhABEkHh1fvvBEHVPpH_A4EmPNTh8188aSfQPZU-5eNUPqQZ_w_GhnEro1QxHNDUtnoZ-RJzguQZm8UkCHBw5kpbL-s0J9qWUNaEMuAkflImaCqVoHNoCljXYE1CmLfMiCXS6QXWCjV857Bo_aF66muEZlWw-xb4OTnMOQxsJKdEU6u-nQ5e35R0YRO-RonQhHSZG7DYMu3cqV4kXyTKgi6-'),
        ),
      ),
      _buildVerifiedBadge(),
    ],
  );

  Widget _buildVerifiedBadge() => Positioned(
    bottom: 4, right: 4,
    child: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF006E2A),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: const Icon(Icons.verified, color: Colors.white, size: 14),
    ),
  );

  Widget _buildName() => Text(
    customer.name, 
    style: const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w900, 
      fontFamily: 'Manrope', color: Color(0xFF191C1E),
    ),
  );

  Widget _buildPhone() => Text(
    customer.phone ?? 'لا يوجد هاتف', 
    style: TextStyle(
      color: const Color(0xFF3C4A3C).withOpacity(0.7), 
      fontSize: 14, fontWeight: FontWeight.w600,
    ),
  );

  Widget _buildActions() => Row(
    children: [
      Expanded(
        child: ProfileActionButton(
          label: 'تعديل', icon: Icons.edit,
          textColor: const Color(0xFF3C4A3C),
          borderColor: const Color(0xFFBBCBB8),
          onTap: () {},
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: ProfileActionButton(
          label: 'حذف', icon: Icons.delete,
          textColor: const Color(0xFFBA1A1A),
          borderColor: const Color(0xFFBA1A1A).withOpacity(0.2),
          onTap: () {},
        ),
      ),
    ],
  );
}
