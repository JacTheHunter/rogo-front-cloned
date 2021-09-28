import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rogo/core/configs/constants/api.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/services/api_service.dart';
import 'package:rogo/core/services/device_info_service.dart';

class NotificationsService {
  late String _token;
  late String _status;
  Future<NotificationsService> init() async {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print(event.data);
    });
    FirebaseMessaging.onMessage.listen((event) {
      print(event.data);
    });

    final token = await FirebaseMessaging.instance.getToken();
    _token = token ?? '';

    return this;
  }

  String get token => _token;
  String get status => _status;

  Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;
  Stream<RemoteMessage> get onMessageOpenedApp => FirebaseMessaging.onMessageOpenedApp;

  void setFcm() async {
    final name = sl<DeviceInfoService>().deviceName;
    final deviceId = sl<DeviceInfoService>().deviceId;
    final type = sl<DeviceInfoService>().type;
    final response = await sl<ApiService>().post(k_API_END_POINT_NOTIFICATIONS, data: {
      'name': name,
      'registration_id': _token,
      'device_id': deviceId,
      'type': type,
    });
    _status = response.statusMessage ?? '';
    print(response.statusCode);
  }
}
