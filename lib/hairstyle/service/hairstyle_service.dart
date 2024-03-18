import 'dart:convert';

import 'package:boilerplate/constants/app.dart';
import 'package:boilerplate/hairstyle/model/request.dart';
import 'package:boilerplate/hairstyle/model/response.dart';
import 'package:http/http.dart' as http;

import 'IHairStyleService.dart';

class HairStyleService extends IHairStyleService {
  HairStyleService(String baseApiUrl) : super(baseApiUrl);

  @override
  Future<HairStyleResponseM?> style(HairStyleRequestM requestModel) async {
    print(requestModel.toJson().toString());
    print("${Application.apiBaseUrl}$endpoint");

    var uri = Uri.parse("${Application.apiBaseUrl}$endpoint");
    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll({
      "ailabapi-api-key": Application.apiKey,
      "Content-Type": "multipart/form-data",
      // Diğer header'ları buraya ekleyin.
    });
    request.fields['color'] = "black"; // İlk string değeri ekleyin.
    request.fields['hair_style'] = requestModel.hair_style!; // İlk string değeri ekleyin.
    request.fields['task_type'] = requestModel.task_type!; // İlk string değeri ekleyin.
    request.fields['image_size'] = "4"; // İlk string değeri ekleyin.

    var multipartFile = await http.MultipartFile.fromPath(
      'image', // Sunucu tarafında dosyayı tanımlamak için kullanılan anahtar.
      requestModel.image!, // Göndermek istediğiniz dosyanın yolu.
    );

    request.files.add(multipartFile);
    var response = await request.send();

    if (response.statusCode == 200) {
      final json = await response.stream.bytesToString();
      print("Başarılı");
      return HairStyleResponseM.fromJson(jsonDecode(json));
    } else if (response.statusCode == 401) {
      throw "${response.reasonPhrase}";
    } else {
      throw "Something went wrong codess ${request.fields}";
    }
  }
}
