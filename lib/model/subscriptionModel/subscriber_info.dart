import 'subscriptionIndex.dart';
import 'package:loyalty_app/loyalty_models.dart';
class SubscriberInfo {
  
  String addressLine1 = null;
  

  String addressLine2 = null;
  

  String arabicfirstname = null;
  

  String arabiclastname = null;
  

  DateTime birthdate = null;
  

  String city = null;
  //enum cityEnum {  Riyadh,  Jeddah,  };

  String district = null;
  //enum districtEnum {  AlBatha,  AlMalaz,  Olaya,  Sulaymaniyyah,  };

  String email = null;
  

  String firstname = null;
  

  String gender = null;
  //enum genderEnum {  MALE,  FEMALE,  };

  int id = null;
  

  String lastname = null;
  

  String mobile = null;
  

  String notes = null;
  

  List<SubscriptionInfo> subscriptionInfos = [];
  

  DateTime updatetime = null;


  UserProfile user = null;
  
  SubscriberInfo();

  @override
  String toString() {
    return 'SubscriberInfo[addressLine1=$addressLine1, addressLine2=$addressLine2, arabicfirstname=$arabicfirstname, arabiclastname=$arabiclastname, birthdate=$birthdate, city=$city, district=$district, email=$email, firstname=$firstname, gender=$gender, id=$id, lastname=$lastname, mobile=$mobile, notes=$notes, subscriptionInfos=$subscriptionInfos, updatetime=$updatetime, user=$user, ]';
  }

  SubscriberInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    addressLine1 =
        json['addressLine1']
    ;
    addressLine2 =
        json['addressLine2']
    ;
    arabicfirstname =
        json['arabicfirstname']
    ;
    arabiclastname =
        json['arabiclastname']
    ;
    birthdate =

    json['birthdate'];

    city =
        json['city']
    ;
    district =
        json['district']
    ;
    email =
        json['email']
    ;
    firstname =
        json['firstname']
    ;
    gender =
        json['gender']
    ;
    id =
        json['id']
    ;
    lastname =
        json['lastname']
    ;
    mobile =
        json['mobile']
    ;
    notes =
        json['notes']
    ;
    subscriptionInfos =
      SubscriptionInfo.listFromJson(json['subscriptionInfos'])
;
    updatetime = json['updatetime'] == null ? null : DateTime.parse(json['updatetime']);
    user =
      
      
      new UserProfile.fromJson(json['user'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'arabicfirstname': arabicfirstname,
      'arabiclastname': arabiclastname,
      'birthdate': birthdate,
      'city': city,
      'district': district,
      'email': email,
      'firstname': firstname,
      'gender': gender,
      'id': id,
      'lastname': lastname,
      'mobile': mobile,
      'notes': notes,
      'subscriptionInfos': subscriptionInfos,
      'updatetime': updatetime == null ? '' : updatetime.toUtc().toIso8601String(),
      'user': user
     };
  }

  static List<SubscriberInfo> listFromJson(List<dynamic> json) {
    return json == null ? new List<SubscriberInfo>() : json.map((value) => new SubscriberInfo.fromJson(value)).toList();
  }

  static Map<String, SubscriberInfo> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, SubscriberInfo>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SubscriberInfo.fromJson(value));
    }
    return map;
  }
}

