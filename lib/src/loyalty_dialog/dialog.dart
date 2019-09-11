import 'package:loyalty_app/loyalty_components.dart';
import 'package:loyalty_app/src/loyalty_categories/partnerInfo.dart';

class LoyaltyDialog extends StatefulWidget {

  static void showSuccess(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(S.of(context).label_done),
          content: Text(S.of(context).label_added_successfully),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(S.of(context).label_ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
    );
  }

  static showCustomDialog(BuildContext context, {Partner partner}) {
    Future<VoidCallback> onSubscribeClicked() async {
      var partnerId = partner.id.toString();
      var _subscriptionInfo = await LoyaltyNetwork().sendContextRequest(
          LoyaltyNetworkRequest(
              apiPath: LOYALTY_API.SUBSCRIPTION_ADD + "/" + partnerId,
              requestType: NETWORK_REQUEST_TYPE.POST), context);
      SubscriptionInfo subscriptionInfoObject =
          SubscriptionInfo.fromJson(_subscriptionInfo);
      debugPrint("subscription Object : $subscriptionInfoObject");
      Navigator.of(context).pop('dialog');

      if(_subscriptionInfo!=null){
        showSuccess(context);
      }
    }

    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            S.of(context).subscription_confirmation_lbl,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            S.of(context).subscription_message_lbl,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(102, 102, 102, 1)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        LoyaltyTextField(
                          fontColor: Colors.grey[800],
                          labelText: S.of(context).subscription_subcsription_no_hint,
                          borderColor_focused: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        LoyaltyTextField(
                          fontColor: Colors.grey[800],
                          labelText: S.of(context).subscription_mobile_no_hint,
                          borderColor_focused: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        LoyaltyButton(
                          text: S.of(context).subscription_subscribe_btn,
                          onButtonPressed: onSubscribeClicked,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                        ),
                      ],
                    ),
                  ))

              /*Container(
//                  height: MediaQuery.of(context).size.height*0.6,
//                  width: MediaQuery.of(context).size.width*0.1,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
//                          Container(height: MediaQuery.of(context).size.height*0.6),
                          Container(
                            height: MediaQuery.of(context).size.height*0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                color: Colors.teal),
                          ),
                          /*Positioned(
                              top: 80.0,
                              left: 94.0,
                              child: Container(
                                height: 90.0,
                                width: 90.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45.0),
                                  border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2.0),
                                ),
                              ))*/
                        ],
                      ),

                      SizedBox(height: 15.0),
                      FlatButton(
                          child: Center(
                            child: Text(
                              'OKAY',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14.0,
                                  color: Colors.teal),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.transparent
                      )
                    ],
                  )
              )*/
              );
        });

/*
    Alert(
        context: context,
        title: "LOGIN",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Username',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();*/
  }

  @override
  _LoyaltyDialogState createState() => _LoyaltyDialogState();
}

class _LoyaltyDialogState extends State<LoyaltyDialog> {
  @override
  Widget build(BuildContext context) {
    return Container();

/*
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Stack(
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 10,
                right: 20,
              ),
              margin: EdgeInsets.only(top: 10),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Text(
                    "SDF",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Description",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                      child: Text("buttonText"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )

      ),
    );*/
  }
}
