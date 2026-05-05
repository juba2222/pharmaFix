import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String details;

  const ReportCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(details, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ),
        trailing: Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color)),
      ),
    );
  }
}
