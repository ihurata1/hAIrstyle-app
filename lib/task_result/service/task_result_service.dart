import 'dart:convert';

import 'package:boilerplate/constants/app.dart';
import 'package:boilerplate/task_result/model/response.dart';
import 'package:boilerplate/task_result/service/ITaskResultService.dart';
import 'package:http/http.dart' as http;

class TaskResultService extends ITaskResultService {
  TaskResultService(String baseApiUrl) : super(baseApiUrl);

  @override
  Future<TaskResultResponseM?> getTaskResult(String taskId) async {
    final response = await http.get(
      Uri.parse("${Application.apiBaseUrl}$endpoint?task_id=$taskId"),
      headers: {"ailabapi-api-key": Application.apiKey},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return TaskResultResponseM.fromJson(json);
    } else if (response.statusCode == 401) {
      throw "${response.body.toString()}";
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}
