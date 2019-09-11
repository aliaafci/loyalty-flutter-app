import 'category.dart';

class Partner {

  String arabicdescription = null;


  String arabicname = null;


  Category categoryInfo = null;


  String description = null;


  int id = null;



  String logoimageContentType = null;


  String name = null;


  String notes = null;


  DateTime updatetime = null;

  Partner();

  @override
  String toString() {
    return 'PartnerInfo[arabicdescription=$arabicdescription, arabicname=$arabicname, categoryInfo=$categoryInfo, description=$description, id=$id, logoimageContentType=$logoimageContentType, name=$name, notes=$notes, updatetime=$updatetime, ]';
  }

  Partner.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    arabicdescription =
    json['arabicdescription']
    ;
    arabicname =
    json['arabicname']
    ;
    categoryInfo =


    new Category.fromJson(json['categoryInfo'])
    ;
    description =
    json['description']
    ;
    id =
    json['id']
    ;

    logoimageContentType =
    json['logoimageContentType']
    ;
    name =
    json['name']
    ;
    notes =
    json['notes']
    ;

    updatetime = json['updatetime'] == null ? null : DateTime.parse(json['updatetime']);
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
      'updatetime': updatetime == null ? '' : updatetime.toUtc().toIso8601String()
    };
  }

  static List<Partner> listFromJson(List<dynamic> json) {
    return json == null ? new List<Partner>() : json.map((value) => new Partner.fromJson(value)).toList();
  }

  static Map<String, Partner> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Partner>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Partner.fromJson(value));
    }
    return map;
  }
}

