import 'package:flutter/material.dart';

class MealStatus extends StatelessWidget {
  const MealStatus({super.key, required this.icon, required this.label});
  final IconData icon;

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
