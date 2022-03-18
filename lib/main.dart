import 'dart:ui';

import 'package:flutter/material.dart';
import 'ui/home.dart';
import 'ui/util/colors.dart';

final ThemeData _mortgageTheme = _buildmortgagetheme();

ThemeData _buildmortgagetheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
      primaryColor: primaryIndigo200,
      scaffoldBackgroundColor: secondaryBackgroundWhite,
      hintColor: textOnPrimaryBlack,
      cardColor: secondaryDeepPurple,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: primaryIndigoDark),
      textTheme: _buildmortgagetextheme(base.textTheme),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: primaryIndigoLight),
              borderRadius: BorderRadius.circular(19))),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
          elevation: 10,
          splashColor: primaryIndigoLight,
          backgroundColor: secondaryDeepPurple));
}

_buildmortgagetextheme(TextTheme base) {
  return base.copyWith(bodyText1: TextStyle());
}

void main() {
  runApp(MaterialApp(home: Mortgage(), theme: _mortgageTheme));
}
