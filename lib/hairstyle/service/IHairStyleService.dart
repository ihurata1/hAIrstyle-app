import 'package:boilerplate/hairstyle/model/request.dart';
import 'package:boilerplate/hairstyle/model/response.dart';

abstract class IHairStyleService {
  final String baseApiUrl;
  IHairStyleService(this.baseApiUrl);

  final String endpoint = IHairStyleServicePath.STYLE.value;
  Future<HairStyleResponseM?> style(HairStyleRequestM requestModel);
}

enum IHairStyleServicePath { STYLE }

extension IHairStyleServicePathExtension on IHairStyleServicePath {
  String get value {
    switch (this) {
      case IHairStyleServicePath.STYLE:
        return '/api/portrait/effects/hairstyle-editor-pro';
    }
  }
}

//https://www.ailabapi.com base api