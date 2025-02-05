import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chinsuko_clicker/models/chinsuko_state.dart';

class ChinsukoCounter extends StateNotifier<ChinsukoState> {
  Timer? _timer;

  // 基本価格と倍率（ここでは例として1.5倍）を定義
  static const int baseCost = 10;
  static const double multiplier = 1.2;

  // 次に購入するカーソルの必要ちんすこう数を計算
  int get nextCursorCost => (baseCost * pow(multiplier, state.cursors)).round();

  ChinsukoCounter({ChinsukoState? initialState})
      : super(initialState ?? const ChinsukoState()) {
    // 初期化時に一度自動クリック処理を実行
    _executeAutoClick();
    // その後、10秒周期で自動クリック処理を行う
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _executeAutoClick();
    });
  }

  void _executeAutoClick() {
    final cursorCount = state.cursors;
    if (cursorCount > 0) {
      final intervalMs = (10000 / cursorCount).round();
      for (int i = 0; i < cursorCount; i++) {
        Future.delayed(Duration(milliseconds: intervalMs * i), () {
          if (mounted) {
            state = state.copyWith(count: state.count + 1);
          }
        });
      }
    }
  }

  /// 手動クリック
  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  /// カーソル購入（指数関数的に増加する価格）
  void buyCursor() {
    final price = nextCursorCost;
    if (state.count >= price) {
      state = state.copyWith(
        count: state.count - price,
        cursors: state.cursors + 1,
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

/// グローバルプロバイダー
final chinsukoProvider = StateNotifierProvider<ChinsukoCounter, ChinsukoState>(
    (ref) => ChinsukoCounter());
