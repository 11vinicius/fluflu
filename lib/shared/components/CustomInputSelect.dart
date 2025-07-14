import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/shared/layout/ColorsTheme.dart';

class SelectOption {
  final String value;
  final String label;

  const SelectOption({required this.value, required this.label});
}

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
  final List<SelectOption> options;
  final String value;
  final ValueChanged<String>? onChanged;

  CustomInputSelect({
    super.key,
    this.validator,
    required this.onChanged,
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
                    style: const TextStyle(
                      color: ColorsTheme.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    items: options
                        .map(
                          (opt) => DropdownMenuItem(
                            value: opt.value,
                            child: Text(opt.label),
                          ),
                        )
                        .toList(),
                    onChanged: (newValue) {
                      if (newValue != null) {
                        onChanged?.call(newValue);
                      }
                    },
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
