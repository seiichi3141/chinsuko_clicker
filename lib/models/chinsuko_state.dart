// lib/models/chinsuko_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chinsuko_state.freezed.dart';
part 'chinsuko_state.g.dart';

@freezed
class ChinsukoState with _$ChinsukoState {
  const factory ChinsukoState({
    @Default(0) int count,
  }) = _ChinsukoState;

  factory ChinsukoState.fromJson(Map<String, dynamic> json) =>
      _$ChinsukoStateFromJson(json);
}
