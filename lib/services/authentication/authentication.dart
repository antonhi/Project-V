import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectv/controllers/controllers/controller.dart';
import 'package:projectv/services/authentication/password.dart';
import 'package:projectv/utility/errors.dart';

class Authentication {

  late final FirebaseAuth auth;
  User? user;
  Controller? controller;

  Authentication() {
    auth = FirebaseAuth.instance;
    initiateUserChangesListener();
  }

  void initiateUserChangesListener() {
    auth.userChanges().listen((user) {
      if (controller != null) {
        this.user = user;
        user == null ? controller!.showLoginState() : controller!.showRegistrationState();
      }
    });
  }

  User? getUser() { return user; }

  Future<String?> signIn(String? email, String? password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email ?? '', password: password ?? '');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case "user-not-found":
          return AppErrors.loginFailureEmail;
        case "wrong-password":
          return AppErrors.loginFailurePassword;
      }
    } catch (e) {
      return AppErrors.loginFailure;
    }
    return null;
  }

  Future<String?> signUp(String? email, String? password, String? username) async {
    if (!PasswordValidation.validate(password)) {
      return AppErrors.registrationFailurePassword;
    }
    try {
      await auth.createUserWithEmailAndPassword(email: email ?? '', password: password ?? '');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case 'missing-email':
        case 'email-already-in-use':
        case 'invalid-email':
          return AppErrors.registrationFailureEmail;
        case 'weak-password':
          return AppErrors.registrationFailurePassword;
        case 'network-request-failed':
          return AppErrors.registrationFailureNetwork;
      }
    } catch (e) {
      return AppErrors.registrationFailure;
    }
    return null;
  }

  void signOut() {
    auth.signOut();
  }

}