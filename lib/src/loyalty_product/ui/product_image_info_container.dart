import 'package:flutter/material.dart';
import 'package:loyalty_app/model/subscriptionModel/subscription_info.dart';
import '../model/prodcut_entity.dart';
class ProductImageContanier extends StatelessWidget {
  SubscriptionInfo productEntityObject;
  ProductImageContanier(this.productEntityObject);
  @override
  Widget  build(BuildContext context) {
    double fullRowWidth = MediaQuery.of(context).size.width - 48 ;
    double leftContainerWidth  = fullRowWidth * 0.24 ;
    double rightContainerWidth = fullRowWidth * 0.70 ;

    Locale myLocale = Localizations.localeOf(context);
    String arabicLang = 'ar';

    return Container(
      width: fullRowWidth,
      child: Row(
        children: <Widget>[
          Container(
            height:110 ,
            width: leftContainerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(image: NetworkImage(productEntityObject.partnerInfo.notes),fit: BoxFit.fill)
            ),
          ),
          Container(
            width: rightContainerWidth,
              margin: EdgeInsets.fromLTRB(0, 2, 0, 0),

            child:
              Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
               child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Padding(
                     padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                     child:Container(
                       child: Text(
                         myLocale.languageCode == arabicLang ?  productEntityObject.partnerInfo.arabicname :  productEntityObject.partnerInfo.name
                         ,style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 169, 169, 176)

                       ),),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                     child:Container(
                       child :Text(
                         myLocale.languageCode == arabicLang ? productEntityObject.partnerInfo.categoryInfo.arabicname :productEntityObject.partnerInfo.categoryInfo.name
                         ,style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 59, 59, 59)

                     ),),
                     ),

                   ),
                   Padding(
                     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                     child:Container(
                       child :Text(myLocale.languageCode == arabicLang ? productEntityObject.description : productEntityObject.description ,style: TextStyle(fontSize: 18, color:  Color.fromARGB(255, 169, 169, 176)

                       ),),
                     ),
                   ),
                 ],

               ),

              ),
          )
        ],
      ),
    );
  }
}
