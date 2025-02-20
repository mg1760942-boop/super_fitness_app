import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.textColor = Colors.white,
    this.validate = true,
    required this.radius,
    this.textStyle
  });

  final String? text;
  final void Function()? onPressed;
  final Color color;
  final Color? textColor;
  final bool validate;
  final double radius;
 final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: validate ? onPressed : null,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor:
              validate ? color : Colors.grey.shade400, // Disabled color
          minimumSize: const Size(double.infinity, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(
          text ?? '',
          textAlign: TextAlign.center,
          style:textStyle ?? TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Baloo Thambi 2',
            fontWeight: FontWeight.w800,
          ),
        ));
  }
}
