String? validateText(String? value, String errorId) {
  if (value == null || value.trim().isEmpty) {
    return '$errorId can\'t be empty';
  } else {
    return null;
  }
}

String? validateNumber(String value, String errorId) {
  if (value.isEmpty) {
    return '$errorId cannot be empty.';
  } else if (double.tryParse(value) == null) {
    return 'Invalid value for $errorId!';
  } else if (double.tryParse(value) == 0) {
    return '$errorId can\'t be zero.';
  } else {
    return null;
  }
}

String? validateEmail(String email) {
  if (email.trim().isEmpty) return 'Email can\'t be empty';
  final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+");
  final isValidEmail = regex.hasMatch(email);
  if (!isValidEmail) return 'Invalid Email';
  return null;
}

String? validatePassword(String password) {
  if (password.trim().isEmpty) return 'Password can\'t be empty';
  if (password.length < 8) {
    return 'Password should contain at least 8 characters';
  }
  return null;
}

bool checkErrors(Map<String, String?> errors) {
  final errorsList = errors.values.toList();
  errorsList.removeWhere((e) => e == null);
  return errorsList.isNotEmpty;
}
