import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffix,
    required this.keyboardType,
    this.isSecure = false,
    this.controller,
    this.validator,
  });
  final String hintText;
  //final Widget keyboardType;
  final TextInputType keyboardType;
  final Widget? suffix;
  final bool isSecure;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isSecure,
      obscuringCharacter: "*",
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hintText .';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffix,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
      ),
    );
  }
}
