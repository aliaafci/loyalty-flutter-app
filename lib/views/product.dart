import 'package:loyalty_app/loyalty_components.dart';


class ProductView extends StatefulWidget {
  SubscriptionInfo passedCateg = new SubscriptionInfo();
  ProductView({@required this.passedCateg});
  @override
  _ProductViewState createState() => _ProductViewState(passedCateg: passedCateg);
}


class _ProductViewState extends State<ProductView> {
  SubscriptionInfo passedCateg = new SubscriptionInfo();
  _ProductViewState({@required this.passedCateg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(S.of(context).product_lbl),
      ),
      // to test SubscriptionsHistoryList
//      body: SubscriptionsHistoryList(),
      drawer: LoyaltyDrawer(),

      body: ProductLayout(passedSubscriptionInfo:passedCateg),
    );
  }
}
