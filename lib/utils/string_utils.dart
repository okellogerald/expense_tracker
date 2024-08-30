String getInitials(String fullName) {
  if (fullName.trim().isEmpty) return "";

  var initials = "";

  var names = fullName.trim().split(' ');
  final firstName = names[0];
  if (names.length > 1) {
    initials = firstName[0] + names[1][0];
  } else {
    initials = firstName[0];
  }

  return initials.toUpperCase();
}

String capitalizeFirstLetter(String name) {
  if (name.trim().isEmpty) return "";
  if (name.length == 1) return name.toUpperCase();
  return name[0].toUpperCase() + name.substring(1).toLowerCase();
}

String capitalizeNameInitials(String name) {
  if (name.trim().isEmpty) return "";

  var text = "";

  final names = name.trim().split(' ');
  for (var e in names) {
    text += "${capitalizeFirstLetter(e)} ";
  }

  return text;
}
