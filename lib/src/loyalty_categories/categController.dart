import 'package:loyalty_app/loyalty_components.dart';

class CategoryController {

  Future<VoidCallback> getAllCategories() async {
    var result = await LoyaltyNetwork().sendRequest(LoyaltyNetworkRequest(
        apiPath: LOYALTY_API.CATEGORY_INFOS,
        requestType: NETWORK_REQUEST_TYPE.GET
    ));
  }

}