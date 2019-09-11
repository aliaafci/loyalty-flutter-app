import 'subscriptionIndex.dart';
class LoyaltySubscriptionInfo{
  static List<SubscriptionInfo> subscriptionInfoList;
}

class SubscriptionInfo {
  


  String barcodeimageContentType = null;
  

  String description = null;
  

  List<HistoryInfo> historyInfos = [];
  

  int id = null;
  

  String notes = null;
  

  PartnerInfo partnerInfo = null;
  

  int points = null;
  

  SubscriberInfo subscriberInfo = null;
  

  DateTime updatetime = null;
  
  SubscriptionInfo();

  @override
  String toString() {
    return 'SubscriptionInfo[ barcodeimageContentType=$barcodeimageContentType, description=$description, historyInfos=$historyInfos, id=$id, notes=$notes, partnerInfo=$partnerInfo, points=$points, subscriberInfo=$subscriberInfo, updatetime=$updatetime, ]';
  }

  SubscriptionInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;

    barcodeimageContentType =
        json['barcodeimageContentType']
    ;
    description =
        json['description']
    ;
    historyInfos =
      HistoryInfo.listFromJson(json['historyInfos'])
;
    id =
        json['id']
    ;
    notes =
        json['notes']
    ;
    partnerInfo =
      
      
      new PartnerInfo.fromJson(json['partnerInfo'])
;
    points =
        json['points']
    ;
    subscriberInfo =
      
      
      new SubscriberInfo.fromJson(json['subscriberInfo'])
;
    updatetime = json['updatetime'] == null ? null : DateTime.parse(json['updatetime'].toString().substring(0,10));
  }

  Map<String, dynamic> toJson() {
    return {
      'barcodeimageContentType': barcodeimageContentType,
      'description': description,
      'historyInfos': historyInfos,
      'id': id,
      'notes': notes,
      'partnerInfo': partnerInfo,
      'points': points,
      'subscriberInfo': subscriberInfo,
      'updatetime': updatetime == null ? '' : updatetime.toString().substring(0,10)
     };
  }

  static List<SubscriptionInfo> listFromJson(List<dynamic> json) {
    return json == null ? new List<SubscriptionInfo>() : json.map((value) => new SubscriptionInfo.fromJson(value)).toList();
  }

  static Map<String, SubscriptionInfo> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, SubscriptionInfo>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SubscriptionInfo.fromJson(value));
    }
    return map;
  }
}

