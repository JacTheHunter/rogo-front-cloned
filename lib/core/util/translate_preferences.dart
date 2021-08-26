import 'dart:ui';

import 'package:flutter_translate/flutter_translate.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/services/box_service.dart';

class TranslatePreferences implements ITranslatePreferences {
  @override
  Future<Locale> getPreferredLocale() async {
    return localeFromString(sl<BoxService>().appSettings.get('appLang') ?? 'ru');
  }

  @override
  Future savePreferredLocale(Locale locale) async {
    sl<BoxService>().appSettings.put('appLang', localeToString(locale));
  }
}
