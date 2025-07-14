import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/shared/layout/ColorsTheme.dart';

class CustomInputSelect extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool hasError;
  final String? errorMessage;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final List<String> options;
  final String value;

  CustomInputSelect({
    super.key,
    this.validator,
    required this.value,
    required this.options,
    required this.controller,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.hasError = false,
    this.errorMessage,
  });

  late String _selected; // estado interno do dropdown

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
          vertical: width < 350 ? 8 : 10,
          horizontal: 12,
        );

        return Padding(
          padding: padding,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                color: hasError ? ColorsTheme.red : ColorsTheme.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              hintText: hint,
              errorText: hasError ? errorMessage : null,

              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8, right: 4),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    items: options
                        .map(
                          (opt) =>
                              DropdownMenuItem(value: opt, child: Text(opt)),
                        )
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ),
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
