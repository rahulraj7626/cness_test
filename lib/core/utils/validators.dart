class ValidationHelpers {
  ///Validation class for form validation
  ///
  ///For Password validation update logic if needs
  static bool isPasswordFn(String password) {
    final regExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    return regExp.hasMatch(password);
  }

  ///For email validation
  static bool isEmailFn(String email) {
    final regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    return regExp.hasMatch(email);
  }
}
