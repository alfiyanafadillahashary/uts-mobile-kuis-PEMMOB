import 'package:flutter/material.dart';

import '../utils/responsive.dart';

/// Reusable widget: satu pilihan jawaban
class OptionTile extends StatelessWidget {
  final String letter;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.letter,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(bottom: Responsive.height(context) * 0.015),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(Responsive.pad(context)),
          decoration: BoxDecoration(
            color: selected ? cs.primaryContainer : cs.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? cs.primary : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: Responsive.sp(context, 16),
                backgroundColor: selected ? cs.primary : cs.outlineVariant,
                child: Text(
                  letter,
                  style: TextStyle(
                    color: selected ? cs.onPrimary : cs.onSurface,
                    fontSize: Responsive.sp(context, 14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: Responsive.pad(context)),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: Responsive.sp(context, 15)),
                ),
              ),
              if (selected) Icon(Icons.check_circle, color: cs.primary),
            ],
          ),
        ),
      ),
    );
  }
}
