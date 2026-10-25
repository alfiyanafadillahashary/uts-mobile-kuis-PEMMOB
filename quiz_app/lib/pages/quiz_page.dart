import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/app_button.dart';
import '../widgets/option_tile.dart';
import '../widgets/question_card.dart';
import '../widgets/responsive_center.dart';
import '../widgets/theme_toggle_button.dart';

// StatelessWidget: semua state ada di QuizProvider
class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final q = quiz.currentQuestion;
    final progress = (quiz.currentIndex + 1) / quiz.total;

    return Scaffold(
      appBar: AppBar(
        title: Text('Halo, ${quiz.playerName}'),
        actions: const [ThemeToggleButton()],
      ),
      body: ResponsiveCenter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Soal ${quiz.currentIndex + 1} dari ${quiz.total}',
              style: TextStyle(fontSize: Responsive.sp(context, 14)),
            ),
            SizedBox(height: Responsive.height(context) * 0.01),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: Responsive.height(context) * 0.012,
              ),
            ),
            SizedBox(height: Responsive.height(context) * 0.025),
            QuestionCard(number: quiz.currentIndex + 1, text: q.text),
            SizedBox(height: Responsive.height(context) * 0.025),
            for (var i = 0; i < q.options.length; i++)
              OptionTile(
                letter: String.fromCharCode(65 + i),
                text: q.options[i],
                selected: quiz.selectedAnswer == i,
                onTap: () => quiz.selectAnswer(i),
              ),
            SizedBox(height: Responsive.height(context) * 0.02),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'Kembali',
                    icon: Icons.arrow_back,
                    outlined: true,
                    onPressed: quiz.currentIndex == 0 ? null : quiz.previous,
                  ),
                ),
                SizedBox(width: Responsive.pad(context)),
                Expanded(
                  child: AppButton(
                    label: quiz.isLastQuestion ? 'Selesai' : 'Lanjut',
                    icon: quiz.isLastQuestion
                        ? Icons.flag
                        : Icons.arrow_forward,
                    onPressed: quiz.selectedAnswer == null
                        ? null
                        : () {
                            if (quiz.isLastQuestion) {
                              Navigator.pushReplacementNamed(
                                  context, '/result');
                            } else {
                              quiz.next();
                            }
                          },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
