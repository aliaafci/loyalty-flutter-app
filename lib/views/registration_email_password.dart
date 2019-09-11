import 'package:loyalty_app/loyalty_components.dart';
import 'package:loyalty_app/loyalty_models.dart';
import 'package:intl/intl.dart';

class RegisterEmailPassword extends StatefulWidget {
  @override
  _RegisterEmailPasswordState createState() => _RegisterEmailPasswordState();
}

class _RegisterEmailPasswordState extends State<RegisterEmailPassword> {
  final dateCreated =
      DateFormat("yyyy-MM-ddTHH:mm:ss.502").format(DateTime.now()) + 'Z';
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  bool isProgressIndicatorShown = false;

  Future<VoidCallback> onRegisterButtonClicked() async {

    bool isValidForm = false;
    isValidForm = !nameController.text.isEmpty &&
        (!emailController.text.isEmpty &&
            !confirmEmailController.text.isEmpty &&
            emailController.text == confirmEmailController.text) &&
        !passwordController.text.isEmpty &&
        !phoneController.text.isEmpty;
    if (isValidForm) {
      try {
        setState(() {
          isProgressIndicatorShown = true;
        });
        var result = await LoyaltyNetwork().sendContextRequest(
            LoyaltyNetworkRequest(
                apiPath: LOYALTY_API.REGISTER_WITH_EMAIL,
                requestType: NETWORK_REQUEST_TYPE.POST,
                requestBody: RegistrationVm(
                        activated: true,
                        arabicFirstname: nameController.text,
                        arabicFullName: nameController.text,
                        arabicLastname: nameController.text,
                        createdBy: "mobileappandriod",
                        createdDate: dateCreated,
                        email: emailController.text,
                        englishFullName: nameController.text,
                        firstName: nameController.text,
                        langKey: "en-ly",
                        lastModifiedBy: "mobileappandriod",
                        lastModifiedDate: dateCreated,
                        lastName: nameController.text,
                        login: emailController.text,
                        mobile: phoneController.text,
                        password: passwordController.text)
                    .toJson()),
            context);
        debugPrint("Registered");
        setState(() {
          isProgressIndicatorShown = false;
        });
        showRegistrationSuccess();
      } catch (e) {
        setState(() {
          isProgressIndicatorShown = false;
        });
      }
    } else {
      showEmptyFieldsError();
    }
  }

  void showRegistrationSuccess() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(S.of(context).label_done),
              content: Text(S.of(context).label_registered_successfully),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text(S.of(context).label_ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/LoginEmailPasswordScreen');
                  },
                ),
              ],
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
          image:
              new AssetImage("assets/images/background_login_registration.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: isProgressIndicatorShown
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(children: <Widget>[
              Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
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
                          controller: nameController,
                          labelText: S.of(context).name_lbl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: new LoyaltyTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          labelText: S.of(context).email_lbl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: new LoyaltyTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: confirmEmailController,
                          labelText: S.of(context).confirm_email_lbl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: new LoyaltyTextField(
                          isPassword: true,
                          controller: passwordController,
                          labelText: S.of(context).password_lbl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: new LoyaltyTextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          labelText: S.of(context).mobile_lbl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(width: 1, color: Colors.grey)),
                        child: new LoyaltyButton(
                          text: S.of(context).btn_register,
                          buttonColor: Colors.white,
                          textStyle: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                          onButtonPressed: onRegisterButtonClicked,
                        ),
                      ),
                    ),
                  ],
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
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5))
            ]),
    ));
  }
}
