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
        super(AuthenticationState());

  void toggleAuthentication() {
    if (authentication.getUser() == null) {
      emit(AuthenticationState());
    }
  }

}