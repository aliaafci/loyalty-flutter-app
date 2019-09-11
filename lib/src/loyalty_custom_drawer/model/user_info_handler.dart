import 'drawer_header_user_info.dart';
import 'package:flutter/material.dart';
class UserInfoHandler {

  static DrawerHeaderUserInfo getUserInfo( BuildContext context){

    Locale myLocale = Localizations.localeOf(context);
    String arabicLang = 'ar';
    return myLocale.languageCode == arabicLang ? DrawerHeaderUserInfo("assets/images/profilePic.png","محمد","Mohammed@gmail.com") :DrawerHeaderUserInfo("assets/images/profilePic.png","Mohammed","Mohammed@gmail.com");
  }


}