import 'package:flutter/material.dart';

class StylesSettings {
  
  static ThemeData darkTheme(){
    final ThemeData theme =  ThemeData.dark();
    return theme;
  }

  static ThemeData lightTheme(){
    final ThemeData theme = ThemeData.light();
    return theme;
  }

  static ThemeData customeTheme(){
    final ThemeData theme = ThemeData.light();
    return theme.copyWith(
      
    );
  }

}