import 'package:flutter/material.dart';

import '../utils/responsive.dart';

/// Reusable widget: memusatkan & membatasi lebar konten (adaptive tablet/web)
/// serta mencegah overflow dengan scroll.
class ResponsiveCenter extends StatelessWidget {
  final Widget child;
  const ResponsiveCenter({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(Responsive.pad(context)),
        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: Responsive.maxContentWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}
