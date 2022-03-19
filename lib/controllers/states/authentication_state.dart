import 'package:projectv/controllers/states/state.dart';

class AuthenticationState extends AppState {

  final bool isSignIn;
  final int page;
  final String? email, username, password;

  AuthenticationState({required this.page, required this.email, required this.username, required this.password, required this.isSignIn});

  @override
  List<Object?> get props => [isSignIn, email, username, password, page];
}