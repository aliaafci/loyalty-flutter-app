import 'package:flutter/material.dart';
import 'loyalty_history_container.dart';
import 'package:loyalty_app/loyalty_models.dart';
import 'package:loyalty_app/loyalty_components.dart';

class SubscriptionsHistoryList extends StatefulWidget {
  var partnerId;
  SubscriptionsHistoryList({@required this.partnerId});
  @override
  _SubscriptionsListState createState() => _SubscriptionsListState(partnerId: this.partnerId);
}

class _SubscriptionsListState extends State<SubscriptionsHistoryList> {
  var partnerId ;
  _SubscriptionsListState({@required this.partnerId});
  List<HistoryInfo> subscriptionHistoryList = [];
  var isLoading = false;
// static BuildContext context1  ;
//  static var passedData = ModalRoute.of(context1).settings.arguments;
//  var partnerId = passedData ;
  Future  _loadSubscriptionList() async{
//      var partnerId = "2355" ;

    setState(() {
      isLoading = true;
    });
    onError ()  {
      setState(() {
        isLoading = false;
      });
    }
    var _subscriptionHistory =  await LoyaltyNetwork().sendContextRequest(
        LoyaltyNetworkRequest(
            apiPath: LOYALTY_API.SUBSCRIPTION_HISTORY+"/"+this.partnerId.toString(),
            requestType: NETWORK_REQUEST_TYPE.GET), context);
    setState(() {
      isLoading = false;

      subscriptionHistoryList = HistoryInfo.listFromJson(_subscriptionHistory);

    });
    debugPrint("subscription history  List : $subscriptionHistoryList");
  }
  initState() {
    super.initState();
    _loadSubscriptionList();
  }

  dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
//    context1 = context ;
//    List subscriptionHistoryList = getDummyList(context);

    return Container(
      child:isLoading
        ? Center(
        child: CircularProgressIndicator(),
    ):subscriptionHistoryList.length < 1 ? Text(S.of(context).empty_history_list_lbl):
      ListView.builder(
        padding: EdgeInsets.zero,
          itemCount: subscriptionHistoryList.length,
          itemBuilder: (context,index)
          {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                LoyaltyHistoryContainer(containerItem:subscriptionHistoryList[index] ),
                Divider(
                  height: 2.0,
                  color: Color.fromARGB(255, 50, 50, 50),
                )
              ],
            );
          }
      ),
    );
  }
  static List getDummyList(context){
    Locale myLocale = Localizations.localeOf(context);
    String arabicLang = 'ar';
    List tempListEnglish =[
      {
        "title": "Topkapi",
        "describtion": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut finibus, velit a malesuada congue,",
        "offerDate": "13 April 2019",
        "dateLabel":"Date of subscription: "
      },
      {
        "title": "Fitness Time",
        "describtion": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut finibus, velit a malesuada congue,",
        "offerDate": "13 April 2019",
        "dateLabel":"Date of subscription: "

      },
      {
        "title": "Courtyard",
        "describtion": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut finibus, velit a malesuada congue,",
        "offerDate": "13 April 2019",
        "dateLabel":"Date of subscription: "

      }
    ];
    List tempListArabic =[
      {
        "title": "توبكابي",
        "describtion": "تم بناء قصر توبكابي بأمر من السلطان محمد الفاتح في منطقة السلطان أحمد التاريخية",
        "offerDate": "13 أبريل 2019",
        "dateLabel":"التاريخ: "
      },
      {
        "title": "وقت اللياقة",
        "describtion": "تم بناء قصر توبكابي بأمر من السلطان محمد الفاتح في منطقة السلطان أحمد التاريخية",
        "offerDate": "13 أبريل 2019",
        "dateLabel":"التاريخ: "

      },
      {
        "title": "كورت بارد",
        "describtion": "تم بناء قصر توبكابي بأمر من السلطان محمد الفاتح في منطقة السلطان أحمد التاريخية",
        "offerDate": "13 أبريل 2019",
        "dateLabel":"التاريخ: "

      }
    ];
    return myLocale.languageCode == arabicLang ? tempListArabic: tempListEnglish;
  }
}
