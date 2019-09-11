import 'package:flutter/material.dart';



const Color _buttonPrimaryColor = Color.fromRGBO(95, 6, 0, 1);
//const Color _buttonPrimaryColor = Colors.green;

final ThemeData loyaltyTheme =  ThemeData(
    brightness: Brightness.light,
      primaryColor: _buttonPrimaryColor,
      buttonTheme: ButtonThemeData(
          buttonColor: _buttonPrimaryColor
      )
);
