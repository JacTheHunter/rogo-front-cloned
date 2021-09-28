import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/configs/constants/app_routes.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/presentation/pages/authenticated_page.dart';
import 'package:rogo/core/services/navigation_service.dart';
import 'package:rogo/core/services/notification_service.dart';
import 'package:rogo/features/inbox/presentation/blocs/chat_messages_bloc/chat_messages_bloc.dart';
import 'package:rogo/features/inbox/presentation/blocs/chat_rooms_bloc/chat_rooms_bloc.dart';
import 'package:rogo/features/inbox/presentation/pages/inbox_page.dart';

import '../../../features/authentication/presentation/blocs/authentication_cubit/authentication_cubit.dart';
import '../../../features/authentication/presentation/blocs/firebase_authentication_bloc/firebase_authentication_bloc.dart';
import '../../../features/authentication/presentation/pages/create_account_page.dart';
import '../../../features/authentication/presentation/pages/login_page.dart';
import '../../../features/browse/presentation/bloc/cubit/top_sellers_cubit.dart';
import '../../../features/browse/presentation/pages/browse_page.dart';
import '../../../features/categories/presentation/bloc/categories_cubit/categories_cubit.dart';
import '../../../features/countries_and_cities/presentation/blocs/countries_and_cities_cubit/countries_and_cities_cubit.dart';
import '../../../features/languages/presentation/blocs/languages_cubit/languages_cubit.dart';
import '../../../features/profile/presentation/pages/profile_page.dart';
import '../../../features/wishlists/presentation/pages/wishlists_page.dart';
import '../blocs/app_nav_bar_cubit/app_nav_bar_cubit.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'widgets/app_bottom_nav_bar.dart';
import 'widgets/app_loader.dart';
import 'widgets/app_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // if (!onboardingPassed) sl<NavigatorService>().pushNamed(AppRoutes.onboardingPage);
      //  if (!selectLangPassed) sl<NavigatorService>().pushNamed(AppRoutes.selectLanguagePage);
    });
    context.read<CountriesAndCitiesCubit>().fetchCountries();
    context.read<LanguagesCubit>().fetchLanguages();
    // context.read<AuthenticationCubit>().checkTokenExpiration();
    // context.read<NewsCubit>().fetchNews();
    // context.read<PromotionCubit>().fetchPromotions();

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        //  context.read<ApplockCubit>().appPaused();
        break;
      case AppLifecycleState.resumed:
        //  context.read<ApplockCubit>().appResumed();
        break;
      default:
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FirebaseAuthenticationBloc, FirebaseAuthenticationState>(
      listener: (context, state) {
        if (state.status == FirebaseAuthenticationStatus.authenticated) {
          if (state.user.isAnonymous) {
            context.read<AuthenticationCubit>().currentUserIsGuest();
            context.read<CategoriesCubit>().fetchCategories();
            context.read<TopSellersCubit>().fetchTopSellers();
          } else {
            context.read<AuthenticationCubit>().getCurrentUser();
          }
        }
      },
      builder: (context, state) {
        if (state.status == FirebaseAuthenticationStatus.unauthenticated) {
          return LoginPage();
        } else {
          return BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              if (state.status == AuthenticationStatus.loading) {
                return Scaffold(
                  body: AppLoader(),
                );
              }
              if (state.status == AuthenticationStatus.unregistered) {
                return CreateAccountPage();
              }
              return AuthenticatedPage();
            },
          );
        }
      },
    );
  }
}
