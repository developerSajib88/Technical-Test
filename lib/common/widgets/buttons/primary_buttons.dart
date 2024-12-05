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
          borderRadius: radius4,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Icon(icon, color: Colors.white),

            gap4,

            Text(
              text,
              style: TextStyle(
                color: ColorPalates.defaultWhite,
                fontSize: 8.sp,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
