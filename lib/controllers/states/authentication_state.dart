import 'package:projectv/controllers/states/state.dart';

class AuthenticationState extends AppState {

  final bool isSignIn;

  AuthenticationState({required this.isSignIn});

  @override
  List<Object?> get props => [isSignIn];
}