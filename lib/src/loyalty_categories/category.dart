import './partnerInfo.dart';

class Category {

  String arabicdescription = null;


  String arabicname = null;


  String description = null;


  int id = null;


  String name = null;


  String notes = null;


  List<Partner> partnerInfos = [];


  DateTime updatetime = null;

  bool isActive=false;

  Category();

  @override
  String toString() {
    return 'CategoryInfo[arabicdescription=$arabicdescription, arabicname=$arabicname, description=$description, id=$id, name=$name, notes=$notes, partnerInfos=$partnerInfos, updatetime=$updatetime, ]';
  }

  Category.fromJson(Map<String, dynamic> json) {
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
        Partner.listFromJson(json['partnerInfos'])
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

  static List<Category> listFromJson(List<dynamic> json) {
    return json == null ? new List<Category>() : json.map((value) => new Category.fromJson(value)).toList();
  }

  static Map<String, Category> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Category>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Category.fromJson(value));
    }
    return map;
  }
}

