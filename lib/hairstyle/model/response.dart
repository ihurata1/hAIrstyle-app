class HairStyleResponseM {
  int? errorCode;
  String? errorCodeStr;
  String? errorMsg;
  String? requestId;
  String? logId;
  String? taskType;
  String? taskId;

  HairStyleResponseM({this.errorCode, this.errorCodeStr, this.errorMsg, this.requestId, this.logId, this.taskType, this.taskId});

  HairStyleResponseM.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    errorCodeStr = json['error_code_str'];
    errorMsg = json['error_msg'];
    requestId = json['request_id'];
    logId = json['log_id'];
    taskType = json['task_type'];
    taskId = json['task_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['error_code_str'] = this.errorCodeStr;
    data['error_msg'] = this.errorMsg;
    data['request_id'] = this.requestId;
    data['log_id'] = this.logId;
    data['task_type'] = this.taskType;
    data['task_id'] = this.taskId;
    return data;
  }
}
