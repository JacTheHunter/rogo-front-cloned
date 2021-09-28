import 'dart:convert';

import '../../domain/entities/user.dart';

class UserModel extends User {
  final int id;
  final String phone;
  final String firstName;
  final String lastName;
  UserModel({
    required this.id,
    required this.phone,
    required this.firstName,
    required this.lastName,
  }) : super(
          id: id,
          phone: phone,
          firstName: firstName,
          lastName: lastName,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      phone: map['phone'],
      firstName: map['first_name'] ?? 'emptry',
      lastName: map['last_name'] ?? 'emptry',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
