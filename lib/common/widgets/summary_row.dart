import 'package:flutter/material.dart';
import 'package:technical_test/utils/utils.dart';

class SummaryRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const SummaryRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBetween,
      children: [

        Row(
          children: [
            Icon(icon, color: color),
            gap4,
            Text(
              label,
              style: TextStyle(
                fontSize: 8.sp,
                color: Colors.black87,
              ),
            ),
          ],
        ),

        Text(
          value,
          style: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),

      ],
    );
  }
}
