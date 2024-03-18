class UserM {
  int? id;
  String? userName;
  String? passwordHash;
  String? passwordSalt;

  UserM({this.id, this.userName, this.passwordHash, this.passwordSalt});

  UserM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    passwordHash = json['passwordHash'];
    passwordSalt = json['passwordSalt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['passwordHash'] = this.passwordHash;
    data['passwordSalt'] = this.passwordSalt;
    return data;
  }
}
