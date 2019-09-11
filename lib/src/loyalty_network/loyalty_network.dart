import 'package:loyalty_app/loyalty_components.dart';

class LoyaltyNetwork {
  // next three lines makes this class a Singleton
  static LoyaltyNetwork _instance = new LoyaltyNetwork.internal();

  LoyaltyNetwork.internal() {
//   Initialization code for the singleton here
  }
  factory LoyaltyNetwork() => _instance;

  static Map<String, String> defaultHeaders;
  static String requestBearer;
  static String serverIp;
  static String endPoint;



  LoyaltyNetwork.initializeNetwork(
      {Map<String, String> headers,
      String passedServerIp,
      String passedEndPoint}) {
    defaultHeaders = headers ?? loyaltyDefaultHeaders;
    serverIp = passedServerIp ?? SERVER_IP;
    endPoint = passedEndPoint ?? ENDPOINT_PATH;
  }

  Future<dynamic> sendRequest(LoyaltyNetworkRequest request) async {
    sendContextRequest(request, null);
  }

  Future<dynamic> sendContextRequest(LoyaltyNetworkRequest request, BuildContext context) async {
    NetworkRequest localRequest = new NetworkRequest(
      requestType: request.requestType,
      requestBody: request.requestBody,
      composedUrl: NetworkRequestUrlComposer.getUrl(
          apiPath: request.apiPath, endPoint: endPoint, server_ip: serverIp),
    );
    localRequest.addRequestHeaders(defaultHeaders);
    if (requestBearer != null) {
      localRequest
          .addRequestHeaders({'authorization': "Bearer $requestBearer"});
    }

    var result = await NetworkUtil().sendRequest(localRequest, context);
    debugPrint(result.toString());
    return result;
  }

}
