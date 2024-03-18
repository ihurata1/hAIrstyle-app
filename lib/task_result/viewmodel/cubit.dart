import 'package:boilerplate/task_result/model/response.dart';
import 'package:boilerplate/task_result/service/ITaskResultService.dart';
import 'package:boilerplate/task_result/viewmodel/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskResultCubit extends Cubit<TaskResultState> {
  final String taskId;

  final ITaskResultService service;

  bool isLoading = false;

  TaskResultCubit({required this.taskId, required this.service}) : super(InitTaskResultState()) {
    getTaskResult();
  }

  Future<void> getTaskResult() async {
    try {
      print(true);
      emit(LoadingTaskResultState(isLoading));
      changeLoadingView();
      final response = await service.getTaskResult(taskId);
      await Future.delayed(const Duration(seconds: 10));

      changeLoadingView();

      if (response is TaskResultResponseM) {
        emit(ResponseTaskResultState(response)); //modify
      }
    } catch (e) {
      Future.delayed(const Duration(seconds: 1));
      changeLoadingView();
      emit(ErrorTaskResultState(e.toString()));
      print("GİRDİ  " + e.toString());
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoadingTaskResultState(isLoading));
  }
}
