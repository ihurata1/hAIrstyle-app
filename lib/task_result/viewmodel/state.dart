import 'package:boilerplate/task_result/model/response.dart';

abstract class TaskResultState {}

class InitTaskResultState extends TaskResultState {}

class LoadingTaskResultState extends TaskResultState {
  final bool isLoading;
  LoadingTaskResultState(this.isLoading);
}

class ErrorTaskResultState extends TaskResultState {
  final String message;
  ErrorTaskResultState(this.message);
}

class ValidateTaskResultState extends TaskResultState {
  final bool isValidate;
  ValidateTaskResultState(this.isValidate);
}

class ResponseTaskResultState extends TaskResultState {
  final TaskResultResponseM response;
  ResponseTaskResultState(this.response);
}
