import 'package:flutter/material.dart';

extension ContextTheme on BuildContext {
  /// الثيم الأساسي
  ThemeData get theme => Theme.of(this);

  /// مجموعة النصوص (TextTheme)
  TextTheme get textTheme => theme.textTheme;

  /// الألوان (ColorScheme)
  ColorScheme get colors => theme.colorScheme;
}
