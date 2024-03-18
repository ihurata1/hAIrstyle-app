// ignore_for_file: non_constant_identifier_names, unnecessary_this

import 'dart:io';

class HairStyleRequestM {
  String? task_type;
  String? image;
  String? hair_style;

  HairStyleRequestM({this.task_type, this.image, this.hair_style});

  HairStyleRequestM.fromJson(Map<String, dynamic> json) {
    task_type = json['task_type'];
    image = json['image'];
    hair_style = json['hair_style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_type'] = this.task_type ?? "async";
    data['image'] = this.image;
    data['hair_style'] = this.hair_style;
    return data;
  }
}
