import 'package:hive_flutter/hive_flutter.dart';

class BoxService {
  late Box appSettings;

  BoxService();

  Future<BoxService> init() async {
    await Hive.initFlutter();
    await Hive.openBox('appSettings');
    appSettings = Hive.box('appSettings');
    return this;
  }

  // Future<void> putToSettings(dynamic key, dynamic value) async {
  //   return await appSettings.put(key, value);
  // }

  // Future<void> getFromSettings(dynamic key) async {
  //   return await appSettings.get(key);
  // }
}
