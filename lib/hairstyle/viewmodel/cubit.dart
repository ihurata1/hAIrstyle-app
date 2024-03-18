import 'dart:core';
import 'dart:io';

import 'package:boilerplate/hairstyle/model/request.dart';
import 'package:boilerplate/hairstyle/model/response.dart';
import 'package:boilerplate/hairstyle/service/IHairStyleService.dart';
import 'package:boilerplate/hairstyle/viewmodel/state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HairStyleCubit extends Cubit<HairStyleState> {
  String? image;
  String? hairStyle;
  final String? taskType;

  final IHairStyleService service;

  bool isLoading = false;

  HairStyleCubit({this.image, required this.hairStyle, required this.taskType, required this.service}) : super(InitHairStyleState());

  void updateImageAndHairStyle(String? newImage, String newHairStyle) {
    image = newImage;
    hairStyle = newHairStyle;
    emit(UpdateHairStyleState());
  }

  Future<void> styleHair() async {
    try {
      emit(LoadingHairStyleState(isLoading));
      changeLoadingView();
      final response = await service.style(HairStyleRequestM(task_type: taskType, image: image, hair_style: hairStyle));
      changeLoadingView();

      if (response is HairStyleResponseM) {
        emit(ResponseHairStyleState(response)); //modify
      }
    } catch (e) {
      Future.delayed(Duration(seconds: 1));
      changeLoadingView();
      emit(ErrorHairStyleState(e.toString()));
      print("GİRDİ  " + e.toString());
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoadingHairStyleState(isLoading));
  }
}
