import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';

class AppFormaters {
  static chatTime(DateTime dt) {
    final formater = DateFormat('hh:mm a');
    return formater.format(dt);
  }

  static chatRoomTime(DateTime? dt, {bool onlyDate = false}) {
    if (dt != null) {
      final formater = DateFormat('dd.MM.yy');
      if (dt.isBefore(DateTime.now().subtract(Duration(days: 1))) &&
          dt.isAfter(DateTime.now().subtract(Duration(days: 2)))) {
        return translate('formaters.date.yesterday');
      } else if (dt.isBefore(DateTime.now().subtract(Duration(days: 2)))) {
        return formater.format(dt);
      } else {
        return onlyDate ? formater.format(dt) : chatTime(dt);
      }
    } else {
      return '';
    }
  }
}
