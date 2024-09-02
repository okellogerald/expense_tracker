import 'package:flutter/material.dart';

import '../models/message.dart';

String? validateName(String? text, {String? label, bool optional = false}) {
  if (text == null || text.trim().isEmpty) {
    return optional ? null : '${label ?? "This field"} can\'t be empty';
  }
  return null;
}

Message? validateEmail(String? email, {bool optional = false}) {
  if (email == null || email.trim().isEmpty) {
    return optional
        ? null
        : const Message(
            enMessage: 'Email can\'t be empty',
            swMessage: 'Lazima uweke barua pepe',
          );
  }

  final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+");
  final isValidEmail = regex.hasMatch(email);
  if (!isValidEmail) {
    return const Message(
      enMessage: 'Invalid Email',
      swMessage: 'Barua pepe sio sahihi',
    );
  }
  return null;
}

Message? validatePassword(String? password) {
  if (password == null || password.trim().isEmpty) {
    return const Message(
      enMessage: 'Password can\'t be empty',
      swMessage: 'Msimbo ni lazima',
    );
  }
  if (password.length < 6) {
    return const Message(
      enMessage: 'Password should contain at least 6 characters',
      swMessage: 'Msimbo lazima uwe na zaidi ya herufi 6',
    );
  }
  return null;
}

// Returns true if two dates are equal
bool compareDates(DateTime? date1, DateTime? date2) {
  if (date1 == null || date2 == null) return false;
  final i = date1.toLocal().millisecondsSinceEpoch;
  final j = date2.toLocal().millisecondsSinceEpoch;
  return i == j;
}

bool checkIfOnSameDay(DateTime? date1, DateTime? date2) {
  if (date1 == null || date2 == null) return false;
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

String? validateAmount(String? value, [bool optional = false]) {
  var text = value?.trim().toLowerCase() ?? "";
  text = text.replaceAll(",", "");
  text = text.replaceAll("tzs", "");
  text = text.replaceAll("tsh", "");
  text = text.trim();

  if (text.isEmpty && !optional) {
    const msg = Message(
      enMessage: "Amount is required",
      swMessage: "Kiasi ni lazima",
    );
    return msg.text;
  }

  if (text.isEmpty && optional) return null;

  if (double.tryParse(text) == null) {
    const msg = Message(
      enMessage: "Invalid amount",
      swMessage: "Kiasi si sahihi",
    );
    return msg.text;
  }

  return null;
}

double? getAmountFrom(TextEditingController controller) {
  final value = controller.text;
  var text = value.trim().toLowerCase();
  text = text.replaceAll(",", "");
  text = text.replaceAll("tzs", "");
  text = text.replaceAll("tsh", "");
  text = text.trim();

  if (text.isEmpty) return null;

  final amount = double.tryParse(text);
  if (amount == null) return null;
  return amount;
}
