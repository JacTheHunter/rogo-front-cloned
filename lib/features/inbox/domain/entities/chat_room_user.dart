import 'package:equatable/equatable.dart';

class ChatRoomUser extends Equatable {
  final int id;
  final String? userName;
  final String avatar;
  final String firstName;
  final String lastName;
  final String fullName;
  ChatRoomUser({
    required this.id,
    required this.userName,
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.fullName,
  });

  @override
  List<Object?> get props {
    return [
      id,
      userName,
      avatar,
      firstName,
      lastName,
      fullName,
    ];
  }
}
