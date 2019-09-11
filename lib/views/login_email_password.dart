import 'package:loyalty_app/loyalty_components.dart';
import 'package:loyalty_app/loyalty_models.dart';

class LoginEmailPasswordScreen extends StatefulWidget {
  @override
  _LoginEmailPasswordScreenState createState() =>
      _LoginEmailPasswordScreenState();
}

class _LoginEmailPasswordScreenState extends State<LoginEmailPasswordScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isProgressIndicatorDisplayed = false;

  @override
  Widget build(BuildContext context) {
    Future<VoidCallback> onLoginButtonClicked() async {
      bool isValidForm = false;
      setState(() {
        _isProgressIndicatorDisplayed = true;
      });
      isValidForm =
          !emailController.text.isEmpty && !passwordController.text.isEmpty;

      if (isValidForm) {
        try {
          var result = await LoyaltyNetwork().sendContextRequest(
              LoyaltyNetworkRequest(
                  apiPath: LOYALTY_API.LOGIN_EMAIL_PASSWORD,
                  requestType: NETWORK_REQUEST_TYPE.POST,
                  requestBody: LoginVM(
                          username: emailController.text,
                          password: passwordController.text)
                      .toJson()),
              context);
          JWTToken token = JWTToken.fromJson(result);
          debugPrint('Login successful. Token: ${token.idToken}');
          LoyaltyNetwork.requestBearer =
              token.idToken; //to set user as logged in
          LocalStorage().setString(LocalStorageKeys.API_TOKEN, token.idToken);
          var _userProfile = await LoyaltyNetwork().sendContextRequest(
              LoyaltyNetworkRequest(
                  apiPath: LOYALTY_API.USER_PROFILE,
                  requestType: NETWORK_REQUEST_TYPE.GET),
              context);
          LoyaltyUserProfile.profile = UserProfile.fromJson(_userProfile);
          LocalStorage().setString(LocalStorageKeys.USER_PROFILE_DATA,
              json.encode(LoyaltyUserProfile.profile));
          setState(() {
            _isProgressIndicatorDisplayed = false;
          });

          Navigator.of(context).pushNamedAndRemoveUntil(
              '/categories', (Route<dynamic> route) => false);
        } catch (ex) {
          setState(() {
            _isProgressIndicatorDisplayed = false;
          });
        }
      } else {
        showEmptyFieldsError();
      }
    }

    return new Scaffold(
        body: new Container(
//      padding: EdgeInsets.symmetric(
//          vertical: MediaQuery.of(context).size.height * 0.1),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image:
              new AssetImage("assets/images/background_login_registration.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: _isProgressIndicatorDisplayed
          ? Center(child: CircularProgressIndicator())
          : ListView(children: <Widget>[
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
                      child: new LoyaltyTextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: S.of(context).email_lbl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: new LoyaltyTextField(
                          controller: passwordController,
                          isPassword: true,
                          labelText: S.of(context).password_lbl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(width: 1, color: Colors.grey)),
                        child: new LoyaltyButton(
                          text: S.of(context).login_btn,
                          buttonColor: Colors.white,
                          textStyle: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                          onButtonPressed: onLoginButtonClicked,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  heightFactor: MediaQuery.of(context).size.height * 0.004,
//                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        S.of(context).new_user_lbl,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      new GestureDetector(
                        onTap: () {
                          debugPrint("Existing user clicked");
                          Navigator.pushNamed(context, '/loginRegistration');
                        },
                        child: Text(S.of(context).sign_up_now_lbl,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  ),
                ),
              )
            ]),
    ));
  }

  void showEmptyFieldsError() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(S.of(context).label_error),
              content: Text(S.of(context).label_error_empty_field),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text(S.of(context).label_ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
