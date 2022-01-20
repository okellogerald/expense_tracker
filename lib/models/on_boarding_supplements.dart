import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'on_boarding_supplements.freezed.dart';

@freezed
class OnBoardingSupplements with _$OnBoardingSupplements {
  const factory OnBoardingSupplements({
    required String phone,
    required Client client,
  }) = _OnBoardingSupplements;

  factory OnBoardingSupplements.empty() =>
      OnBoardingSupplements(phone: '', client: Client.empty());
}
