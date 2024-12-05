import 'package:flutter/material.dart';

class TotalsDisplay extends StatelessWidget {
  final int totalEnteredValue;
  final int totalPreFiledValue;

  const TotalsDisplay({
    super.key,
    required this.totalEnteredValue,
    required this.totalPreFiledValue,
  });

  @override
  Widget build(BuildContext context) {
    final totalSum = totalEnteredValue + totalPreFiledValue;

    return Card(
      color: Colors.grey[100],
      //elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.edit, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      "Entered Sum:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Text(
                  "$totalEnteredValue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.file_copy, color: Colors.orange),
                    const SizedBox(width: 8),
                    Text(
                      "Pre-filed Sum:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Text(
                  "$totalPreFiledValue",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange[800],
                  ),
                ),
              ],
            ),
            const Divider(height: 32, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calculate, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(
                      "Total Sum:",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  "$totalSum",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
