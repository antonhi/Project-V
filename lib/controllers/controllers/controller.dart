import 'package:bloc/bloc.dart';
import 'package:projectv/controllers/states/feed_state.dart';
import 'package:projectv/controllers/states/login_state.dart';
import 'package:projectv/controllers/states/registration_state.dart';
import 'package:projectv/controllers/states/state.dart';
import 'package:projectv/services/authentication/authentication.dart';
import 'package:projectv/services/cache/cache.dart';
import 'package:projectv/services/storage/storage.dart';

import '../../services/database/database.dart';

class Controller extends Cubit<AppState> {

  final Authentication authentication;
  final Database database;
  final Storage storage;
  final Cache cache;
  //Map<AppPage, AppState>? directory = {};

  Controller({required this.authentication, required this.database, required this.storage, required this.cache}) :
        super(LoginState()) {
    database.setController(this);
    authentication.setController(this);
  }

  void showLoginState() {
    emit(LoginState());
  }

  void showRegistrationState() {
    emit(RegistrationState());
  }

  void showFeedState() {
    emit(FeedState());
  }

}