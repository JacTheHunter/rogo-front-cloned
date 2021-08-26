import 'package:equatable/equatable.dart';

class City extends Equatable {
  final int id;
  final String name;
  City({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];

  @override
  String toString() {
    return name;
  }
}
