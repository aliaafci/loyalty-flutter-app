import 'package:loyalty_app/loyalty_components.dart'
    show NETWORK_REQUEST_TYPE, LOYALTY_API;
import 'package:meta/meta.dart'; //for the @required

class LoyaltyNetworkRequest {
  NETWORK_REQUEST_TYPE requestType; // get or post
  String apiPath; //from loyalty_api_map
  dynamic requestBody;

  LoyaltyNetworkRequest(
      {@required this.apiPath,
      this.requestBody,
      this.requestType = NETWORK_REQUEST_TYPE.GET});
}
