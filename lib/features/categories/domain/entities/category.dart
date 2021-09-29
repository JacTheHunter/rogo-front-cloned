import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String image;
  final String name;
  final int treeId;
  final int level;
  final int? parent;

  Category({
    required this.id,
    required this.image,
    required this.name,
    required this.treeId,
    required this.level,
    required this.parent,
  });

  @override
  List<Object?> get props {
    return [id, image, name, treeId, level, parent];
  }

  @override
  String toString() {
    return name;
  }
}
