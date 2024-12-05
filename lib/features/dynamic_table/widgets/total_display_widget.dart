import 'package:flutter/material.dart';
import 'package:technical_test/common/widgets/summary_row.dart';
import 'package:technical_test/utils/constants/ui_constants.dart';

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
      margin: padding6,
      child: Padding(
        padding: padding8,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [

            SummaryRow(
                icon: Icons.edit,
                label: "Entered Sum:",
                value: totalEnteredValue.toString(),
                color: Colors.blue
            ),

            gap6,

            SummaryRow(
                icon: Icons.file_copy,
                label: "Pre-filed Sum:",
                value: totalPreFiledValue.toString(),
                color: Colors.orange
            ),

            const Divider(height: 32, thickness: 1),

            SummaryRow(
                icon: Icons.calculate,
                label: "Total Sum:",
                value: totalSum.toString(),
                color: Colors.green
            ),

          ],
        ),
      ),
    );
  }
}
