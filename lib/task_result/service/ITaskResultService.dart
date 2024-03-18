import 'package:boilerplate/task_result/model/response.dart';

abstract class ITaskResultService {
  final String baseApiUrl;
  ITaskResultService(this.baseApiUrl);

  final String endpoint = ITaskResultServicePath.RESULT.value;
  Future<TaskResultResponseM?> getTaskResult(String taskId);
}

enum ITaskResultServicePath { RESULT }

extension ITaskResultServicePathExtension on ITaskResultServicePath {
  String get value {
    switch (this) {
      case ITaskResultServicePath.RESULT:
        return '/api/common/query-async-task-result';
    }
  }
}
