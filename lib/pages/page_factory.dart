import 'package:projectv/controllers/states/feed_state.dart';
import 'package:projectv/controllers/states/login_state.dart';
import 'package:projectv/controllers/states/registration_state.dart';
import 'package:projectv/controllers/states/state.dart';
import 'package:projectv/pages/feed_page.dart';
import 'package:projectv/pages/login_page.dart';
import 'package:projectv/pages/page.dart';
import 'package:projectv/pages/registration_page.dart';

class PageFactory {

  static AppPage? getPage(AppState state) {
    if (state is LoginState) {
      return const LoginPage();
    } else if (state is RegistrationState) {
      return const RegistrationPage();
    } else if (state is FeedState) {
      return const FeedPage();
    }
    return null;
  }

}