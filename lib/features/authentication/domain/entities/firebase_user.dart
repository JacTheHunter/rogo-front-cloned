import 'package:equatable/equatable.dart';

class FirebaseUser extends Equatable {
  final String uid;
  final String? email;
  final bool isAnonymous;

  const FirebaseUser({
    required this.uid,
    required this.isAnonymous,
    this.email,
  });

  @override
  List<Object?> get props => [uid, email, isAnonymous];
}
