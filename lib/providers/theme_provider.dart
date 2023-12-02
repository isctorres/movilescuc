import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  
  ThemeData? _theme;
  gettheme() => this._theme;
  settheme(ThemeData theme){
    this._theme = theme;
    notifyListeners();
  }

}