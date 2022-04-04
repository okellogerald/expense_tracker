import 'package:freezed_annotation/freezed_annotation.dart';

import '../source.dart';

part 'on_boarding_page_state.freezed.dart';

@freezed
class OnBoardingPageState with _$OnBoardingPageState {
  const factory OnBoardingPageState.loading(OnBoardingSupplements supplements) =
      _Loading;
  const factory OnBoardingPageState.content(OnBoardingSupplements supplements) =
      _Content;
  const factory OnBoardingPageState.success(OnBoardingSupplements supplements) =
      _Success;
  const factory OnBoardingPageState.failed(OnBoardingSupplements supplements,
      {String? message}) = _Failed;

  factory OnBoardingPageState.initial() =>
      OnBoardingPageState.content(OnBoardingSupplements.empty());
}
