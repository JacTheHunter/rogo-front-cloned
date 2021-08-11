import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rogo/core/presentation/blocs/app_nav_bar_cubit/app_nav_bar_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rogo/core/theme/app_theme.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/features/authentication/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:rogo/features/authentication/presentation/blocs/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:rogo/features/authentication/presentation/blocs/login_cubit/login_cubit.dart';
import 'core/configs/constants/app_routes.dart';
import 'core/injection/injection_container.dart' as di;
import 'core/injection/injection_container.dart';
import 'core/services/navigation_service.dart';
import 'core/util/bloc_observer.dart';
import 'core/util/translate_preferences.dart';
import 'core/configs/routes/app_route_generator.dart';
import 'features/authentication/presentation/blocs/sign_up_cubit/sign_up_cubit.dart';
import 'features/onboarding/presentation/blocs/onboarding_page_cubit/onboarding_page_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIOverlays([]);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  Bloc.observer = AppBlocObserver();

  await di.init();

  await Hive.initFlutter();

  await Hive.openBox('appSettings');

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
        BlocProvider<AuthenticationBloc>(
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
      ],
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
              primaryColor: state.appColors().primaryColor(),
              fontFamily: state.fontFamily(),
              scaffoldBackgroundColor: state.appColors().scaffoldBackgroundColor(),
            ),
            initialRoute: AppRoutes.mainPage,
          );
        },
      ),
    );
  }
}
