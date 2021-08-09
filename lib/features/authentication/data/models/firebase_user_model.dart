import 'package:firebase_auth/firebase_auth.dart';
import 'package:rogo/features/authentication/domain/entities/firebase_user.dart';

class FirebaseUserModel extends FirebaseUser {
  final String uid;
  final String? email;
  final bool isAnonymous;
  const FirebaseUserModel({
    required this.uid,
    required this.isAnonymous,
    this.email,
  }) : super(uid: uid, email: email, isAnonymous: isAnonymous);

  factory FirebaseUserModel.fromFirebaseUserCredential(UserCredential userCredential) {
    return FirebaseUserModel(
      uid: userCredential.user?.uid ?? '',
      email: userCredential.user?.email,
      isAnonymous: userCredential.user?.isAnonymous ?? false,
    );
  }

  factory FirebaseUserModel.fromFirebaseUser(User user) {
    return FirebaseUserModel(uid: user.uid, email: user.email, isAnonymous: user.isAnonymous);
  }

  FirebaseUserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        email = json['email'],
        isAnonymous = json['isAnonymous'],
        super(
          uid: json['uid'],
          email: json['email'],
          isAnonymous: json['isAnonymous'],
        );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'isAnonymous': isAnonymous,
      };
}
