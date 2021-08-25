import 'dart:convert';

import 'package:rogo/features/countries_and_cities/domain/entities/country.dart';

class CountryModel extends Country {
  final int id;
  final String name;
  CountryModel({
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

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source));
}
