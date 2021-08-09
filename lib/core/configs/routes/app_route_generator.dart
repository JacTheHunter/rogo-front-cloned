// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rogo/core/configs/constants/app_routes.dart';
import 'package:rogo/core/presentation/pages/error_page.dart';
import 'package:rogo/core/presentation/pages/main_page.dart';
import 'package:rogo/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:rogo/features/authentication/presentation/pages/login_page.dart';
import 'package:rogo/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:rogo/features/onboarding/presentation/pages/onboarding_page.dart';

class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.onboardingPage:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => OnBoardingPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slideFromRight(animation, child);
          },
          settings: RouteSettings(name: settings.name),
        );
      // return CupertinoPageRoute(
      //   settings: RouteSettings(name: settings.name),
      //   builder: (_) => OnBoardingPage(),
      // );

      case AppRoutes.loginPage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => LoginPage(),
        );
      case AppRoutes.singUpPage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => SignUpPage(),
        );
      case AppRoutes.forgotPasswordPage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => ForgotPasswordPage(),
        );

      // case AppRoutes.confirmNumberPage:
      //   if (args is ConfirmPhonePreviousPage) {
      //     return CupertinoPageRoute(
      //       settings: RouteSettings(name: settings.name),
      //       builder: (_) => ConfirmPhoneNumberPage(
      //         previousPage: args,
      //       ),
      //     );
      //   } else {
      //     return CupertinoPageRoute(
      //       settings: RouteSettings(name: settings.name),
      //       builder: (_) => ConfirmPhoneNumberPage(),
      //     );
      //   }

      // case AppRoutes.appLockPage:
      //   return CupertinoPageRoute(
      //     settings: RouteSettings(name: settings.name),
      //     builder: (_) => AppLockPage(),
      //   );

      case AppRoutes.mainPage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => MainPage(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) => ErrorPage());
  }

  static AnimatedWidget slideFromRight(Animation animation, Widget child) {
    var begin = Offset(1.0, 0.0);
    var end = Offset.zero;
    var curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
