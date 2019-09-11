import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoyaltyTextField extends StatefulWidget {
  Widget suffixIcon; //could be Icon, or IconButton,...
  Color suffixIconColor;
  Color fontColor;
  String labelText;
  String hintText;
  TextStyle labelStyle;
  TextStyle hintStyle;
  bool isPassword;
  TextInputType keyboardType;
  Color borderColor_focused;
  TextEditingController controller;

  LoyaltyTextField(
      {this.suffixIcon,
      this.suffixIconColor,
      this.fontColor,
      this.labelText,
      this.hintText,
      this.labelStyle,
      this.hintStyle,
      this.keyboardType,
      this.isPassword = false,
      this.controller,
      this.borderColor_focused = Colors.white});

  @override
  _LoyaltyTextFieldState createState() => _LoyaltyTextFieldState(this);
}

class _LoyaltyTextFieldState extends State<LoyaltyTextField> {
  LoyaltyTextField _field;
  bool _hidePassword = false;

  @override
  void initState() {
    _hidePassword = _field.isPassword;
  } //  //  labelStyle: TextStyle(color: this._field.fontColor?? Colors.white),

////  hintStyle: TextStyle(color: this._field.fontColor?? Colors.grey[400],fontWeight: FontWeight.w400),
////  labelText: 'Subscription No',
////  hintText: "Enter your subscription no",
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this._field.controller,
      keyboardType: this._field.keyboardType,
      obscureText: _hidePassword,
      style: TextStyle(color: this._field.fontColor ?? Colors.white),
      decoration: new InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: _LoyaltyTextFieldBorder(borderColor: Colors.blue),
        enabledBorder: _LoyaltyTextFieldBorder(borderColor: Colors.grey),
        focusedBorder: _LoyaltyTextFieldBorder(
            borderColor: this._field.borderColor_focused),
        errorBorder: new _LoyaltyTextFieldBorder(borderColor: Colors.grey),
        labelStyle: this._field.labelStyle ??
            TextStyle(color: this._field.fontColor ?? Colors.white),
        hintStyle: this._field.hintStyle ??
            TextStyle(
                color: this._field.fontColor ?? Colors.grey[400],
                fontWeight: FontWeight.w400),
        labelText: this._field.labelText,
        hintText: this._field.hintText,
        suffixIcon: this._field.isPassword
            ? IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  FontAwesomeIcons.eye,
                  color: this._field.suffixIconColor ?? Colors.white,
                  size: 15,
                ),
                onPressed: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
              )
            : this._field.suffixIcon,
      ),
    );
  }

  _LoyaltyTextFieldState(LoyaltyTextField field) {
    _field = field;
  }
}

class _LoyaltyTextFieldBorder extends OutlineInputBorder {
  BorderRadius _borderRadius = BorderRadius.circular(10);
  double _gapPadding = 4;
  Color borderColor = Colors.white;
  BorderSide _borderSide =
      BorderSide(style: BorderStyle.solid, color: Colors.green, width: 1);

  BorderSide get borderSide => _borderSide;

  set borderSide(BorderSide value) {
    _borderSide = value;
  }

  double get gapPadding => _gapPadding;

  set gapPadding(double value) {
    _gapPadding = value;
  }

  BorderRadius get borderRadius => _borderRadius;

  set borderRadius(BorderRadius value) {
    _borderRadius = value;
  }

  _LoyaltyTextFieldBorder({borderSide, borderRadius, gapPadding, borderColor}) {
    if (borderSide != null) {
      this.borderSide = borderSide;
    }
    if (borderColor != null) {
      this.borderSide = BorderSide(
          color: borderColor,
          width: this.borderSide.width,
          style: this.borderSide.style);
    }
  }
}
