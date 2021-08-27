import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/get_current_user_usecase.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final GetCurrentUserUseCase _getCurrentUser;
  AuthenticationCubit({required GetCurrentUserUseCase getCurrentUser})
      : _getCurrentUser = getCurrentUser,
        super(AuthenticationState.unregistered());

  void getCurrentUser() async {
    emit(AuthenticationState.loading());
    final result = await _getCurrentUser.call(NoParams());
    result.fold((l) {
      emit(AuthenticationState.unregistered());
    }, (r) {
      if (r.phone.isNotEmpty) {
        emit(AuthenticationState.registered(r));
      } else {
        emit(AuthenticationState.unregistered());
      }
    });
  }

  void updateUser(User user) {
    emit(AuthenticationState.registered(user));
  }

  // @override
  // AuthenticationState? fromJson(Map<String, dynamic> json) {
  //   if (json.isEmpty) {
  //     return AuthenticationState.unregistered();
  //   } else {
  //     return AuthenticationState.registered(UserModel.fromJson(json));
  //   }
  // }

  // @override
  // Map<String, dynamic>? toJson(AuthenticationState state) {
  //   if (state.currentUser == null || (state.currentUser?.phone ?? '').isEmpty) {
  //     return {};
  //   } else {
  //     return UserModel(id: state.currentUser?.id ?? 0, phone: state.currentUser?.phone ?? '').toJson();
  //   }
  // }
}
