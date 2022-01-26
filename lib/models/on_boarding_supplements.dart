import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'on_boarding_supplements.freezed.dart';

@freezed
class OnBoardingSupplements with _$OnBoardingSupplements {
  const factory OnBoardingSupplements({
    required String password,
    required Map<String, String> errors,
    required Map<int, String> otp,
    required User user,
    required int currency,
  }) = _OnBoardingSupplements;

  factory OnBoardingSupplements.empty() => OnBoardingSupplements(
      password: '', user: User.empty(), errors: {}, otp: {}, currency: 0);
}
