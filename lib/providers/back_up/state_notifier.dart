import 'package:flutter_riverpod/flutter_riverpod.dart';

enum BackUpState { none, loading, success, failed }

class BackUpStateNotifier extends StateNotifier<BackUpState> {
  BackUpStateNotifier() : super(BackUpState.none);
}
