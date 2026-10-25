import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/questions.dart';
import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/app_button.dart';
import '../widgets/responsive_center.dart';
import '../widgets/theme_toggle_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final cs = Theme.of(context).colorScheme;
    final percent = (quiz.score / quiz.total * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Kuis'),
        automaticallyImplyLeading: false,
        actions: const [ThemeToggleButton()],
      ),
      body: ResponsiveCenter(
        child: Column(
          children: [
            Icon(
              percent >= 70 ? Icons.emoji_events : Icons.sentiment_neutral,
              size: Responsive.contentWidth(context) * 0.25,
              color: cs.primary,
            ),
            SizedBox(height: Responsive.height(context) * 0.01),
            Text(
              quiz.playerName,
              style: TextStyle(
                fontSize: Responsive.sp(context, 22),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${quiz.score} / ${quiz.total}',
              style: TextStyle(
                fontSize: Responsive.sp(context, 44),
                fontWeight: FontWeight.bold,
                color: cs.primary,
              ),
            ),
            Text('Skor akhir: $percent%',
                style: TextStyle(fontSize: Responsive.sp(context, 16))),
            SizedBox(height: Responsive.height(context) * 0.03),
            for (var i = 0; i < questions.length; i++)
              Card(
                child: ListTile(
                  leading: Icon(
                    quiz.answers[i] == questions[i].answerIndex
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: quiz.answers[i] == questions[i].answerIndex
                        ? Colors.green
                        : Colors.red,
                  ),
                  title: Text(questions[i].text,
                      style: TextStyle(fontSize: Responsive.sp(context, 13))),
                  subtitle: Text(
                    'Jawaban benar: ${questions[i].options[questions[i].answerIndex]}',
                    style: TextStyle(fontSize: Responsive.sp(context, 12)),
                  ),
                ),
              ),
            SizedBox(height: Responsive.height(context) * 0.02),
            AppButton(
              label: 'Ulangi Kuis',
              icon: Icons.replay,
              onPressed: () {
                quiz.reset();
                Navigator.pushReplacementNamed(context, '/quiz');
              },
            ),
            SizedBox(height: Responsive.height(context) * 0.015),
            AppButton(
              label: 'Ke Beranda',
              icon: Icons.home,
              outlined: true,
              onPressed: () =>
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
            ),
          ],
        ),
      ),
    );
  }
}
