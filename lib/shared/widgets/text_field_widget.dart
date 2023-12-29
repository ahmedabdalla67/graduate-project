import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.validation,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onchanged,
    required this.hintText,
    required this.textInputType,
    this.onSubmitted,
  });

  final String? Function(String?)? validation;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final void Function(String)? onchanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onchanged,
        onFieldSubmitted: onSubmitted,
        keyboardType: textInputType,
        obscureText: obscureText,
        validator: validation,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.grey,
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.grey,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: kFontFamily,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.grey, style: BorderStyle.none),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
