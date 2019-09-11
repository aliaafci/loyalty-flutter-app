
import 'views/loyalty_views.dart';

final routes = {
//  "/login": (context) => new LoginScreen(),
//  "/home": (context) => new HomeScreen(),
//  "/posts": (context) => new PostsScreen(),
  '/': (context) => new InitialScreen(),
//  '/':(context) =>new CategoryLayout() ,

  '/subscriptionList': (context) => new SubscriptionListView(),
  '/loginRegistration':(context) => new LoginRegistrationScreen(),
  '/subscriptionHistory':(context) => new SubscriptionHistoryView(),
  '/settingView':(context) => new SettingView(),
  '/changePassword':(context) => new ChangePasswordView(),
  '/LoginEmailPasswordScreen': (context) => new LoginEmailPasswordScreen(),
  '/RegisterEmailPassword': (context) => new RegisterEmailPassword(),
  '/categories': (context) => new CategoryLayout(),
  '/productWithCarousel':(context) => new ProductDetailsWithCarousel()

};
