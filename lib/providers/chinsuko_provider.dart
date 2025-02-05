// lib/providers/chinsuko_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chinsuko_clicker/models/chinsuko_state.dart';

class ChinsukoCounter extends StateNotifier<ChinsukoState> {
  ChinsukoCounter({ChinsukoState? initialState})
      : super(initialState ?? const ChinsukoState());

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }
}

/// グローバルに利用するプロバイダー
final chinsukoProvider = StateNotifierProvider<ChinsukoCounter, ChinsukoState>(
    (ref) => ChinsukoCounter());
