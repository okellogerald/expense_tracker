import 'package:freezed_annotation/freezed_annotation.dart';

import '../source.dart';

part 'freezed_models/on_boarding_supplements.freezed.dart';

@freezed
class OnBoardingSupplements with _$OnBoardingSupplements {
  const OnBoardingSupplements._();

  const factory OnBoardingSupplements(
      {@Default('') String password,
      @Default({}) Map<String, String?> errors,
      @Default(0) int currencyCodePoint,
      required User user}) = _OnBoardingSupplements;

  factory OnBoardingSupplements.empty() =>
      const OnBoardingSupplements(user: User());
}
