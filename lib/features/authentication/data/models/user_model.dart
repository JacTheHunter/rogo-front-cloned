import '../../domain/entities/user.dart';

class UserModel extends User {
  final int id;
  final String phone;
  UserModel({
    required this.id,
    required this.phone,
  }) : super(
          id: id,
          phone: phone,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'phone': phone,
    };
  }
}
