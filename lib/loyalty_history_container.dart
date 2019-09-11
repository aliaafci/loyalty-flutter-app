import 'package:flutter/material.dart';
import 'package:loyalty_app/loyalty_models.dart';
import 'package:loyalty_app/loyalty_components.dart';
class LoyaltyHistoryContainer extends StatefulWidget {

  LoyaltyHistoryContainer({@required this.containerItem});
  HistoryInfo containerItem;
  @override
  LoyaltyHistoryContainerState createState() => LoyaltyHistoryContainerState(this.containerItem);

}

class LoyaltyHistoryContainerState extends State<LoyaltyHistoryContainer> {
  HistoryInfo containerItem ;
  LoyaltyHistoryContainerState( this.containerItem);
  @override
  Widget build(BuildContext context) {
    double containerTextWidth = (MediaQuery.of(context).size.width -25.0) *0.70;
    Locale myLocale = Localizations.localeOf(context);
    String arabicLang = 'ar';
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0,right: 0),
              child:Container(
                child:Text(
                containerItem.points.toString(),style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: new Color.fromARGB(255,51,51,51)),

              ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
              child: Container(
                width: containerTextWidth,

                child: Text(myLocale.languageCode == arabicLang ? containerItem.arabicdescription:containerItem.description,style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 102, 102, 1052)
                ),),


              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                width: containerTextWidth,
                child: Row(
                  children: <Widget>[
                    Text(S.of(context).label_subscription_date,style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 153, 153, 153)
                    ),),
                    Text(containerItem.updatetime.toString().substring(0,10),style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 153, 153, 153)
                    ),)
                  ],
                ),


              ),
            ),
          ],
        ),

      ),
    );

  }
}
