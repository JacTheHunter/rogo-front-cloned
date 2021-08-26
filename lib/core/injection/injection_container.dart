import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentication/data/datasources/firebase_authentication_datasource.dart';
import '../../features/authentication/data/repositories/firebase_authentication_repository_impl.dart';
import '../../features/authentication/domain/repositories/firebase_authentication_repository.dart';
import '../../features/authentication/domain/usecases/create_user_with_email_and_password_in_firebase_usecase.dart';
import '../../features/authentication/domain/usecases/get_user_stream_from_firebase_usecase.dart';
import '../../features/authentication/domain/usecases/send_password_reset_email_in_firebase_usecase.dart';
import '../../features/authentication/domain/usecases/sign_in_anonymous_firebase_usecase.dart';
import '../../features/authentication/domain/usecases/sign_in_with_email_and_password_in_firebase_usecase.dart';
import '../../features/authentication/domain/usecases/sign_in_with_google_in_firebase_usecase.dart';
import '../../features/authentication/domain/usecases/sign_out_in_firebase_usecase.dart';
import '../../features/authentication/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import '../../features/authentication/presentation/blocs/forgot_password_cubit/forgot_password_cubit.dart';
import '../../features/authentication/presentation/blocs/login_cubit/login_cubit.dart';
import '../../features/authentication/presentation/blocs/sign_up_cubit/sign_up_cubit.dart';
import '../../features/browse/data/datasources/top_selleres_data_source.dart';
import '../../features/browse/data/repositories/top_sellers_repository_impl.dart';
import '../../features/browse/domain/repositories/top_sellers_repository.dart';
import '../../features/browse/domain/usecases/get_top_sellers.dart';
import '../../features/browse/presentation/cubit/top_sellers_cubit.dart';
import '../../features/categories/data/datasources/categories_data_source.dart';
import '../../features/categories/data/repositories/categories_repository_impl.dart';
import '../../features/categories/domain/repositories/categories_repository.dart';
import '../../features/categories/domain/usecases/get_categories_usecase.dart';
import '../../features/categories/presentation/bloc/categories_cubit/categories_cubit.dart';
import '../../features/onboarding/presentation/blocs/onboarding_page_cubit/onboarding_page_cubit.dart';
import '../presentation/blocs/app_nav_bar_cubit/app_nav_bar_cubit.dart';
import '../presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../services/api_service.dart';
import '../services/navigation_service.dart';

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
  sl.registerFactory(
      () => SignUpCubit(createUserWithEmailAndPasswordInFirebaseUseCase: sl()));
  sl.registerFactory(
      () => LoginCubit(signInWithEmailAndPasswordInFirebaseUseCase: sl()));
  sl.registerFactory(
      () => ForgotPasswordCubit(sendPasswordResetEmailInFirebaseUseCase: sl()));

  //UseCases
  sl.registerLazySingleton(
      () => GetUserStreamInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignOutInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => CreateUserWithEmailAndPasswordInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => SignInWithEmailAndPasswordInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => SignInAnonymousInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => SignInWithGoogleInFirebaseUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => SendPasswordResetEmailInFirebaseUseCase(repository: sl()));
  // sl.registerLazySingleton(() => AddCardUseCase(repository: sl()));
  // sl.registerLazySingleton(() => ConfirmPhoneNumberUseCase(repository: sl()));

  //Repository
  sl.registerLazySingleton<FirebaseAuthenticationRepository>(
      () => FirebaseAuthenticationRepositoryImpl(datasource: sl()));

  //Data source
  sl.registerLazySingleton<FirebaseAuthenticationDatasource>(
      () => FirebaseAuthenticationDatasourceImpl());

  //!Feature News

  //Blocs
  //sl.registerFactory(() => NewsCubit(getNewsUseCase: sl()));

  //UseCases
  //sl.registerLazySingleton(() => GetNewsUseCase(repository: sl()));

  //Repository
  // sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(datasource: sl()));

  //Data source
  // sl.registerLazySingleton<NewsDataSource>(() => NewsDataSourceImpl(client: sl()));

  //!Feature Browse
  //TODO: Refactor
  //Blocs
  sl.registerFactory(() => TopSellersCubit(getTopSellersUsecase: sl()));
  //UseCases
  sl.registerLazySingleton(() => GetTopSellersUsecase(repository: sl()));
  //Repository
  sl.registerLazySingleton<TopSellersRepository>(
      () => TopSellersRepositoryImpl(topSellersDataSource: sl()));
  //Data Source
  sl.registerLazySingleton<TopSellersDataSource>(
      () => TopSellersRemoteDataSourceImpl(client: sl()));

  //!Feature Categories
  //Blocs
  sl.registerFactory(() => CategoriesCubit(getCategoriesUsecase: sl()));
  //UseCases
  sl.registerLazySingleton(() => GetCategoriesUsecase(repository: sl()));
  //Repository
  sl.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(dataSource: sl()));
  //Data Source
  sl.registerLazySingleton<CategoriesDataSource>(
      () => CategoriesDataSourceImpl(client: sl()));

  //!External
  //DIO
  sl.registerLazySingleton(() => Dio());
}
