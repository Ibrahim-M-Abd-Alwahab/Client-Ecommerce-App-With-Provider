import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  Widget? suffix;
  Widget? prefixIcon;
  TextEditingController controller;
  final String title;
  final Function validator;
  final TextInputType? keyboardType;

  CustomTextField({
    required this.title,
    required this.validator,
    required this.controller,
    this.keyboardType,
    this.suffix,
    this.prefixIcon,
    required InputDecoration decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: (x) => validator(x),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffix,
          hintText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
