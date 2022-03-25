class PasswordValidation {

  static bool validate(String? password) {
    if (password == null) {
      return false;
    } else if (password.length < 10) {
      return false;
    } else if (!containsNumber(password)) {
      return false;
    } else if (!containsSpecialCharacter(password)) {
      return false;
    } return true;
  }

  static bool containsNumber(String password) {
    var reg = RegExp(r'[0-9]');
    for (int i = 0; i < password.length; i++) {
      if (password[i].contains(reg)) {
        return true;
      }
    }
    return false;
  }

  static bool containsSpecialCharacter(String password) {
    List<String> specialCharacters = ['!', ' ', '"', '#', '\$', '%', '&', '(', ')', '*', '+',
      ',', '-', '.', '/', ':', ';', '<', '=', '>', '?', '@', '[', ']', '_', '`', '^', '{', '}',
      '|', '~'];
    for (int i = 0; i < password.length; i++) {
      if (specialCharacters.contains(password[i])) {
        return true;
      }
    } return false;
  }

}