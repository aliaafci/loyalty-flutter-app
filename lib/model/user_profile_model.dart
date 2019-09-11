class LoyaltyUserProfile{
  static UserProfile profile;
}


class UserProfile {
  bool activated = null;

  String email = null;

  String firstName = null;

  int id = null;

  String imageUrl = null;

  String langKey = null;

  String lastName = null;

  String login = null;

  DateTime resetDate = null;

  UserProfile();

  @override
  String toString() {
    return 'UserProfile[activated=$activated, email=$email, firstName=$firstName, id=$id, imageUrl=$imageUrl, langKey=$langKey, lastName=$lastName, login=$login, resetDate=$resetDate, ]';
  }

  UserProfile.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    activated = json['activated'];
    email = json['email'];
    firstName = json['firstName'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    langKey = json['langKey'];
    lastName = json['lastName'];
    login = json['login'];
    resetDate =
    (json['resetDate'] == null || json['resetDate'] == "" )? null : DateTime.parse(json['resetDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'activated': activated,
      'email': email,
      'firstName': firstName,
      'id': id,
      'imageUrl': imageUrl,
      'langKey': langKey,
      'lastName': lastName,
      'login': login,
      'resetDate': resetDate == null ? '' : resetDate.toUtc().toIso8601String()
    };
  }

  static List<UserProfile> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<UserProfile>()
        : json.map((value) => new UserProfile.fromJson(value)).toList();
  }

  static Map<String, UserProfile> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserProfile>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new UserProfile.fromJson(value));
    }
    return map;
  }
}
