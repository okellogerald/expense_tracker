class IconCodePointGenerator {
  static List categoryIconsCodePointList = [];

  //generates category icons codepoints
  static void generate() => _generate(54);

  ///generates the code points for the icons in the generated font from either
  ///flutter-icon or code-moon websites. They have the code pattern for these
  ///code points, that's what made this possible
  static void _generate(int numberOfIcons) {
    final letters = <String>['a', 'b', 'c', 'd', 'e', 'f'];

    int startingCodePoint = 800;
    int startingCode = 80;
    String roundType = 'first_round';
    int withLetters = 0, withNumbers = 0;

    for (int i = 1; i < numberOfIcons; i++) {
      if (roundType == 'first_round') {
        final divisor = withNumbers / 10;
        final limitIsReached = divisor.toString().endsWith('.9');

        if (limitIsReached) {
          roundType = 'second_round';
          withLetters += 1;
          continue;
        } else {
          withNumbers += 1;
          continue;
        }
      }
      if (roundType == 'second_round') {
        final divisor = withLetters / 6;
        final limitIsReached =
            divisor.toString().endsWith('0') && divisor != 0.0;

        if (limitIsReached) {
          roundType = 'first_round';
          withNumbers += 1;
          continue;
        } else {
          withLetters += 1;
          continue;
        }
      }
    }

    for (int j = 0; j <= withNumbers; j++) {
      categoryIconsCodePointList.add(startingCodePoint + j);
    }
    for (int k = 1; k <= withLetters; k++) {
      final letterIndex = k - ((startingCode - 80) * 6) - 1;
      final toBeAdded = startingCode.toString() + letters[letterIndex];
      categoryIconsCodePointList.add(toBeAdded);
      final limitIsReached = (k / 6).toString().endsWith('0');
      if (limitIsReached) {
        startingCode += 1;
      }
    }
  }
}
