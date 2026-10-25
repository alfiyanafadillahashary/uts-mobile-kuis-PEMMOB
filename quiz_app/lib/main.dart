import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'pages/quiz_page.dart';
import 'pages/result_page.dart';
import 'providers/quiz_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: const QuizApp(),
    ),
  );
}

// StatelessWidget: root aplikasi
class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<QuizProvider>().isDark;
    return MaterialApp(
      title: 'Kuis Flutter',
      debugShowCheckedModeBanner: false,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/quiz': (_) => const QuizPage(),
        '/result': (_) => const ResultPage(),
      },
    );
  }

  ThemeData _buildTheme(Brightness b) => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins', // font kustom (lihat pubspec.yaml)
        colorSchemeSeed: Colors.indigo,
        brightness: b,
      );
}
