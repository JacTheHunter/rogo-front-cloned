// import 'package:equatable/equatable.dart';
// import 'package:hive/hive.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:tegen/core/error/failures.dart';
// import 'package:tegen/core/injection/injection_container.dart';
// import 'package:tegen/core/services/navigation_service.dart';
// import 'package:tegen/features/authentication/data/models/bearer_token_model.dart';
// import 'package:tegen/features/authentication/domain/entities/bearer_token.dart';
// import 'package:tegen/features/authentication/domain/usecases/refresh_bearer_token_usecase.dart';

// part 'authentication_state.dart';

// class AuthenticationCubit extends HydratedCubit<AuthenticationState> {
//   final RefreshBearerTokenUseCase _refreshBearerTokenUseCase;
//   AuthenticationCubit({required RefreshBearerTokenUseCase refreshBearerTokenUseCase})
//       : _refreshBearerTokenUseCase = refreshBearerTokenUseCase,
//         super(AuthenticationState.unauthenticated());

//   final box = Hive.box('appSettings');

//   void refreshBearerToken() async {
//     if (state.bearerToken != null) {
//       final result = await _refreshBearerTokenUseCase.call(Params(refreshToken: state.bearerToken!.refreshToken));
//       result.fold((l) {
//         print((l as ServerFailure).message);
//       }, (r) {
//         updateBearerToken(r);
//       });
//     }
//   }

//   void updateBearerToken(BearerToken bearerToken) {
//     box.put('bearerToken', bearerToken.token);
//     emit(AuthenticationState.authenticated(bearerToken));
//   }

//   void logout() {
//     box.delete('bearerToken');
//     emit(AuthenticationState.unauthenticated());
//     sl<NavigatorService>().popUNtilFirst();
//   }

//   void checkTokenExpiration() {
//     if (state.bearerToken != null) {
//       if (state.bearerToken!.expirationDate.isAfter(DateTime.now().add(Duration(days: 1)))) {
//         refreshBearerToken();
//       }
//     }
//   }

//   @override
//   AuthenticationState? fromJson(Map<String, dynamic> json) {
//     if (json.isEmpty) {
//       return AuthenticationState.unauthenticated();
//     } else {
//       return AuthenticationState.authenticated(BearerTokenModel.fromJson(json));
//     }
//   }

//   @override
//   Map<String, dynamic>? toJson(AuthenticationState state) {
//     if (state.bearerToken == null) {
//       return {};
//     } else {
//       return BearerTokenModel(
//         token: state.bearerToken!.token,
//         refreshToken: state.bearerToken!.refreshToken,
//         expirationDate: state.bearerToken!.expirationDate,
//       ).toJson();
//     }
//   }
// }
