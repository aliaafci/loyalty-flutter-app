import 'dart:async';
import 'dart:convert';
import 'package:core/network.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class NetworkResponse<Model> {
//  NetworkResponse();
//  Model fromJson(Map<String, dynamic> parsedJson);
  NetworkResponse.fromJson(Map<String, dynamic> parsedJson);
}

// Reference: https://medium.com/@kashifmin/flutter-login-app-using-rest-api-and-sqflite-b4815aed2149
class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal() {
//   Initialization code for the singleton here
  }

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> sendRequest(NetworkRequest request, BuildContext context) async {
    var response;

    debugPrint(request.toString());
    if (request.requestType == NETWORK_REQUEST_TYPE.POST) {
      response = await http.post(request.url,
          body: json.encode(request.requestBody), headers: request.headers);
    } else {
      response = await http.get(request.url, headers: request.headers);
    }

    if (response.statusCode != null) {
      switch (response.statusCode) {
        case 200:
        case 201:
          switch (request.responseType) {
            case NETWORK_RESPONSE_TYPE.XML:
              //TODO: Add parsing for XML later
              return response.body.toString();
              break;
            case NETWORK_RESPONSE_TYPE.JSON:
            default:
              var responseToReturn;
              if (response.body != null && response.body!='') {
                responseToReturn = _decoder.convert(response.body);
                debugPrint("Response: $responseToReturn");
              } else {
                responseToReturn = null;
              }

              return responseToReturn;
              break;
          }
          break;
        default:
          if(context != null){
            var errorMsg = _decoder.convert(response.body)['title'];
            showNetworkError(context, "Error", errorMsg);
          }
          throw new Exception("Error while fetching data");
          break;
      }
    }
  }

  Future<dynamic> getJson(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode != 200 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return res;
//      return _decoder.convert(res);
    });
  }

  void showNetworkError(BuildContext context, String errorTitle, String errorMsg) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(errorTitle),
          content: Text(errorMsg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
    );
  }

}
