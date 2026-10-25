import 'package:flutter/material.dart';

import '../utils/responsive.dart';

/// Reusable widget: tombol utama
class AppButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool outlined;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      minimumSize: WidgetStatePropertyAll(
        Size.fromHeight(Responsive.height(context) * 0.07),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: Responsive.sp(context, 16),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
    final text = Text(label);
    if (outlined) {
      return icon == null
          ? OutlinedButton(onPressed: onPressed, style: style, child: text)
          : OutlinedButton.icon(
              onPressed: onPressed, style: style, icon: Icon(icon), label: text);
    }
    return icon == null
        ? FilledButton(onPressed: onPressed, style: style, child: text)
        : FilledButton.icon(
            onPressed: onPressed, style: style, icon: Icon(icon), label: text);
  }
}
