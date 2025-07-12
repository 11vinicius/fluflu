import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/layout/ColorsTheme.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool hasError;
  final String? errorMessage;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextInput({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.hasError = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final double fontSize = width < 350
            ? 16
            : width < 600
            ? 20
            : 24;

        final EdgeInsets padding = EdgeInsets.symmetric(
          vertical: width < 350 ? 8 : 12,
          horizontal: 12,
        );

        return Padding(
          padding: padding,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            style: TextStyle(fontSize: fontSize),
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              errorText: hasError ? errorMessage : null,
              suffixIcon: suffixIcon != null
                  ? Icon(
                      suffixIcon,
                      color: hasError ? ColorsTheme.red : ColorsTheme.blue,
                    )
                  : null,
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      color: hasError ? ColorsTheme.red : ColorsTheme.blue,
                    )
                  : null,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: hasError ? ColorsTheme.red : ColorsTheme.blue,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: hasError ? ColorsTheme.red : ColorsTheme.blue,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
