import 'package:boilerplate/hairstyle/model/response.dart';
import 'package:boilerplate/models/login/response.dart';

abstract class HairStyleState {}

class InitHairStyleState extends HairStyleState {}

class LoadingHairStyleState extends HairStyleState {
  final bool isLoading;
  LoadingHairStyleState(this.isLoading);
}

class ErrorHairStyleState extends HairStyleState {
  final String message;
  ErrorHairStyleState(this.message);
}

class UpdateHairStyleState extends HairStyleState {
  UpdateHairStyleState();
}

class ResponseHairStyleState extends HairStyleState {
  final HairStyleResponseM response;
  ResponseHairStyleState(this.response);
}
