import 'package:flutter/material.dart';

import '../utils/responsive.dart';

/// Reusable widget: kartu pertanyaan
class QuestionCard extends StatelessWidget {
  final int number;
  final String text;

  const QuestionCard({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Responsive.pad(context) * 1.5),
      decoration: BoxDecoration(
        color: cs.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pertanyaan $number',
            style: TextStyle(
              color: cs.onPrimary.withValues(alpha: 0.8),
              fontSize: Responsive.sp(context, 13),
            ),
          ),
          SizedBox(height: Responsive.height(context) * 0.01),
          Text(
            text,
            style: TextStyle(
              color: cs.onPrimary,
              fontSize: Responsive.sp(context, 18),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
