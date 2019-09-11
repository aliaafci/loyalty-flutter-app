import 'package:flutter/material.dart';
import '../model/user_info_handler.dart';
import '../model/drawer_header_user_info.dart';
import 'package:loyalty_app/loyalty_components.dart';

class LoyaltyDrawerHeader extends StatefulWidget {
  @override
  _LoyaltyDrawerHeaderState createState() => _LoyaltyDrawerHeaderState();
}

class _LoyaltyDrawerHeaderState extends State<LoyaltyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    final DrawerHeaderUserInfo userInfoObject = UserInfoHandler.getUserInfo(context);

    double accountHeaderWidth = MediaQuery.of(context).size.width * 0.70;
    double closeMenuContainerWidth = MediaQuery.of(context).size.width * 0.20;

    return DrawerHeader(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 95, 6, 0),
      ),
      padding: EdgeInsets.all(0.0),
      child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 95, 6, 0),
          ),
//  constraints: BoxConstraints.expand(
////                    width: MediaQuery.of(context).size.width ,
////                  height: MediaQuery.of(context).size.height ,
//  ),
          child: Row(
//    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//    crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Container(
                width: accountHeaderWidth,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.symmetric(horizontal: 65),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 95, 6, 0),
                  ),
//                  otherAccountsPictures: <Widget>[
//                    GestureDetector(
//                      child:  Icon(Icons.menu,size: 30,color: Colors.white
//                        , ),
//                      onTap: (){
//                        Navigator.of(context).pop();
//                      },
//                    ),
//                  ],
                  accountName: Text(
                    LoyaltyUserProfile.profile.firstName,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),

                  accountEmail: Text(
                    LoyaltyUserProfile.profile.email,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
//              Container(
//                width: closeMenuContainerWidth,
//                padding: EdgeInsetsDirectional.only(top: 5.0),
//                child: GestureDetector(
//                  child: Icon(
//                    Icons.menu,
//                    size: 30,
//                    color: Colors.white,
//                  ),
//                  onTap: () {
//                    Navigator.of(context).pop();
//                  },
//                ),
//              ),
            ],
          )),
    );
  }
}
