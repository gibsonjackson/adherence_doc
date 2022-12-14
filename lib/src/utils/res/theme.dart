import 'package:flutter/material.dart';
import './colors.dart';

final ThemeData THEME_DATA = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: accentColor,
    primaryColor: primaryColor,
    primaryColorDark: primaryDarkColor,
    // scaffoldBackgroundColor: scaffoldBackColor,
  );
}
