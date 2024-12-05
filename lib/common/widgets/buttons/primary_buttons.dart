import 'package:flutter/material.dart';
import 'package:technical_test/common/widgets/buttons/widget_bounce.dart';
import 'package:technical_test/utils/utils.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return WidgetBounce(
      onPressed: onPressed,
      duration: const Duration(milliseconds: 100),
      child: Container(
        width: 1.sw,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorPalates.primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
