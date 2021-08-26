import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final int id;
  final String name;
  Country({
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
