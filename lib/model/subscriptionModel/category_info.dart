import 'subscriptionIndex.dart';
class CategoryInfo {
  
  String arabicdescription = null;
  

  String arabicname = null;
  

  String description = null;
  

  int id = null;
  

  String name = null;
  

  String notes = null;
  

  List<PartnerInfo> partnerInfos = [];
  

  DateTime updatetime = null;
  
  CategoryInfo();

  @override
  String toString() {
    return 'CategoryInfo[arabicdescription=$arabicdescription, arabicname=$arabicname, description=$description, id=$id, name=$name, notes=$notes, partnerInfos=$partnerInfos, updatetime=$updatetime, ]';
  }

  CategoryInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    arabicdescription =
        json['arabicdescription']
    ;
    arabicname =
        json['arabicname']
    ;
    description =
        json['description']
    ;
    id =
        json['id']
    ;
    name =
        json['name']
    ;
    notes =
        json['notes']
    ;
    partnerInfos =
      PartnerInfo.listFromJson(json['partnerInfos'])
;
    updatetime = json['updatetime'] == null ? null : DateTime.parse(json['updatetime']);
  }

  Map<String, dynamic> toJson() {
    return {
      'arabicdescription': arabicdescription,
      'arabicname': arabicname,
      'description': description,
      'id': id,
      'name': name,
      'notes': notes,
      'partnerInfos': partnerInfos,
      'updatetime': updatetime == null ? '' : updatetime.toUtc().toIso8601String()
     };
  }

  static List<CategoryInfo> listFromJson(List<dynamic> json) {
    return json == null ? new List<CategoryInfo>() : json.map((value) => new CategoryInfo.fromJson(value)).toList();
  }

  static Map<String, CategoryInfo> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CategoryInfo>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CategoryInfo.fromJson(value));
    }
    return map;
  }
}

