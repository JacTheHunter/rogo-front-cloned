// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rogo/core/configs/constants/app_routes.dart';
import 'package:rogo/core/presentation/pages/error_page.dart';
import 'package:rogo/core/presentation/pages/main_page.dart';
import 'package:rogo/features/add/presentation/pages/add_new_card_page.dart';
import 'package:rogo/features/add/presentation/pages/add_publication_page.dart';
import 'package:rogo/features/add/presentation/pages/cards_page.dart';
import 'package:rogo/features/add/presentation/pages/create_new_ad_page_1.dart';
import 'package:rogo/features/add/presentation/pages/create_new_ad_page_2.dart';
import 'package:rogo/features/add/presentation/pages/create_new_ad_page_3.dart';
import 'package:rogo/features/add/presentation/pages/live_search_ad_page1.dart';
import 'package:rogo/features/add/presentation/pages/live_search_ad_page_2.dart';
import 'package:rogo/features/add/presentation/pages/live_search_ad_page_3.dart';
import 'package:rogo/features/add/presentation/pages/stripe_page.dart';
import 'package:rogo/features/authentication/presentation/pages/confirm_phone_number_page.dart';
import 'package:rogo/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:rogo/features/authentication/presentation/pages/login_page.dart';
import 'package:rogo/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:rogo/features/browse/presentation/pages/browse_item_page.dart';
import 'package:rogo/features/onboarding/presentation/pages/onboarding_page.dart';

class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

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
      case AppRoutes.confirmPhoneNumberPage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => ConfirmPhoneNumberPage(),
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
      case AppRoutes.browseItemPage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => BrowseItemPage(),
        );

      case AppRoutes.stripePage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => StripePage(),
        );

      case AppRoutes.cardsPage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => CardsPage(),
        );
      case AppRoutes.addNewCardPage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => AddNewCardPage(),
        );
      case AppRoutes.createNewAdPage1:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => CreateNewAdPage1(),
        );
      case AppRoutes.createNewAdPage2:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => CreateNewAdPage2(),
        );
      case AppRoutes.createNewAdPage3:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => CreateNewAdPage3(),
        );
      case AppRoutes.liveSearchNewAdPage1:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => LiveSearchNewAdPage1(),
        );
      case AppRoutes.liveSearchNewAdPage2:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => LiveSearchNewAdPage2(),
        );
      case AppRoutes.liveSearchNewAdPage3:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => LiveSearchNewAdPage3(),
        );
      case AppRoutes.mainPage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => MainPage(),
        );
      case AppRoutes.addPublicationPage:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => AddPublicationPage(),
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
