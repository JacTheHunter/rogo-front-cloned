import 'dart:convert';

import 'package:rogo/features/languages/domain/entities/language.dart';

class LanguageModel extends Language {
  final int id;
  final String name;
  final bool isTop;
  LanguageModel({
    required this.id,
    required this.name,
    required this.isTop,
  }) : super(
          id: id,
          name: name,
          isTop: isTop,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'is_top': isTop,
    };
  }

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      id: map['id'],
      name: map['name'],
      isTop: map['is_top'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguageModel.fromJson(String source) => LanguageModel.fromMap(json.decode(source));
}
