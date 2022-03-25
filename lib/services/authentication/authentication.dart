import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectv/controllers/controllers/controller.dart';
import 'package:projectv/services/error/authentication_error_handler.dart';
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
          return AuthenticationErrorHandler().getMessage(AppErrors.loginFailureEmail);
        case "wrong-password":
          return AuthenticationErrorHandler().getMessage(AppErrors.loginFailurePassword);
      }
    } catch (e) {
      return AuthenticationErrorHandler().getMessage(AppErrors.loginFailure);
    }
    return null;
  }

  Future<String?> signUp(String? email, String? password, String? username) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email ?? '', password: password ?? '');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case 'missing-email':
        case 'email-already-in-use':
        case 'invalid-email':
          return AuthenticationErrorHandler().getMessage(AppErrors.registrationFailureEmail);
        case 'weak-password':
          return AuthenticationErrorHandler().getMessage(AppErrors.registrationFailurePassword);
        case 'network-request-failed':
          return AuthenticationErrorHandler().getMessage(AppErrors.registrationFailureNetwork);
      }
    } catch (e) {
      return AuthenticationErrorHandler().getMessage(AppErrors.registrationFailure);
    }
    return null;
  }

  void signOut() {
    auth.signOut();
  }

}