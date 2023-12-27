import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = 325,
    this.fontSize = 20,
    this.height = 50,
    this.color = kMainColor,
    this.textButtonColor = Colors.white,
  });
  final void Function() onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? color;
  final Color? textButtonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        color: color,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: textButtonColor,
              fontFamily: 'Baloo2',
              fontSize: fontSize,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
