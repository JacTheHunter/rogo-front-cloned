import 'dart:ui';

import 'package:flutter_translate/flutter_translate.dart';
import 'package:hive/hive.dart';

class TranslatePreferences implements ITranslatePreferences {
  @override
  Future<Locale> getPreferredLocale() async {
    final box = Hive.box('appSettings');
    return localeFromString(box.get('appLang') ?? 'ru');
  }

  @override
  Future savePreferredLocale(Locale locale) async {
    final box = Hive.box('appSettings');
    box.put('appLang', localeToString(locale));
  }
}
