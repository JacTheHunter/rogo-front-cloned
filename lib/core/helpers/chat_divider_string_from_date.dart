import 'package:rogo/core/helpers/formaters.dart';

String chatDividerStringFromDate(DateTime date) {
  if (date.isAfter(DateTime.now().subtract(Duration(minutes: 5)))) {
    return 'inbox.chat.justNow';
  } else {
    return AppFormaters.chatRoomTime(date, onlyDate: true);
  }
}
