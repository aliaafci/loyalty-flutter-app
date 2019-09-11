import 'package:flutter/material.dart';
import 'package:loyalty_app/loyalty_models.dart';

class LoyaltySubscriptionImageContainer extends StatefulWidget {
  LoyaltySubscriptionImageContainer(
      {@required this.imageContainerItem, this.onItemClick});

  PartnerInfo imageContainerItem;
  VoidCallback onItemClick;

  @override
  _LoyaltySubscriptionImageContainerState createState() =>
      _LoyaltySubscriptionImageContainerState(
          this.imageContainerItem, this.onItemClick);
}

class _LoyaltySubscriptionImageContainerState
    extends State<LoyaltySubscriptionImageContainer> {
  _LoyaltySubscriptionImageContainerState(
      this.imageContainerItem, this.onItemClick);

  PartnerInfo imageContainerItem;
  VoidCallback onItemClick;

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String arabicLang = 'ar';
    double fullRowWidth = MediaQuery.of(context).size.width;
    double rightContainerWidth = fullRowWidth * 0.20;
    double leftContainerWidth = fullRowWidth * 0.70;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 24, 5, 24),
      child: GestureDetector(
        onTap: onItemClick ?? () {},
        child: Container(
          width: fullRowWidth,
          child: Row(
            children: <Widget>[
//            Image(image: AssetImage('assets/test.png'),fit: BoxFit.fill,),
             Padding(
               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
               child:
               Container(
                 width: rightContainerWidth,
                 height: 110,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(5)),
                     image: DecorationImage(
                         image: NetworkImage(imageContainerItem.notes ,scale: fullRowWidth),
                         fit: BoxFit.fill)),
               ),
             ),
              Container(
                width: leftContainerWidth,
                margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      myLocale.languageCode == arabicLang ? imageContainerItem.arabicname:imageContainerItem.name,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: new Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
                      child: Container(
                        child: Text(
                          myLocale.languageCode == arabicLang ? imageContainerItem.arabicdescription:imageContainerItem.description,
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 102, 102, 1052)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
//                            Text(
//                              imageContainerItem['offerPercentage'],
//                              style: TextStyle(
//                                  fontSize: 12,
//                                  fontWeight: FontWeight.bold,
//                                  color: Color.fromARGB(255, 95, 6, 0)),
//                            ),
                            Text(
                              myLocale.languageCode == arabicLang ? imageContainerItem.categoryInfo.arabicdescription:imageContainerItem.categoryInfo.description,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 95, 6, 0)),
                            )
                          ],
                        ),
                      ),
                    ),
//                      Padding(
//                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
//                      child: Container(
//                        child: Text(
//                          myLocale.languageCode == arabicLang ? imageContainerItem.arabicdescription:imageContainerItem.description,
//                          style: TextStyle(
//                              fontSize: 12,
//                              fontWeight: FontWeight.bold,
//                              color: Color.fromARGB(255, 17, 141, 240)),
//                        ),
//                      ),
//                    ),
                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
