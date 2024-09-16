import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final TextInputType inputType;
  final IconData? prefixIcon;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomTextField({super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.inputType = TextInputType.text,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.backgroundColor = const Color(0xFFD0E2F2), // Default light blue
    this.borderRadius =
        const BorderRadius.all(Radius.circular(30)), // Default rounded border
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      // Optional padding for the TextField itself
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        validator: validator,
        style: const TextStyle(
            fontFamily: 'Helvetica',
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            color: Color(0xFF315D80)),
        maxLines: 1,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          // Custom background color
          hintText: hintText,
          labelText: labelText,

          hintStyle: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              color: Color(0xFF315D80)

              // Optionally, set a different color for the hint
              ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          contentPadding: padding,
          // Custom padding for inner content
          border: OutlineInputBorder(
            borderRadius: borderRadius, // Custom rounded corners
            borderSide: BorderSide.none, // Remove border side
          ),
        ),
      ),
    );
  }
}
