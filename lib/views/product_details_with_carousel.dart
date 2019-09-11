import 'package:loyalty_app/loyalty_components.dart';
import 'package:loyalty_app/src/loyalty_categories/partnerInfo.dart';

class ProductDetailsWithCarousel extends StatefulWidget {
  Partner _partnerInfo;

  @override
  _ProductDetailsWithCarouselState createState() =>
      _ProductDetailsWithCarouselState();

  ProductDetailsWithCarousel({Partner partnerInfo}) {
    _partnerInfo = partnerInfo;
  }
}

class _ProductDetailsWithCarouselState
    extends State<ProductDetailsWithCarousel> {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String arabicLang = 'ar';

    Partner _productDetailsWithCarousel = widget._partnerInfo;
    return Scaffold(
//        backgroundColor: Colors.greenAccent,
        body: ListView(children: [
//          Padding(
//            padding: EdgeInsets.all(50),
//          ),

      LoyaltyImageCarousel(
        imagesList: [
          new NetworkImage(_productDetailsWithCarousel.notes),
//          new ExactAssetImage('assets/images/products/fitness_time_01.png',
//              scale: 0.01),
//          new ExactAssetImage('assets/images/products/fitness_time_02.png',
//              scale: 0.01),
//          new ExactAssetImage('assets/images/products/fitness_time_03.png',
//              scale: 0.01),
//              new ExactAssetImage(
//                  'assets/images/icons/facebook_button.png',
//                  scale: 0.01),
//              new NetworkImage(
//                  'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
//              new NetworkImage(
//                  'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg')
        ],
        dotBgColor: Colors.transparent, //Colors.grey[300],
        dotColor: Colors.white,
        borderRadiusEnabled: false,
      ),
      Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                myLocale.languageCode == arabicLang
                    ? _productDetailsWithCarousel.arabicname
                    : _productDetailsWithCarousel.name,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Padding(
                padding: EdgeInsets.all(7),
              ),
              Text(
                myLocale.languageCode == arabicLang
                    ? _productDetailsWithCarousel.arabicdescription
                    : _productDetailsWithCarousel.description,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "30% off Enjoy life with code",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              Center(
                  child: Image.asset(
                'assets/qrCode.png',
                width: MediaQuery.of(context).size.width * 0.8,
              )),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "This offer is valid till 30 April 2019",
                    style: TextStyle(color: Color.fromRGBO(17, 141, 240, 1)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LoyaltyButton(
                  text: S.of(context).btn_subscribe,
                  onButtonPressed: () {
                    LoyaltyDialog.showCustomDialog(context,
                        partner: _productDetailsWithCarousel);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LoyaltyButton(
                  text: S.of(context).btn_link_subscription,
                  onButtonPressed: () {
                    LoyaltyDialog.showCustomDialog(context,
                        partner: _productDetailsWithCarousel);
                  },
                ),
              ),
            ],
          )),

      Padding(
        padding: const EdgeInsets.all(15.0),
      )
    ]));
  }
}
