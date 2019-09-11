import 'package:loyalty_app/loyalty_components.dart';

class LoginRegistrationScreen extends StatefulWidget {
  @override
  _LoginRegistrationScreenState createState() =>
      _LoginRegistrationScreenState();
}

class _LoginRegistrationScreenState extends State<LoginRegistrationScreen> {
  void _continue_with_facebook() {
    debugPrint("Continue with Facebook");
  }

  void _continue_with_google() {
    debugPrint("Continue with Google");
  }

  void _signup_email() {
    debugPrint("Continue with Email");
    Navigator.pushNamed(context, '/RegisterEmailPassword');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
//      padding: EdgeInsets.symmetric(
//          vertical: MediaQuery.of(context).size.height * 0.1),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(
              "assets/images/background_login_registration.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: ListView(children: <Widget>[
        Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05),
            child: Image.asset(
              'assets/images/loyalty_app_logo.png',
              width: MediaQuery.of(context).size.width / 3,
            ),
          )
        ]),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: new LoyaltyButton(
                  text: S.of(context).sign_up_facebook_btn,
                  image: new Image.asset(
                    'assets/images/icons/facebook_button.png',
                    fit: BoxFit.fitWidth,
                    height: 20,
//                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  buttonColor: Colors.white,
                  textStyle: TextStyle(
                      color: Color.fromRGBO(59, 89, 152, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  onButtonPressed: _continue_with_facebook,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: new LoyaltyButton(
                  text: S.of(context).sign_up_google_btn,
//                  icon: Icon(FontAwesomeIcons.google),
                  image: new Image.asset(
                    'assets/images/icons/google_button.png',
                    fit: BoxFit.fitWidth,
                    width: 20,
                  ),
                  buttonColor: Colors.white,
                  textStyle: TextStyle(
                      color: Color.fromRGBO(59, 59, 59, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  onButtonPressed: _continue_with_google,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(children: <Widget>[
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      S.of(context).or_lbl,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Material(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(width: 1, color: Colors.grey)),
                  child: new LoyaltyButton(
                    text: S.of(context).sign_up_email_lbl,
                    buttonColor: Colors.transparent,
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                    onButtonPressed: _signup_email,
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  heightFactor: MediaQuery.of(context).size.height * 0.005,
//                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        S.of(context).exist_user_lbl,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      new GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/LoginEmailPasswordScreen');
                        },
                        child: Text(S.of(context).login_now_lbl,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  ),
                ),
              ),
//              FlatButton(
//                onPressed: () {
////                  Navigator.push(context, LoyaltyDialog());
////                  LoyaltyDialog.showCustomDialog(context);
//                },
//              )
            ],
          ),
        ),
      ]),
    ));
  }
}
