class RegistrationVm {
  bool activated = null;
  String arabicFirstname = null;
  String arabicFullName = null;
  String arabicLastname = null;
  String createdBy = null;
  String createdDate = null;
  String email = null;
  String englishFullName = null;
  String firstName = null;
  String langKey = null;
  String lastModifiedBy = null;
  String lastModifiedDate = null;
  String lastName = null;
  String login = null;
  String mobile = null;
  String password = null;

  RegistrationVm(
      {this.activated = true,
      this.arabicFirstname,
      this.arabicFullName,
      this.arabicLastname,
      this.createdBy = "mobileappandriod",
      this.createdDate,
      this.email,
      this.englishFullName,
      this.firstName,
      this.langKey = "en-ly", // to be changed later
      this.lastModifiedBy = "mobileappandriod",
      this.lastModifiedDate,
      this.lastName,
      this.login,
      this.mobile,
      this.password}) {
    var currentDate = new DateTime.now();
    if (this.createdDate == null) {
      this.createdDate = currentDate.toString();
    }
    if (this.lastModifiedDate == null) {
      this.lastModifiedDate = currentDate.toString();
    }
  }

  @override
  String toString() {
    return 'RegistrationVm[activated=$activated, arabicFirstname=$arabicFirstname, arabicFullName=$arabicFullName, arabicLastname=$arabicLastname, createdBy=$createdBy, createdDate=$createdDate,  email=$email, englishFullName=$englishFullName, firstName=$firstName, langKey=$langKey, lastModifiedBy=$lastModifiedBy, lastModifiedDate=$lastModifiedDate, lastName=$lastName, login=$login, mobile=$mobile, password=$password, ]';
  }

  RegistrationVm.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    activated = json['activated'];
    arabicFirstname = json['arabicFirstname'];
    arabicFullName = json['arabicFullName'];
    arabicLastname = json['arabicLastname'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate']).toString();
    email = json['email'];
    englishFullName = json['englishFullName'];
    firstName = json['firstName'];
    langKey = json['langKey'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedDate = json['lastModifiedDate'] == null
        ? null
        : DateTime.parse(json['lastModifiedDate']).toString();
    lastName = json['lastName'];
    login = json['login'];
    mobile = json['mobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'activated': activated,
      'arabicFirstname': arabicFirstname,
      'arabicFullName': arabicFullName,
      'arabicLastname': arabicLastname,
      'createdBy': createdBy,
      'createdDate':
          createdDate == null ? '' : createdDate.toString(),
      'email': email,
      'englishFullName': englishFullName,
      'firstName': firstName,
      'langKey': langKey,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedDate': lastModifiedDate == null
          ? ''
          : lastModifiedDate.toString(),
      'lastName': lastName,
      'login': login,
      'mobile': mobile,
      'password': password
    };
  }

  static List<RegistrationVm> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<RegistrationVm>()
        : json.map((value) => new RegistrationVm.fromJson(value)).toList();
  }

  static Map<String, RegistrationVm> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RegistrationVm>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new RegistrationVm.fromJson(value));
    }
    return map;
  }
}
