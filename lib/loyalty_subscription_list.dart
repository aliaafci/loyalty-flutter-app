import 'package:flutter/material.dart';
import 'loyalty_subscription_image_container.dart';
import 'package:loyalty_app/loyalty_models.dart';
import 'package:loyalty_app/loyalty_components.dart';
import 'views/product.dart';

class SubscriptionsList extends StatefulWidget {
  @override
  _SubscriptionsListState createState() => _SubscriptionsListState();
}

class _SubscriptionsListState extends State<SubscriptionsList> {
  List<SubscriptionInfo> subscriptionInfoList = [];
  var isLoading = false;

  Future  _loadSubscriptionList() async{
    setState(() {
      isLoading = true;
    });
    onError ()  {
      setState(() {
        isLoading = false;
      });
    }
    var _subscriptionInfo = await LoyaltyNetwork().sendContextRequest(
        LoyaltyNetworkRequest(
            apiPath: LOYALTY_API.SUBSCRIPTION_INFO,
            requestType: NETWORK_REQUEST_TYPE.GET), context);
    setState(() {
      isLoading = false;

      subscriptionInfoList = SubscriptionInfo.listFromJson(_subscriptionInfo);

    });
    debugPrint("subscription List : $subscriptionInfoList");
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
//    getListSub();
    return Container(
      child:isLoading
          ? Center(
        child: CircularProgressIndicator(backgroundColor:  Color.fromARGB(255, 95, 6, 0 )),
      ):subscriptionInfoList.length < 1 ? Text(S.of(context).empty_list_lbl):
      ListView.builder(
          itemCount: subscriptionInfoList.length,

          itemBuilder: (context,index)
          {
            return Column(

              children: <Widget>[
                LoyaltySubscriptionImageContainer(imageContainerItem:subscriptionInfoList[index].partnerInfo,onItemClick: (){
                  debugPrint(subscriptionInfoList[index].toString());
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ProductView(passedCateg:subscriptionInfoList[index])));
                }, ),
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
    List tempListEnglish =
    [
      {
        "title": "Topkapi",
        "offerPercentage": "30% ",
        "offerText":"off Enjoy Life",
        "describtion": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut finibus, velit a malesuada congue,",
        "offerDate": "This offer is valid till 30 April 2019",
        "imageURL":"assets/productItem.png"
      },
      {
        "title": "Fitness Time",
        "offerPercentage": "30% ",
        "offerText":"off Enjoy Life",
        "describtion": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut finibus, velit a malesuada congue,",
        "offerDate": "This offer is valid till 30 April 2019",
        "imageURL":"assets/fitnessImage2.png"
      },
      {
        "title": "Courtyard",
        "offerPercentage": "30% ",
        "offerText":"off Enjoy Life",
        "describtion": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut finibus, velit a malesuada congue,",
        "offerDate": "This offer is valid till 30 April 2019",
        "imageURL":"assets/hotelImage.png"
      }
    ];
    List tempListArabic =
    [
      {
        "title": "توبكابي",
        "offerPercentage": "30٪ ",
        "offerText":"خصم",
        "describtion": "تم بناء قصر توبكابي بأمر من السلطان محمد الفاتح في منطقة السلطان أحمد التاريخية",
        "offerDate": "هذا العرض ساري حتى 30 أبريل 2019",
        "imageURL":"assets/productItem.png"
      },
      {
        "title": "وقت اللياقة",
        "offerPercentage": "30٪ ",
        "offerText":"خصم",
        "describtion": "تم بناء قصر توبكابي بأمر من السلطان محمد الفاتح في منطقة السلطان أحمد التاريخية",
        "offerDate": "هذا العرض ساري حتى 30 أبريل 2019",
        "imageURL":"assets/fitnessImage2.png"
      },
      {
        "title": "كورت بارد",
        "offerPercentage": "30٪ ",
        "offerText":"خصم",
        "describtion": "تم بناء قصر توبكابي بأمر من السلطان محمد الفاتح في منطقة السلطان أحمد التاريخية",
        "offerDate": "هذا العرض ساري حتى 30 أبريل 2019",
        "imageURL":"assets/hotelImage.png"
      }
    ];
    return myLocale.languageCode == arabicLang ? tempListArabic: tempListEnglish;
  }

}
