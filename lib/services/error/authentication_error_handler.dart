import 'package:projectv/services/error/error_handler.dart';

class AuthenticationErrorHandler extends ErrorHandler {

  @override
  String getMessage(int errorCode) {
    switch (errorCode) {
      case 0:
        return 'Email could not be found';
      case 1:
        return 'Password is incorrect';
      case 2:
        return 'Login services are currently offline';
      case 3:
        return 'Email is already taken or invalid';
      case 4:
        return 'Username is invalid or already taken';
      case 5:
        return 'Registration services are currently offline';
      case 6:
        return 'Password must be greater than 5 characters';
      case 7:
        return 'Could not establish network connection';
      default:
        return '';
    }
  }

}