import 'dart:convert';

import '../../domain/entities/city.dart';

class CityModel extends City {
  final int id;
  final String name;
  CityModel({
    required this.id,
    required this.name,
  }) : super(
          id: id,
          name: name,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) => CityModel.fromMap(json.decode(source));
}
