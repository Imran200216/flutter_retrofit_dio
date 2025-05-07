import 'package:flutter/widgets.dart';

/// Vertical space
class AppVerticalSpacer extends StatelessWidget {
  final double height;

  const AppVerticalSpacer(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

/// Horizontal space
class AppHorizontalSpacer extends StatelessWidget {
  final double width;

  const AppHorizontalSpacer(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
