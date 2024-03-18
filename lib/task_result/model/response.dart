// ignore_for_file: unnecessary_this

class TaskResultResponseM {
  int? errorCode;
  String? errorCodeStr;
  String? errorMsg;
  int? taskStatus;
  Data? data;

  TaskResultResponseM({this.errorCode, this.errorCodeStr, this.errorMsg, this.taskStatus, this.data});

  TaskResultResponseM.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    errorCodeStr = json['error_code_str'];
    errorMsg = json['error_msg'];
    taskStatus = json['task_status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['error_code_str'] = this.errorCodeStr;
    data['error_msg'] = this.errorMsg;
    data['task_status'] = this.taskStatus;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? images;

  Data({this.images});

  Data.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['images'] = this.images;
    return data;
  }
}
