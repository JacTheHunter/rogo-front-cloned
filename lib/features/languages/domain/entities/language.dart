import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final int id;
  final String name;
  final bool isTop;
  Language({
    required this.id,
    required this.name,
    required this.isTop,
  });

  @override
  List<Object> get props => [id, name, isTop];

  @override
  String toString() {
    return name;
  }
}
