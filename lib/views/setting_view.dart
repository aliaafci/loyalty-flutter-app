import 'package:loyalty_app/loyalty_components.dart';
import 'package:loyalty_app/generated/i18n.dart';
import 'package:loyalty_app/main.dart';
import 'package:loyalty_app/model/language_model.dart';

class SettingView extends StatefulWidget {
  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  List<Language> supportedLangList = [];
  bool loadSelectedLang = false;

  String selectedLang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          S.of(context).setting_lbl,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      // to test SubscriptionsHistoryList
//      body: SubscriptionsHistoryList(),
      drawer: LoyaltyDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: !this.loadSelectedLang
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(S.of(context).label_change_lang,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(15),
                      itemCount: supportedLangList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Container(
                              child: ListTile(
                                trailing: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.grey),
                                        color: supportedLangList[index]
                                                    .langCode ==
                                                this.selectedLang
                                            ? Color.fromARGB(255, 95, 6, 0)
                                            : Colors.white),
                                    width: 30,
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      this.selectedLang =
                                          supportedLangList[index].langCode;
                                    });

                                    await LocalStorage().setString(
                                        LocalStorageKeys.LANGUAGE_CODE,
                                        supportedLangList[index].langCode);

                                    await LocalStorage().setString(
                                        LocalStorageKeys.COUNTRY_CODE, "");
//                    S.delegate.resolution(fallback: Locale('ar', '') ,withCountry: false);
                                    // step two, rebuild the whole app, with the new locale
                                    MyApp.setLocale(
                                        context,
                                        Locale(
                                            supportedLangList[index].langCode,
                                            ''));
                                  },
                                ),
                                title: Text(
                                  supportedLangList[index].langTitle,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 59, 59, 59)),
                                ),
                                onTap: () {},
                              ),
                            ),
                            Divider(color: Colors.grey, height: 3.0)
                          ],
                        );
                      }),
                  InkWell(
                    child: Text(S.of(context).btn_change_password,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 95, 6, 0))),
                    onTap: () {
                      Navigator.pushNamed(context, '/changePassword');
                    },
                  ),
                ],
              ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this._fetchLang().then((langCode) {
      List<Language> supportedLangListTemp = [];
      supportedLangListTemp.add(Language('English', 'en'));
      supportedLangListTemp.add(Language('عربي', 'ar'));
      setState(() {
        this.selectedLang = langCode;
        this.supportedLangList = supportedLangListTemp;
        this.loadSelectedLang = true;
      });
    });
  }

  _getLanguageCode() {
    return Localizations.localeOf(context).languageCode;
  }

  _fetchLang() async {
    var langCode =
        await LocalStorage().getString(LocalStorageKeys.LANGUAGE_CODE);
    if (langCode == null) {
      langCode = _getLanguageCode();
      await LocalStorage().setString(LocalStorageKeys.LANGUAGE_CODE, langCode);
    }
    return langCode;
  }
}
