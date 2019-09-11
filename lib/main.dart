import 'loyalty_components.dart';
import 'package:loyalty_app/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loyalty_app/generated/i18n.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state =
        context.ancestorStateOfType(const TypeMatcher<_MyAppState>());

    state.setState(() {
      state._locale = newLocale;
    });
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  bool loadedLocale = false;

  @override
  initState() {
    super.initState();
    LocalStorage().initialize();

    this._fetchLocale().then((locale) {
      setState(() {
        this._locale = locale;
        this.loadedLocale = true;
      });
    });

    LoyaltyNetwork.initializeNetwork();
  }

  @override
  Widget build(BuildContext context) {
    return !this.loadedLocale
        ? Center(
            child: CircularProgressIndicator()
          )
        : MaterialApp(
            title: 'Loyalty App',
            theme: loyaltyTheme,
            locale: this._locale,
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              if (this._locale == null) {
                this._locale = Locale(deviceLocale.languageCode, '');
              }

              S.delegate.resolution(fallback: this._locale);
            },
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,

            //home: MyHomePage(title: 'Flutter Demo Home Page'),
            routes: routes);
  }

  _fetchLocale() async {
    await LocalStorage().initialize();
    var langCode =
        await LocalStorage().getString(LocalStorageKeys.LANGUAGE_CODE);
    if (langCode == null) {
      return null;
    } else {
      return Locale(
          await LocalStorage().getString(LocalStorageKeys.LANGUAGE_CODE),
          await LocalStorage().getString(LocalStorageKeys.COUNTRY_CODE));
    }
  }
}
