import 'package:projectv/controllers/states/feed_state.dart';
import 'package:projectv/controllers/states/inbox_state.dart';
import 'package:projectv/controllers/states/login_state.dart';
import 'package:projectv/controllers/states/profile_state.dart';
import 'package:projectv/controllers/states/registration_state.dart';
import 'package:projectv/controllers/states/state.dart';
import 'package:projectv/pages/feed_page.dart';
import 'package:projectv/pages/inbox_page.dart';
import 'package:projectv/pages/login_page.dart';
import 'package:projectv/pages/page.dart';
import 'package:projectv/pages/profile_page.dart';
import 'package:projectv/pages/registration_page.dart';

class PageFactory {

  static AppPage? getPage(AppState state) {
    if (state is LoginState) {
      return const LoginPage();
    } else if (state is RegistrationState) {
      return const RegistrationPage();
    } else if (state is FeedState) {
      return const FeedPage();
    } else if (state is ProfileState) {
      return const ProfilePage();
    } else if (state is InboxState) {
      return const InboxPage();
    }
    return null;
  }

}