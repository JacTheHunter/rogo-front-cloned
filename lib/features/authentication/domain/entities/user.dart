import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String phone;
  final String firstName;
  final String lastName;

  User({
    required this.id,
    required this.phone,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [
        id,
        phone,
        firstName,
        lastName,
      ];
}
