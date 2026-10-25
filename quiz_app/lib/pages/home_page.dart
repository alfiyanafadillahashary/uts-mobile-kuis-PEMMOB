import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/app_button.dart';
import '../widgets/responsive_center.dart';
import '../widgets/theme_toggle_button.dart';

// StatefulWidget: menyimpan controller input nama
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _start() {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama tidak boleh kosong')),
      );
      return;
    }
    context.read<QuizProvider>().start(name);
    Navigator.pushNamed(context, '/quiz');
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(actions: const [ThemeToggleButton()]),
      body: ResponsiveCenter(
        child: Column(
          children: [
            Icon(
              Icons.quiz,
              size: Responsive.height(context) * 0.15,
              color: cs.primary,
            ),
            SizedBox(height: Responsive.height(context) * 0.02),
            Text(
              'Kuis Flutter',
              style: TextStyle(
                fontSize: Responsive.sp(context, 28),
                fontWeight: FontWeight.bold,
                color: cs.primary,
              ),
            ),
            SizedBox(height: Responsive.height(context) * 0.01),
            Text(
              'Uji pemahamanmu tentang Flutter!',
              style: TextStyle(fontSize: Responsive.sp(context, 14)),
            ),
            SizedBox(height: Responsive.height(context) * 0.04),
            TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.words,
              style: TextStyle(fontSize: Responsive.sp(context, 16)),
              decoration: InputDecoration(
                labelText: 'Masukkan nama',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onSubmitted: (_) => _start(),
            ),
            SizedBox(height: Responsive.height(context) * 0.03),
            AppButton(
              label: 'Mulai Kuis',
              icon: Icons.play_arrow,
              onPressed: _start,
            ),
          ],
        ),
      ),
    );
  }
}
