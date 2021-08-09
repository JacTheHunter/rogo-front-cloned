import 'package:get_it/get_it.dart';
import 'package:rogo/core/presentation/blocs/app_nav_bar_cubit/app_nav_bar_cubit.dart';
import 'package:rogo/core/services/api_service.dart';
import 'package:rogo/core/services/navigation_service.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/features/authentication/data/datasources/firebase_authentication_datasource.dart';
import 'package:rogo/features/authentication/data/repositories/firebase_authentication_repository_impl.dart';
import 'package:rogo/features/authentication/domain/repositories/firebase_authentication_repository.dart';
import 'package:rogo/features/authentication/domain/usecases/create_user_with_email_and_password_in_firebase_usecase.dart';
import 'package:rogo/features/authentication/domain/usecases/get_user_stream_from_firebase_usecase.dart';
import 'package:rogo/features/authentication/domain/usecases/send_password_reset_email_in_firebase_usecase.dart';
import 'package:rogo/features/authentication/domain/usecases/sign_in_anonymous_firebase_usecase.dart';
import 'package:rogo/features/authentication/domain/usecases/sign_in_with_email_and_password_in_firebase_usecase.dart';
import 'package:rogo/features/authentication/domain/usecases/sign_in_with_google_in_firebase_usecase.dart';
import 'package:rogo/features/authentication/domain/usecases/sign_out_in_firebase_usecase.dart';
import 'package:rogo/features/authentication/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:rogo/features/authentication/presentation/blocs/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:rogo/features/authentication/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:rogo/features/authentication/presentation/blocs/sign_up_cubit/sign_up_cubit.dart';
import 'package:rogo/features/onboarding/presentation/blocs/onboarding_page_cubit/onboarding_page_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  //Services
  sl.registerLazySingleton(() => NavigatorService());

  //Blocs
  sl.registerFactory(() => AppThemeCubit());
  sl.registerFactory(() => AppNavBarCubit());
  sl.registerFactory(() => OnboardingPageCubit());

  //UseCases

  //Repository

  //Data source

  //External
  sl.registerLazySingleton(() => ApiService());

  //!Feature AppLock

  //Blocs
  //sl.registerFactory(() => ApplockCubit());

  //!Feature Onboarding

  //Blocs
  // sl.registerFactory(() => OnboardingPageCubit());

  //!Feature Authentication

  //Blocs
  sl.registerFactory(() => AuthenticationBloc(
        getUserStreamInFirebaseUseCase: sl(),
        signOutInFirebaseUseCase: sl(),
        signInAnonymousInFirebaseUseCase: sl(),
        signInWithGoogleInFirebaseUseCase: sl(),
      ));
  sl.registerFactory(() => SignUpCubit(createUserWithEmailAndPasswordInFirebaseUseCase: sl()));
  sl.registerFactory(() => LoginCubit(signInWithEmailAndPasswordInFirebaseUseCase: sl()));
  sl.registerFactory(() => ForgotPasswordCubit(sendPasswordResetEmailInFirebaseUseCase: sl()));

  //UseCases
  sl.registerLazySingleton(() => GetUserStreamInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignOutInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(() => CreateUserWithEmailAndPasswordInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignInWithEmailAndPasswordInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignInAnonymousInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignInWithGoogleInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(() => SendPasswordResetEmailInFirebaseUseCase(repository: sl()));
  // sl.registerLazySingleton(() => AddCardUseCase(repository: sl()));
  // sl.registerLazySingleton(() => ConfirmPhoneNumberUseCase(repository: sl()));

  //Repository
  sl.registerLazySingleton<FirebaseAuthenticationRepository>(
      () => FirebaseAuthenticationRepositoryImpl(datasource: sl()));

  //Data source
  sl.registerLazySingleton<FirebaseAuthenticationDatasource>(() => FirebaseAuthenticationDatasourceImpl());

  //!Feature News

  //Blocs
  //sl.registerFactory(() => NewsCubit(getNewsUseCase: sl()));

  //UseCases
  //sl.registerLazySingleton(() => GetNewsUseCase(repository: sl()));

  //Repository
  // sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(datasource: sl()));

  //Data source
  // sl.registerLazySingleton<NewsDataSource>(() => NewsDataSourceImpl(client: sl()));
}
