import 'package:flutter/material.dart';

class LoyaltySearchInput extends StatefulWidget {
  String label;
  TextDecoration customDecoration;
  IconData icon;

  @override
  _LoyaltySearchInputState createState() => _LoyaltySearchInputState(this);

  LoyaltySearchInput({
    @required this.label,
    this.customDecoration,
    this.icon = Icons.search});
}

class _LoyaltySearchInputState extends State<LoyaltySearchInput> {

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = new OutlineInputBorder(
      borderSide: BorderSide(
          style: BorderStyle.none, width: 0, color: Colors.green),
      borderRadius: BorderRadius.circular(15),
    );

    return
      Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: TextField(
            decoration: new InputDecoration(
              hintText: loyaltySearchInput.label,
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(
                loyaltySearchInput.icon, color: Colors.grey[600],),
              border: inputBorder,
              focusedBorder: inputBorder.copyWith(borderSide: BorderSide(width: 1,color: Colors.grey)),
              disabledBorder: inputBorder,
              enabledBorder: inputBorder,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              fillColor: Colors.grey[200],
              filled: true
              ,
            ),
          )
      );
  }

  LoyaltySearchInput loyaltySearchInput;
  _LoyaltySearchInputState(LoyaltySearchInput i) {
    loyaltySearchInput = i;
  }
}
