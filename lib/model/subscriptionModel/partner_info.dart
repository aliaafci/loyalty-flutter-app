import 'subscriptionIndex.dart';

class PartnerInfo {
  String arabicdescription = null;

  String arabicname = null;

  CategoryInfo categoryInfo = null;

  String description = null;

  int id = null;

  String logoimageContentType = null;

  String name = null;

  String notes = null;

  List<SubscriptionInfo> subscriptionInfos = [];

  DateTime updatetime = null;

  PartnerInfo();

  @override
  String toString() {
    return 'PartnerInfo[arabicdescription=$arabicdescription, arabicname=$arabicname, categoryInfo=$categoryInfo, description=$description, id=$id, logoimageContentType=$logoimageContentType, name=$name, notes=$notes, subscriptionInfos=$subscriptionInfos, updatetime=$updatetime, ]';
  }

  PartnerInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    arabicdescription = json['arabicdescription'];
    arabicname = json['arabicname'];
    categoryInfo = new CategoryInfo.fromJson(json['categoryInfo']);
    description = json['description'];
    id = json['id'];

    logoimageContentType = json['logoimageContentType'];
    name = json['name'];
    notes = json['notes'];
    subscriptionInfos =
        SubscriptionInfo.listFromJson(json['subscriptionInfos']);
    updatetime =
        json['updatetime'] == null ? null : DateTime.parse(json['updatetime']);
  }

  Map<String, dynamic> toJson() {
    return {
      'arabicdescription': arabicdescription,
      'arabicname': arabicname,
      'categoryInfo': categoryInfo,
      'description': description,
      'id': id,
      'logoimageContentType': logoimageContentType,
      'name': name,
      'notes': notes,
      'subscriptionInfos': subscriptionInfos,
      'updatetime':
          updatetime == null ? '' : updatetime.toUtc().toIso8601String()
    };
  }

  static List<PartnerInfo> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<PartnerInfo>()
        : json.map((value) => new PartnerInfo.fromJson(value)).toList();
  }

  static Map<String, PartnerInfo> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PartnerInfo>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new PartnerInfo.fromJson(value));
    }
    return map;
  }
}
