import 'package:core/network.dart';

enum NETWORK_REQUEST_TYPE { GET, POST }
enum SERVER_SECURITY_TYPE { HTTP, HTTPS }

class NetworkRequest {
  NETWORK_REQUEST_TYPE requestType;
  NETWORK_RESPONSE_TYPE responseType;

  String url;
  NetworkRequestUrlComposer composedUrl;
  Map<String, dynamic> requestBody;
  Map<String, String> headers;

  NetworkRequest(
      {url,
      NETWORK_REQUEST_TYPE requestType = NETWORK_REQUEST_TYPE.GET,
      NETWORK_RESPONSE_TYPE responseType = NETWORK_RESPONSE_TYPE.JSON,
      this.requestBody,
      this.headers,
      this.composedUrl}) {
    if (this.composedUrl != null) {
      this.url = this.composedUrl.toString();
    } else {
      this.url = url;
    }
    this.responseType = responseType;
    this.requestType = requestType;
    if(this.headers==null){
      this.headers= new Map<String, String>();
    }
  }

  /**
   * Takes parameter as json with key/value, and merges with existing values
   */
  addRequestHeaders(Map<String, String> headersToAdd) {
    if (headersToAdd != null) {
      headers.addAll(headersToAdd);
    }
  }

  clearRequestHeaders() {
    headers = null;
  }

  addToRequestBody(Map<String, dynamic> bodyParamsToAdd) {
    if (bodyParamsToAdd != null) {
      requestBody.addAll(bodyParamsToAdd);
    }
  }

  clearRequestBody() {
    requestBody = null;
  }

  @override
  String toString() {
    return 'URL: ${url}\n'
        'Headers: ${headers}\n'
        'Request Type: ${requestType == NETWORK_REQUEST_TYPE.GET ? "GET" : "POST"}\n'
        'Response Type: ${responseType == NETWORK_RESPONSE_TYPE.JSON ? "JSON" : "XML"}\n'
        'Request Body: ${requestBody}';
  }
}
