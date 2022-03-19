import 'package:bloc/bloc.dart';
import 'package:projectv/controllers/states/authentication_state.dart';
import 'package:projectv/controllers/states/state.dart';
import 'package:projectv/services/authentication/authentication.dart';
import 'package:projectv/services/storage/storage.dart';

import '../../services/database/database.dart';

class Controller extends Cubit<AppState> {

  final Authentication authentication;
  final Database database;
  final Storage storage;

  Controller({required this.authentication, required this.database, required this.storage}) :
        super(AuthenticationState(isSignIn: true, page: 1, email: null, username: null, password: null));

  void updateAuthentication(String? email, String? username, String? password, int? page) {
    if (authentication.getUser() == null) {
      emit(AuthenticationState(isSignIn: true, page: page ?? 1, email: email,
    username: username, password: password));
    }
  }

}