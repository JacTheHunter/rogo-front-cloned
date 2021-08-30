import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String icon;
  final String name;
  final int treeId;
  final int level;
  final int? parent;

  Category({
    required this.id,
    required this.icon,
    required this.name,
    required this.treeId,
    required this.level,
    required this.parent,
  });

  @override
  List<Object?> get props {
    return [id, icon, name, treeId, level, parent];
  }
}
