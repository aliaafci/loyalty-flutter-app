import 'package:core/network.dart';

/**
 * NOT YET TESTED, JUST THAT IT COMOPILES
 */
class NetworkRequestUrlComposer {
  String fullURL = '';
  String server_ip = '';
  String endPoint = '';
  String apiPath = '';
  SERVER_SECURITY_TYPE securityType;
  Map<String, String> queryParameters = {};

  NetworkRequestUrlComposer(
      {this.fullURL,
      this.securityType,
      this.server_ip,
      this.endPoint,
      this.apiPath,
      this.queryParameters});

  factory NetworkRequestUrlComposer.getUrl(
      {fullURL, securityType, server_ip, endPoint, apiPath, queryParameters}) {
    RegExp _http_s = new RegExp(
        "^(http|https):\/\/"); //for urls starting with http:// or https://

    String returnedUrl = '';
    if (fullURL != null && fullURL != '') {
      returnedUrl = fullURL;
    } else {
      if (securityType != null && securityType != '') {
        securityType = SERVER_SECURITY_TYPE.HTTP;
      }
      if (server_ip.startsWith(_http_s)) {
        if (server_ip.startsWith(new RegExp("^https:\/\/"))) {
          securityType = SERVER_SECURITY_TYPE.HTTPS;
        } else {
          securityType = SERVER_SECURITY_TYPE.HTTP;
        }
        server_ip = server_ip.replaceAll(_http_s, '');
      }
      switch (securityType) {
        case SERVER_SECURITY_TYPE.HTTPS:
          returnedUrl =
              Uri.https(server_ip, endPoint + apiPath, queryParameters)
                  .toString();
          break;
        case SERVER_SECURITY_TYPE.HTTP:
        default:
          returnedUrl = Uri.http(server_ip, endPoint + apiPath, queryParameters)
              .toString();
      }
    }
    return new NetworkRequestUrlComposer(fullURL: returnedUrl);
  }

  @override
  String toString() {
    return fullURL;
  }
}
