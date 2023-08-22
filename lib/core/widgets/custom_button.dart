import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      this.borderRadius,
      required this.textColor,
      required this.backgroundColor, this.onPressed})
      : super(key: key);
  final String title;
  final BorderRadius? borderRadius;
  final Color textColor;
  final Color backgroundColor;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(20))),
      child: Text(
        title,
        style: Styles.textStyle18.copyWith(color: textColor),
      ),
    );
  }
}
//0xffEF8262
