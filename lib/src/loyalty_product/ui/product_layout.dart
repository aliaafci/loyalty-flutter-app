import 'package:loyalty_app/loyalty_components.dart';
import 'package:loyalty_app/views/subscribtion_history.dart';
class ProductLayout extends StatefulWidget {
  SubscriptionInfo passedSubscriptionInfo = new SubscriptionInfo();
  ProductLayout({@required this.passedSubscriptionInfo});

  @override
  _ProductLayoutState createState() => _ProductLayoutState(passedSubscriptionInfo:passedSubscriptionInfo );
}

class _ProductLayoutState extends State<ProductLayout> {
  SubscriptionInfo passedSubscriptionInfo = new SubscriptionInfo();
  _ProductLayoutState({@required this.passedSubscriptionInfo});
  @override
  Widget build(BuildContext context) {
    ProductEntity productEntityObject =  getProductEntirty(context);


    return ListView(
    children: <Widget>[
      Padding(padding: EdgeInsets.fromLTRB(24, 45, 24, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductImageContanier(passedSubscriptionInfo),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 38, 0, 40),

              child:Column(
                  children: <Widget>[
                    Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child:Text(S.of(context).number_of_points_lbl,style: TextStyle(fontSize:16 , color: Color.fromARGB(255, 51, 51, 51)),),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child:Text(passedSubscriptionInfo.points.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16 , color: Color.fromARGB(255, 51, 51, 51)),),
                          ),
                        ]
                    ),
                    Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child:Text(S.of(context).expiry_date_lbl,style: TextStyle(fontSize:16 , color: Color.fromARGB(255, 51, 51, 51)),),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child:Text(passedSubscriptionInfo.partnerInfo.categoryInfo.updatetime.toString().substring(0,10),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color.fromARGB(255, 51, 51, 51)),),
                          ),
                        ]
                    ),

                  ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20 , right: 20),
              child: Image(
                image: AssetImage(productEntityObject.qrCodeImageUrl),
                fit: BoxFit.fill,
              ),
            ),
            Padding (
              padding: EdgeInsets.fromLTRB(6, 80, 6, 0),
              child: LoyaltyButton(
                text: S.of(context).subscription_history_btn,
                onButtonPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SubscriptionHistoryView(partnerId:passedSubscriptionInfo.id)));
//                  Navigator.push(context,MaterialPageRoute(builder: (context) => SubscriptionHistoryView(partnerId:6070)));


//                  Navigator.pushNamed(context, '/subscriptionHistory',arguments:passedSubscriptionInfo.id );
                },
              ),
            )
          ],
        ),

      )
    ],

    );
  }
  static ProductEntity getProductEntirty(context){
    Locale myLocale = Localizations.localeOf(context);
    String arabicLang = 'ar';
    ProductEntity   productEntityObjectEnglish = ProductEntity("Al Riyadh, Olaya" , "Spa" , "Fitness Time","assets/fitnessImage.jpg","assets/qrCode.png","500 points","15 May 2019");
    ProductEntity   productEntityObjectArabic = ProductEntity("الرياض ، العليا" , "نادى صحى" , "وقت اللياقة","assets/fitnessImage.jpg","assets/qrCode.png","500 نقطة","15 مايو 2019");

    return  myLocale.languageCode == arabicLang ? productEntityObjectArabic :productEntityObjectEnglish ;
  }
}
