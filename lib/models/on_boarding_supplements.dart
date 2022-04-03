import 'package:freezed_annotation/freezed_annotation.dart';

import '../source.dart';

part 'on_boarding_supplements.freezed.dart';

@freezed
class OnBoardingSupplements with _$OnBoardingSupplements {
  const factory OnBoardingSupplements({
    required String password,
    required Map<String, String> errors,
    required User user,
    required int currency,
  }) = _OnBoardingSupplements;

  factory OnBoardingSupplements.empty() => const OnBoardingSupplements(
      password: '', user: User(), errors: {}, currency: 0);
}
