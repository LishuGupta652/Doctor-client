import 'dart:ui';

class Symptoms {
  String title;
  String icon;
  String backgroundColor;

  Symptoms({this.title, this.icon, this.backgroundColor});

  Map toMap(Symptoms symptoms) {
    var data = Map<String, dynamic>();
    data['title'] = symptoms.title;
    data['icon'] = symptoms.icon;
    data['backgroundColor'] = symptoms.backgroundColor;
    return data;
  }

  Symptoms.fromMap(Map<String, dynamic> mapData) {
    this.title = mapData['title'];
    this.icon = mapData['icon'];
    this.backgroundColor = mapData['backgroundColor'];
  }
}
