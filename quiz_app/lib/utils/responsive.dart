import 'package:flutter/material.dart';

/// Helper ukuran dinamis berbasis MediaQuery (tanpa nilai hardcode per-perangkat).
class Responsive {
  static const double maxContentWidth = 600;

  static double width(BuildContext c) => MediaQuery.sizeOf(c).width;
  static double height(BuildContext c) => MediaQuery.sizeOf(c).height;

  /// Lebar konten efektif (dibatasi agar rapi di tablet / web).
  static double contentWidth(BuildContext c) =>
      width(c) > maxContentWidth ? maxContentWidth : width(c);

  /// Padding relatif terhadap lebar konten.
  static double pad(BuildContext c) => contentWidth(c) * 0.05;

  /// Ukuran font yang menyesuaikan lebar layar.
  static double sp(BuildContext c, double base) =>
      base * (contentWidth(c) / 400).clamp(0.85, 1.4);
}
