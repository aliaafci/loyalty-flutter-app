import 'package:loyalty_app/loyalty_components.dart';
import 'package:loyalty_app/loyalty_subscription_list.dart';

class SubscriptionListView extends StatefulWidget {
  @override
  _SubscriptionListViewState createState() => _SubscriptionListViewState();
}

class _SubscriptionListViewState extends State<SubscriptionListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(S.of(context).my_subscription_header),
      ),
      // to test SubscriptionsHistoryList
//      body: SubscriptionsHistoryList(),
      drawer: LoyaltyDrawer(),

      body: SubscriptionsList(),
    );
  }
}
