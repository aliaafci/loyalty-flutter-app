class ChangePasswordVM {

  String currentPassword = null;


  String newPassword = null;


  ChangePasswordVM({this.currentPassword, this.newPassword});

  @override
  String toString() {
    return 'ChangePasswordVM[currentPassword=$currentPassword, newPassword=$newPassword, ]';
  }

  ChangePasswordVM.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    currentPassword =
    json['currentPassword']
    ;
    newPassword =
    json['newPassword']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPassword': currentPassword,
      'newPassword': newPassword
    };
  }

  static List<ChangePasswordVM> listFromJson(List<dynamic> json) {
    return json == null ? new List<ChangePasswordVM>() : json.map((value) => new ChangePasswordVM.fromJson(value)).toList();
  }

  static Map<String, ChangePasswordVM> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ChangePasswordVM>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ChangePasswordVM.fromJson(value));
    }
    return map;
  }
}

