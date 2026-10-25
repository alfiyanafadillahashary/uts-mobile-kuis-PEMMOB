import 'package:flutter/foundation.dart';

import '../data/questions.dart';
import '../models/question.dart';

/// State management dengan Provider (ChangeNotifier).
/// State disimpan di luar widget, sehingga progres jawaban tidak hilang
/// saat layar dirotasi atau berpindah halaman.
class QuizProvider extends ChangeNotifier {
  String _playerName = '';
  int _currentIndex = 0;
  bool _isDark = false;
  final List<int?> _answers = List<int?>.filled(questions.length, null);

  String get playerName => _playerName;
  int get currentIndex => _currentIndex;
  bool get isDark => _isDark;
  List<int?> get answers => List.unmodifiable(_answers);
  int get total => questions.length;
  Question get currentQuestion => questions[_currentIndex];
  int? get selectedAnswer => _answers[_currentIndex];
  bool get isLastQuestion => _currentIndex == total - 1;

  int get score {
    var s = 0;
    for (var i = 0; i < total; i++) {
      if (_answers[i] == questions[i].answerIndex) s++;
    }
    return s;
  }

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void start(String name) {
    _playerName = name.trim();
    _currentIndex = 0;
    _answers.fillRange(0, total, null);
    notifyListeners();
  }

  void selectAnswer(int option) {
    _answers[_currentIndex] = option;
    notifyListeners();
  }

  void next() {
    if (_currentIndex < total - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void reset() {
    _currentIndex = 0;
    _answers.fillRange(0, total, null);
    notifyListeners();
  }
}
