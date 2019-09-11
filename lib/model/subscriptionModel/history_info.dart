import 'subscriptionIndex.dart';

class HistoryInfo {
  
  String description = null;

  String arabicdescription = null;

  int id = null;
  

  String notes = null;
  

  int points = null;
  

  String recordtype = null;
  //enum recordtypeEnum {  P,  M,  };

  SubscriptionInfo subscriptionInfo = null;
  

  DateTime updatetime = null;
  
  HistoryInfo();

  @override
  String toString() {
    return 'HistoryInfo[description=$description,arabicdescription=$arabicdescription, id=$id, notes=$notes, points=$points, recordtype=$recordtype, subscriptionInfo=$subscriptionInfo, updatetime=$updatetime, ]';
  }

  HistoryInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    description =
        json['description']
    ;
    arabicdescription = json['arabicdescription'];
    id =
        json['id']
    ;
    notes =
        json['notes']
    ;
    points =
        json['points']
    ;
    recordtype =
        json['recordtype']
    ;
    subscriptionInfo =
      
      
      new SubscriptionInfo.fromJson(json['subscriptionInfo'])
;
    updatetime = json['updatetime'] == null ? null : DateTime.parse(json['updatetime']);
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'arabicdescription':arabicdescription,
      'id': id,
      'notes': notes,
      'points': points,
      'recordtype': recordtype,
      'subscriptionInfo': subscriptionInfo,
      'updatetime': updatetime == null ? '' : updatetime.toUtc().toIso8601String()
     };
  }

  static List<HistoryInfo> listFromJson(List<dynamic> json) {
    return json == null ? new List<HistoryInfo>() : json.map((value) => new HistoryInfo.fromJson(value)).toList();
  }

  static Map<String, HistoryInfo> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, HistoryInfo>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new HistoryInfo.fromJson(value));
    }
    return map;
  }
}

