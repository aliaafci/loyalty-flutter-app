import 'package:loyalty_app/loyalty_components.dart';
import 'loyalty_views.dart';

//@Meena: This is the initial screen, the first screen the app navigates to after splash screen,
//it decides whether to navigate to login/registration screens, or to home screen, if user was previously logged in
class InitialScreen extends StatelessWidget {
  Future<bool> checkIfUserLoggedInBefore() async {
    String token = await LocalStorage().getString(LocalStorageKeys.API_TOKEN);
    if (token != null) {
      LoyaltyNetwork.requestBearer = token;
      String profileStringified =
      await LocalStorage().getString(LocalStorageKeys.USER_PROFILE_DATA);
      UserProfile userProfile =
      UserProfile.fromJson(json.decode(profileStringified));
      LoyaltyUserProfile.profile = userProfile;
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: checkIfUserLoggedInBefore(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.data) {
        case true:
           return CategoryLayout();
          break;
        default:
          return LoginRegistrationScreen();
      }
      },
    );

//    return SubscriptionListView();

//    return new RegisterEmailPassword();

//  return ChangePasswordView();

    if (false) {
      return ProductDetailsWithCarousel(); //return home page later
    } else {
      return LoginRegistrationScreen();
    }
  }
}
