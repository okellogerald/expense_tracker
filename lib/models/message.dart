class Message {
  final String enMessage;
  final String swMessage;

  const Message({
    required this.enMessage,
    required this.swMessage,
  });

  const Message.notEmpty({
    required String enlabel,
    required String swlabel,
  })  : enMessage = "$enlabel should not be empty",
        swMessage = "$swlabel ni lazima";

  String fromLocale() {
    return enMessage;
  }

  /// Returns text according to the current locale
  String get text => fromLocale();

  @override
  String toString() => 'Message(enMessage: $enMessage, swMessage: $swMessage)';
}
