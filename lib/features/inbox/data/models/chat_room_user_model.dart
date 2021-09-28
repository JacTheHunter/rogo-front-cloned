import 'dart:convert';

import 'package:rogo/features/inbox/domain/entities/chat_room_user.dart';

class ChatRoomUserModel extends ChatRoomUser {
  final int id;
  final String? userName;
  final String avatar;
  final String firstName;
  final String lastName;
  final String fullName;
  ChatRoomUserModel({
    required this.id,
    required this.userName,
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.fullName,
  }) : super(
          id: id,
          userName: userName,
          avatar: avatar,
          firstName: firstName,
          lastName: lastName,
          fullName: firstName,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': userName,
      'avatar': avatar,
      'first_name': firstName,
      'last_name': lastName,
      'get_full_name': fullName,
    };
  }

  factory ChatRoomUserModel.fromMap(Map<String, dynamic> map) {
    return ChatRoomUserModel(
      id: map['id'],
      userName: map['username'],
      avatar: map['avatar'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      fullName: map['get_full_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRoomUserModel.fromJson(String source) => ChatRoomUserModel.fromMap(json.decode(source));
}
