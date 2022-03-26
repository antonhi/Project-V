import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectv/controllers/controllers/controller.dart';
import 'package:projectv/models/user.dart';
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

  void setController(Controller controller) {
    this.controller = controller;
  }

  void initiateUserChangesListener() {
    auth.userChanges().listen((user) async {
      if (controller != null) {
        this.user = user;
        if (user == null) {
          controller!.showLoginState();
        } else {
          controller!.showFeedState();
          AppUser? appUser = await AppUser.getAppUserFromUser(controller!.database, user);
          controller!.cache.setUser(appUser);
        }
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
        case 'user-not-found':
          return AppErrors.loginFailureEmail;
        case 'wrong-password':
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
    if (username == null) return AppErrors.registrationFailureUsername;
    bool exists = await AppUser.userExists(controller!.database, username);
    if (exists) return AppErrors.registrationFailureUsername;

    try {
      auth.createUserWithEmailAndPassword(email: email ?? '', password: password ?? '').then((userCredential) async {
        User? createdUser = userCredential.user;
        if (createdUser != null) {
          await createdUser.updateDisplayName(username);
          String? url = await controller!.storage.getURL();
          print(url);
          AppUser appUser = AppUser(username: username);
          await appUser.addUser(controller!.database, createdUser.uid);
          controller!.cache.setUser(appUser);
        } else {
          return AppErrors.registrationFailure;
        }
      });
    } on FirebaseAuthException catch (e) {
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