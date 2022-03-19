import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectv/controllers/controllers/controller.dart';

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
        controller!.updateAuthentication(null, null, null, 1);
      }
    });
  }

  User? getUser() { return user; }

  void signOut() {
    auth.signOut();
  }

}