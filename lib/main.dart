import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/configs/constants/app_routes.dart';
import 'core/configs/routes/app_route_generator.dart';
import 'core/injection/injection_container.dart' as di;
import 'core/injection/injection_container.dart';
import 'core/presentation/blocs/app_nav_bar_cubit/app_nav_bar_cubit.dart';
import 'core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'core/services/navigation_service.dart';
import 'core/theme/app_theme.dart';
import 'core/util/bloc_observer.dart';
import 'core/util/translate_preferences.dart';
import 'features/authentication/presentation/blocs/authentication_cubit/authentication_cubit.dart';
import 'features/authentication/presentation/blocs/create_account_cubit/create_account_cubit.dart';
import 'features/authentication/presentation/blocs/firebase_authentication_bloc/firebase_authentication_bloc.dart';
import 'features/authentication/presentation/blocs/forgot_password_cubit/forgot_password_cubit.dart';
import 'features/authentication/presentation/blocs/login_cubit/login_cubit.dart';
import 'features/authentication/presentation/blocs/phone_verification_cubit/phone_verification_cubit.dart';
import 'features/authentication/presentation/blocs/sign_up_cubit/sign_up_cubit.dart';
import 'features/browse/presentation/bloc/cubit/top_sellers_cubit.dart';
import 'features/categories/presentation/bloc/categories_cubit/categories_cubit.dart';
import 'features/countries_and_cities/presentation/blocs/countries_and_cities_cubit/countries_and_cities_cubit.dart';
import 'features/languages/presentation/blocs/languages_cubit/languages_cubit.dart';
import 'features/onboarding/presentation/blocs/onboarding_page_cubit/onboarding_page_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  Bloc.observer = AppBlocObserver();

  await di.init();

  // await Hive.box('appSettings').clear();

  final delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['en'],
    preferences: TranslatePreferences(),
  );

  // await HydratedBloc.storage.clear();
  runApp(LocalizedApp(delegate, App()));
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingPageCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<AppNavBarCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<AppThemeCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<FirebaseAuthenticationBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<AuthenticationCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<SignUpCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<ForgotPasswordCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<CreateAccountCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<PhoneVerificationCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<CountriesAndCitiesCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<LanguagesCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<TopSellersCubit>(
          create: (context) => sl<TopSellersCubit>(),
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) => sl(),
        ),
      ],
      child: Builder(builder: (context) {
        return BlocProvider(
          create: (context) => CreateAccountCubit(
              countriesAndCitiesCubit: context.read<CountriesAndCitiesCubit>(),
              languagesCubit: context.read<LanguagesCubit>(),
              authenticationCubit: context.read<AuthenticationCubit>(),
              registerUserUseCase: sl(),
              verifyPhoneNumberInFirebaseUseCase: sl()),
          child: Builder(builder: (context) {
            return BlocProvider(
              create: (context) => PhoneVerificationCubit(
                updatePhoneNumberInFirebaseUseCase: sl(),
                createAccountCubit: context.read<CreateAccountCubit>(),
              ),
              child: BlocBuilder<AppThemeCubit, AppTheme>(
                builder: (context, state) {
                  return MaterialApp(
                    localizationsDelegates: [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      localizationDelegate
                    ],
                    supportedLocales: localizationDelegate.supportedLocales,
                    locale: localizationDelegate.currentLocale,
                    debugShowCheckedModeBanner: false,
                    navigatorKey: sl<NavigatorService>().key,
                    onGenerateRoute: AppRouteGenerator.generateRoute,
                    title: 'Rogo',
                    theme: ThemeData(
                      primaryColor: state.appColors.primaryColor,
                      fontFamily: state.fontFamily,
                      scaffoldBackgroundColor: state.appColors.scaffoldBackgroundColor,
                    ),
                    initialRoute: AppRoutes.mainPage,
                  );
                },
              ),
            );
          }),
        );
      }),
    );
  }
}
