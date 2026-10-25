import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';

/// Reusable widget: tombol dark/light mode (bonus)
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    return IconButton(
      tooltip: 'Ganti tema',
      icon: Icon(quiz.isDark ? Icons.light_mode : Icons.dark_mode),
      onPressed: quiz.toggleTheme,
    );
  }
}
