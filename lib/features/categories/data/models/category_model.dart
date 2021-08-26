import 'dart:convert';

import 'package:rogo/features/categories/domain/entities/category.dart';

class CategoryModel extends Category {
  final int id;
  final String icon;
  final String name;
  final int treeId;
  final int level;
  final int parent;

  CategoryModel({
    required this.id,
    required this.icon,
    required this.name,
    required this.treeId,
    required this.level,
    required this.parent,
  }) : super(
          id: id,
          icon: icon,
          name: name,
          treeId: treeId,
          level: level,
          parent: parent,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'icon': icon,
      'name': name,
      'treeId': treeId,
      'level': level,
      'parent': parent,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      icon: map['icon'],
      name: map['name'],
      treeId: map['treeId'],
      level: map['level'],
      parent: map['parent'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));
}
