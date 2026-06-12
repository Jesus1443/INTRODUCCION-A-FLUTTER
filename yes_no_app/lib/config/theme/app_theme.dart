import 'package:flutter/material.dart';

const List<Color> _colorSeeds = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor=0})
    : assert(selectedColor >= 0 && selectedColor < _colorSeeds.length, 'Selected color index must be between 0 and ${_colorSeeds.length - 1}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorSeeds[selectedColor],
    );
  }
}