import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData? icon;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double? elevation;
  final Duration? animationDuration;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.animationDuration,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final btnStyle = ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(48),
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      foregroundColor: foregroundColor ?? Colors.white,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      textStyle: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w600,
      ),
      elevation: elevation ?? 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      animationDuration: animationDuration ?? const Duration(milliseconds: 250),
    );

    final button = icon != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon),
            label: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            style: btnStyle,
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: btnStyle,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          );

    // 👉 mesmo padding externo do input
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      // 👉 agora ocupa toda a largura “de dentro” do Padding
      child: SizedBox(width: double.infinity, child: button),
    );
  }
}
