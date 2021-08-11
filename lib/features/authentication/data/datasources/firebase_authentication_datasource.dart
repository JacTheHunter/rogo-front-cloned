import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/features/authentication/data/models/firebase_user_model.dart';
import 'package:rogo/features/authentication/domain/entities/firebase_user.dart';

abstract class FirebaseAuthenticationDatasource {
  Future<FirebaseUser> createUserWithEmailAndPasswordInFirebase({required String email, required String password});
  Future<FirebaseUser> signInWithEmailAndPasswordInFirebase({required String email, required String password});
  Future<FirebaseUser> signInAnonymousInFirebase();
  Future<FirebaseUser> signInWithGoogleInFirebase();
  Future<void> signOutInFirebase();
  Stream<FirebaseUser> getUserStreamInFirebase();

  //forgot password
  Future<void> sendPasswordResetEmailInFirebase({required String email});
  Future<void> confirmPasswordResetInFirebase({required String code, required String newPassword});
  Future<String> verifyPasswordResetCodeInFirebase({required String code});
}

class FirebaseAuthenticationDatasourceImpl implements FirebaseAuthenticationDatasource {
  @override
  Future<FirebaseUser> createUserWithEmailAndPasswordInFirebase(
      {required String email, required String password}) async {
    try {
      return FirebaseUserModel.fromFirebaseUserCredential(
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password));
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<FirebaseUser> signInWithEmailAndPasswordInFirebase({required String email, required String password}) async {
    try {
      return FirebaseUserModel.fromFirebaseUserCredential(
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password));
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<void> signOutInFirebase() async {
    try {
      await FirebaseAuth.instance.signOut();
      return;
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Stream<FirebaseUser> getUserStreamInFirebase() {
    return FirebaseAuth.instance.authStateChanges().map((user) {
      user?.getIdToken().then(
        (value) {
          print('jwt token');

          print(value);
        },
      );
      return FirebaseUser(
        uid: user?.uid ?? '',
        email: user?.email,
        isAnonymous: user?.isAnonymous ?? false,
      );
    });
  }

  @override
  Future<FirebaseUser> signInAnonymousInFirebase() async {
    try {
      return FirebaseUserModel.fromFirebaseUserCredential(await FirebaseAuth.instance.signInAnonymously());
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<FirebaseUser> signInWithGoogleInFirebase() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return FirebaseUserModel.fromFirebaseUserCredential(await FirebaseAuth.instance.signInWithCredential(credential));
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<void> sendPasswordResetEmailInFirebase({required String email}) async {
    try {
      final ActionCodeSettings actionCodeSettings = ActionCodeSettings(
        url: 'https://rogo-6f46a.web.app',
        androidInstallApp: true,
        androidPackageName: 'com.rogo.android',
        iOSBundleId: 'com.rogo.android',
      );

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email, actionCodeSettings: actionCodeSettings);
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<void> confirmPasswordResetInFirebase({required String code, required String newPassword}) async {
    try {
      await FirebaseAuth.instance.confirmPasswordReset(code: code, newPassword: newPassword);
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<String> verifyPasswordResetCodeInFirebase({required String code}) async {
    try {
      return await FirebaseAuth.instance.verifyPasswordResetCode(code);
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
