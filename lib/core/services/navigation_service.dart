// Flutter imports:
import 'package:flutter/material.dart';

class NavigatorService {
  GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get key => _key;

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return _key.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return _key.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void popUntil(String until) {
    _key.currentState!.popUntil((Route route) => route.settings.name != until);
  }

  void popUNtilFirst() {
    if (canPop()) _key.currentState!.popUntil((route) => route.isFirst);
  }

  Future<void> pop([result]) async {
    if (canPop()) await _key.currentState!.maybePop(result);
  }

  bool canPop([result]) {
    return _key.currentState!.canPop();
  }

  // Future<void> myDialog(Widget child, {String? title, bool? hasTitleAndBack}) async {
  //   if (_key.currentContext != null) {
  //     return showDialog(
  //       barrierDismissible: false,
  //       context: _key.currentContext!,
  //       builder: (context) => MyDialog(
  //         title: title ?? '',
  //         child: child,
  //         hasTitleAndBack: hasTitleAndBack ?? true,
  //       ),
  //     );
  //   }
  // }

  Future<void> customDialog(Widget child, {bool? barrierDismissible}) async {
    if (_key.currentContext != null) {
      return showDialog(
        barrierDismissible: barrierDismissible ?? true,
        context: _key.currentContext!,
        builder: (context) => child,
      );
    }
  }
}
