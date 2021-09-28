import 'package:rogo/features/inbox/domain/entities/chat_room_user.dart';

String userInitialsFromUser(ChatRoomUser user) {
  if (user.firstName.length <= 0 && user.lastName.length <= 0) {
    return '';
  } else if (user.firstName.length <= 0 && user.lastName.length > 0) {
    return user.lastName[0];
  } else if (user.firstName.length > 0 && user.lastName.length <= 0) {
    return user.firstName[0];
  } else {
    return user.firstName[0].toUpperCase() + user.lastName[0].toUpperCase();
  }
}
