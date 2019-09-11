import 'package:loyalty_app/loyalty_components.dart';
import '../model/drawer_list_handler.dart';

class LoyaltyDrawer extends StatefulWidget {
  @override
  _LoyaltyDrawerState createState() => _LoyaltyDrawerState();
}

class _LoyaltyDrawerState extends State<LoyaltyDrawer> {
  String profileImage =
      "https://cdn3.imggmi.com/uploads/2019/5/4/b279fa609ff84abfe0881b07706aa994-full.png";
  String profilePic = "https://i.imgur.com/3TiTPdk.png";

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String arabicLang = 'ar';
    IconData arrowIcon = myLocale.languageCode == arabicLang
        ? Icons.keyboard_arrow_left
        : Icons.keyboard_arrow_right;

    return Container(
      constraints:
          BoxConstraints.expand(width: MediaQuery.of(context).size.width * 0.9),
      color: Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          LoyaltyDrawerHeader(),
          ListTile(
            leading: Icon(
              MdiIcons.homeOutline,
              size: 30,
            ),
//            Image(
//              image: AssetImage('assets/icons/home.png'),
//              fit: BoxFit.fill,
//              width: 25,
//            ),
            title: Text(
              S.of(context).home_lbl,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 59, 59, 59)),
            ),
            trailing: Icon(
              arrowIcon,
              size: 25,
            ),
            onTap: () {
              DrawerListHandler.onTapHome(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Divider(height: 2.0, color: Colors.grey),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.accountOutline,
              size: 30,
            ),

//            Image(
//              image: AssetImage('assets/icons/account.png'),
//              fit: BoxFit.fill,
//              width: 25,
//            ),
            trailing: Icon(
              arrowIcon,
              size: 25,
            ),

            title: Text(
              S.of(context).my_account_lbl,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 59, 59, 59)),
            ),

            onTap: () {
              DrawerListHandler.onTapMyAccount(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Divider(height: 2.0, color: Colors.grey),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.heartOutline,
              size: 30,
            ),
//            Image(
//              image: AssetImage('assets/icons/subscribtion.png'),
//              fit: BoxFit.fill,
//              width: 25,
//            ),
            title: Text(
              S.of(context).my_subscription_lbl,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 59, 59, 59)),
            ),
            trailing: Icon(
              arrowIcon,
              size: 25,
            ),
            onTap: () {
              DrawerListHandler.onTabMySubscription(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Divider(height: 2.0, color: Colors.grey),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.settingsOutline,
              size: 30,
            ),
            title: Text(
              S.of(context).setting_lbl,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 59, 59, 59)),
            ),
            trailing: Icon(
              arrowIcon,
              size: 25,
            ),
            onTap: () {
              DrawerListHandler.onTabSetting(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Divider(height: 2.0, color: Colors.grey),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.exitToApp,
              size: 30,
            ),
            title: Text(
              S.of(context).label_sign_out,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 59, 59, 59)),
            ),
            trailing: Icon(
              arrowIcon,
              size: 25,
            ),
            onTap: () {
              DrawerListHandler.onTapSignout(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Divider(height: 2.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
