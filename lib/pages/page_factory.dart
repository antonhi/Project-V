import 'package:projectv/controllers/states/authentication_state.dart';
import 'package:projectv/controllers/states/state.dart';
import 'package:projectv/pages/authentication_page.dart';
import 'package:projectv/pages/page.dart';

class PageFactory {

  static AppPage? getPage(AppState state) {
    if (state is AuthenticationState)  return AuthenticationPage(isSignIn: state.isSignIn,);
    return null;
  }

}