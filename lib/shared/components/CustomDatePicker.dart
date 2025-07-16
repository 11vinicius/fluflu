import 'package:flutter/material.dart';
import 'package:teste/shared/layout/ColorsTheme.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final String hint;
  final DateTime? selectedDate;
  final bool hasError;
  final String? errorMessage;
  final void Function(DateTime) onDateSelected;
  final bool enable;

  const CustomDatePicker({
    super.key,
    required this.enable,
    required this.label,
    required this.hint,
    required this.selectedDate,
    required this.onDateSelected,
    this.hasError = false,
    this.errorMessage,
  });

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('pt', 'BR'),
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }

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

        final border = OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            color: enable
                ? Colors.grey
                : hasError
                ? ColorsTheme.red
                : ColorsTheme.blue,
          ),
        );

        return Padding(
          padding: padding,
          child: GestureDetector(
            onTap: enable ? null : () => _pickDate(context),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                labelText: label,
                hintText: hint,
                border: border,
                enabledBorder: border,
                focusedBorder: border.copyWith(
                  borderSide: border.borderSide.copyWith(width: 2),
                ),
                errorText: hasError ? errorMessage : null,
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: ColorsTheme.blue,
                ),
                labelStyle: TextStyle(
                  color: enable
                      ? Colors.grey
                      : hasError
                      ? ColorsTheme.red
                      : ColorsTheme.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: Text(
                selectedDate != null
                    ? "${selectedDate!.day.toString().padLeft(2, '0')}/"
                          "${selectedDate!.month.toString().padLeft(2, '0')}/"
                          "${selectedDate!.year}"
                    : hint,
                style: TextStyle(fontSize: fontSize, color: ColorsTheme.blue),
              ),
            ),
          ),
        );
      },
    );
  }
}
