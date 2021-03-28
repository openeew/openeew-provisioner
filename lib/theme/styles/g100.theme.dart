import 'package:openeew_provisioner/theme/carbon.dart';

import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

final _materialTheme = ThemeData(
  scaffoldBackgroundColor: CColors.gray20,
  primaryColor: CColors.blue60,
  accentColor: CColors.gray90,
  disabledColor: CColors.gray80,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: CColors.gray90,
      fontFamily: carbonFonts.get<String>('carbon-font-family'),
    ),
    bodyText2: TextStyle(
      color: CColors.gray90,
      fontFamily: carbonFonts.get<String>('carbon-font-family'),
    ),
    headline1: TextStyle(
      color: CColors.gray90,
      fontFamily: carbonFonts.get<String>('carbon-font-family'),
    ),
    headline2: TextStyle(
      color: CColors.gray90,
      fontFamily: carbonFonts.get<String>('carbon-font-family'),
    ),
    headline3: TextStyle(
      color: CColors.gray90,
      fontFamily: carbonFonts.get<String>('carbon-font-family'),
    ),
    headline4: TextStyle(
      color: CColors.gray90,
      fontFamily: carbonFonts.get<String>('carbon-font-family'),
    ),
    headline5: TextStyle(
      color: CColors.gray90,
      fontFamily: carbonFonts.get<String>('carbon-font-family'),
    ),
    headline6: TextStyle(
      color: CColors.gray90,
      fontFamily: carbonFonts.get<String>('carbon-font-family'),
    ),
  ),
);

final g100 = StyleX({
  'material-theme': _materialTheme,
})
  ..inject(animation)
  ..inject(carbonFonts)
  ..inject(textG100)
  ..inject(textFieldG100)
  ..inject(buttonG100)
  ..inject(formG100)
  ..inject(tileG100)
  ..inject(checkboxG100);
