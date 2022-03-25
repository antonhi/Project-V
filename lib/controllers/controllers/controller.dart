import 'package:bloc/bloc.dart';
import 'package:projectv/controllers/states/login_state.dart';
import 'package:projectv/controllers/states/registration_state.dart';
import 'package:projectv/controllers/states/state.dart';
import 'package:projectv/services/authentication/authentication.dart';
import 'package:projectv/services/storage/storage.dart';

import '../../services/database/database.dart';

class Controller extends Cubit<AppState> {

  final Authentication authentication;
  final Database database;
  final Storage storage;
  //Map<AppPage, AppState>? directory = {};

  Controller({required this.authentication, required this.database, required this.storage}) :
        super(LoginState());

  void showLoginState() {
    emit(LoginState());
  }

  void showRegistrationState() {
    emit(RegistrationState());
  }

}