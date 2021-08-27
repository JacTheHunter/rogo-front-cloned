import '../../../../core/usecase/usecase.dart';
import '../entities/firebase_user.dart';
import '../repositories/firebase_authentication_repository.dart';

class GetUserStreamInFirebaseUseCase extends UseCaseStream<FirebaseUser, NoParams> {
  final FirebaseAuthenticationRepository _repository;

  GetUserStreamInFirebaseUseCase({required FirebaseAuthenticationRepository repository}) : _repository = repository;
  @override
  Stream<FirebaseUser> call(NoParams params) {
    return _repository.getUserStreamInFirebase();
  }
}
