class IconCodePointGenerator {
  static List codePointList = [];

  ///generates the code points for the icons in the generated font from either
  ///fluttericon or codemoon websites. They have the code pattern for these
  ///code points, that's what made this possible
  static void generate(int numberOfIcons, {int startingCodePoint = 800}) {
    final letters = <String>['a', 'b', 'c', 'd', 'e', 'f'];

    int startingCode = 80;
    String roundType = 'first_round';
    int withLetters = 0, withNumbers = 0;

    for (int i = 1; i < numberOfIcons; i++) {
      if (roundType == 'first_round') {
        final divisor = withNumbers / 10;
        final limitIsReached =
            divisor.toString().endsWith('0') && divisor != 0.0;

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
      codePointList.add(startingCodePoint + j);
    }
    for (int k = 1; k <= withLetters; k++) {
      final letterIndex = k - ((startingCode - 80) * 6) - 1;
      final toBeAdded = startingCode.toString() + letters[letterIndex];
      codePointList.add(toBeAdded);
      final limitIsReached = (k / 6).toString().endsWith('0');
      if (limitIsReached) {
        startingCode += 1;
      }
    }
  }
}
