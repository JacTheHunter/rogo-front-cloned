import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String phone;

  User({
    required this.id,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        id,
        phone,
      ];
}
