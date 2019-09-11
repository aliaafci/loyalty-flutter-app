import 'package:flutter/material.dart';
import 'package:loyalty_app/loyalty_components.dart';

class SubscriptionHistoryView extends StatefulWidget {
  var partnerId ;
  SubscriptionHistoryView({@required this.partnerId});
  @override
  _SubscriptionHistoryViewState createState() => _SubscriptionHistoryViewState(partnerId: this.partnerId);
}

class _SubscriptionHistoryViewState extends State<SubscriptionHistoryView> {
  var partnerId ;
  _SubscriptionHistoryViewState({@required this.partnerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text( S.of(context).subscription_history_header,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      // to test SubscriptionsHistoryList
//      body: SubscriptionsHistoryList(),
      drawer: LoyaltyDrawer(),

      body: SubscriptionsHistoryList(partnerId: this.partnerId,),
    );
  }
}
