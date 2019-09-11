import 'package:loyalty_app/loyalty_components.dart';

class DrawerListHandler {
//  List<DrawerListItem> drawerList ;
  static onTapHome(context) {
    debugPrint("home tapped");

    Navigator.of(context).pop();
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/categories', (Route<dynamic> route) => false);
  }

  static onTapMyAccount(context) {
    debugPrint("MyAccount tapped");
//      Navigator.of(context).pop();
//      Navigator.of(context)
//          .pushNamedAndRemoveUntil('/subscriptionHistory', (Route<dynamic> route) => false);
  }

  static onTabMySubscription(context) {
    debugPrint("MySubscription tapped");

    Navigator.of(context).pop();
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/subscriptionList', (Route<dynamic> route) => false);
  }

  static onTabSetting(context) {
    debugPrint("setting tapped");

    Navigator.of(context).pop();
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/settingView', (Route<dynamic> route) => false);
  }

  static onTapSignout(context) async {
    debugPrint("Signout tapped");

    await LocalStorage().remove(LocalStorageKeys.API_TOKEN);
    await LocalStorage().remove(LocalStorageKeys.USER_PROFILE_DATA);
    LoyaltyUserProfile.profile = null;
    LoyaltyNetwork.requestBearer = null; //to set user as logged in

      Navigator.of(context).pushNamedAndRemoveUntil(
        '/loginRegistration', (Route<dynamic> route) => false);
  }

  static prepareDrawerList() {
//    // add home item
//      this.drawerList.add(DrawerListItem("Home", "assets/home.png",Icons.keyboard_arrow_right, this.onTapHome));
//      // add My Account item
//      this.drawerList.add(DrawerListItem("My Account", "assets/account.png",Icons.keyboard_arrow_right, this.onTapMyAccount));
//      // add My Subscriptions item
//      this.drawerList.add(DrawerListItem("My Subscriptions", "assets/subscribtion.png",Icons.keyboard_arrow_right, this.onTabMySubscription));
//       // add setting item
//      this.drawerList.add(DrawerListItem("Settings", "assets/setting.png",Icons.keyboard_arrow_right, this.onTabSetting));
//
  }

  static getDrawerList() {
//    this.prepareDrawerList();
//    return this.drawerList ;
  }
}
