import 'package:flutter/material.dart';

/**
 * TODO: Need to fix style for button with icon
 */

class LoyaltyButton extends StatefulWidget {
  final Color buttonColor;
  final String text;
  final TextStyle textStyle;
  final Icon icon;
  final VoidCallback onButtonPressed;
  final Image image;


  LoyaltyButton({this.buttonColor, this.text, this.textStyle, this.icon,
    this.onButtonPressed, this.image});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoyaltyButtonState(this);
  }

}

class LoyaltyButtonState extends State<LoyaltyButton> {
  LoyaltyButton button;

  LoyaltyButtonState(this.button);

  @override
  Widget build(BuildContext context) {
    var buttonContent = null;
    Text buttonText = new Text(this.button.text,
        textAlign: TextAlign.center,
        style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18)
            .merge(this.button.textStyle));

    if (this.button.icon == null && this.button.image == null) {
      return
        Container(
          child: Material(
              borderRadius: BorderRadius.circular(12.0),
              color: (this.button.buttonColor != null)
                  ? this.button.buttonColor
                  : Theme
                  .of(context)
                  .primaryColor,
              child: MaterialButton(
                  minWidth: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: EdgeInsets.all(10),
                  onPressed: this.button.onButtonPressed,
                  child: buttonText
              )
          ),
        );
    } else if (this.button.icon != null && this.button.image == null) {
      return Container(width: MediaQuery
          .of(context)
          .size
          .width,
        decoration: BoxDecoration(
            color: (this.button.buttonColor != null)
                ? this.button.buttonColor
                : Theme
                .of(context)
                .primaryColor,
            borderRadius: BorderRadius.circular(12)),
        child: FlatButton.icon(
          color: (this.button.buttonColor != null)
              ? this.button.buttonColor
              : Theme
              .of(context)
              .primaryColor,
          padding: EdgeInsets.symmetric(vertical: 10),
          icon: this.button.icon,
          label: buttonText,
          onPressed: this.button.onButtonPressed,
        ),);
    } else if (this.button.image != null && this.button.icon == null) {
      return
        new GestureDetector(
            onTap: this.button.onButtonPressed,
            child: Container(width: MediaQuery
                .of(context)
                .size
                .width,
                decoration: BoxDecoration(
                    color: (this.button.buttonColor != null)
                        ? this.button.buttonColor
                        : Theme
                        .of(context)
                        .primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: new Row(
                    children: <Widget>[
                      Container(
                        child: FlatButton(


//          (this.button.buttonColor != null)
//              ? this.button.buttonColor
//              : Theme
//              .of(context)
//              .primaryColor,
//                  padding: EdgeInsets.symmetric(vertical: 10),
                          child: this.button.image,
//                  label: buttonText,
                          onPressed: this.button.onButtonPressed,
                        ),
                        width: 60,
                      ),
                      buttonText,
                    ])
            )
        );
    } else {
      return Text("You should only use image or icon for the button");
    }
  }
}
