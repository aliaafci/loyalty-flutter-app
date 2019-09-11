import 'package:loyalty_app/loyalty_components.dart';
import 'package:loyalty_app/loyalty_models.dart';

class ChangePasswordView extends StatefulWidget {
  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _oldPasswordController = TextEditingController();
  final _newasswordController = TextEditingController();
//  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<VoidCallback> onChangePasswordClick() async {
      debugPrint(_oldPasswordController.text.toString());
      debugPrint(_newasswordController.text.toString());

      var result = await LoyaltyNetwork().sendContextRequest(
          LoyaltyNetworkRequest(
              apiPath: LOYALTY_API.CHANGE_PASSWORD,
              requestType: NETWORK_REQUEST_TYPE.POST,
              requestBody: ChangePasswordVM(
                currentPassword: _oldPasswordController.text,
                newPassword: _newasswordController.text,
              ).toJson()),
          context);
      debugPrint("Change password response $result");

      Navigator.of(context).pushNamedAndRemoveUntil(
          '/categories', (Route<dynamic> route) => false);
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          S.of(context).btn_change_password,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      // to test SubscriptionsHistoryList
//      body: SubscriptionsHistoryList(),
      drawer: LoyaltyDrawer(),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoyaltyTextField(
                  controller: _oldPasswordController,
                  labelText: S.of(context).txt_old_password,
                  fontColor: Colors.black,
                  borderColor_focused: Theme.of(context).primaryColor,
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  isPassword: true,
                  suffixIconColor: Theme.of(context).primaryColor),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              LoyaltyTextField(
                labelText: S.of(context).txt_new_password,
                controller: _newasswordController,
                fontColor: Colors.black,
                borderColor_focused: Theme.of(context).primaryColor,
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                isPassword: true,
                suffixIconColor: Theme.of(context).primaryColor,
              ),
              /* Padding(
                padding: EdgeInsets.all(10),
              ),
              LoyaltyTextField(
                controller: _confirmPasswordController,
                labelText: S.of(context).txt_confirm_password,
                fontColor: Colors.black,
                borderColor_focused: Theme.of(context).primaryColor,
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                isPassword: true,
                suffixIconColor: Theme.of(context).primaryColor
              ),*/
              Padding(
                padding: EdgeInsets.all(10),
              ),
              LoyaltyButton(
                text: S.of(context).btn_change_password,
                onButtonPressed: onChangePasswordClick,
              )
            ],
          ),
        ),
      ),
    );
  }
}
