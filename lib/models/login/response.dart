class LoginResponseM {
  String? userName;
  String? token;

  LoginResponseM({this.userName, this.token});

  LoginResponseM.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['token'] = this.token;
    return data;
  }
}
