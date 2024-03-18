// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/constants/app.dart';
import 'package:boilerplate/hairstyle/model/response.dart';
import 'package:boilerplate/task_result/service/task_result_service.dart';
import 'package:boilerplate/task_result/viewmodel/cubit.dart';
import 'package:boilerplate/task_result/viewmodel/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HairStyleResultScreen extends StatelessWidget {
  final HairStyleResponseM response;
  HairStyleResultScreen({super.key, required this.response});
  Widget get _hairstyleResults {
    //if (response.taskId != null) return Text(response.taskId.toString());
    return BlocProvider(
      create: (context) => TaskResultCubit(
          taskId: response.taskId.toString(),
          service: TaskResultService(
            Application.apiBaseUrl,
          )),
      child: BlocConsumer<TaskResultCubit, TaskResultState>(
        builder: (context, state) {
          if (state is ResponseTaskResultState) {
            if (state.response.taskStatus != 2) {
              Future.delayed(Duration(seconds: 1)).then((v) => context.read<TaskResultCubit>().getTaskResult());

              return const CircularProgressIndicator();
            }
            return GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 3 / 4,
              children: List.generate(state.response.data!.images!.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          child: Image.network(
                            state.response.data!.images![index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          } else if (state is LoadingTaskResultState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorTaskResultState) {
            return Center(child: Text(state.message));
          } else
            return Container(color: Colors.red);
        },
        listener: (context, state) {},
      ),
    );
    /*return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 3 / 4,
      children: List.generate(response.data!.images!.length, (index) {
        return Container(
          margin: EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  child: Image.network(
                    response.data!.images![index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: _hairstyleResults,
    );
  }
}
