// lib/models/save_data.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chinsuko_clicker/models/chinsuko_state.dart';

part 'save_data.freezed.dart';
part 'save_data.g.dart';

@freezed
class SaveData with _$SaveData {
  const factory SaveData({
    required String id,
    required String name,
    required ChinsukoState state,
    required DateTime updatedAt,
  }) = _SaveData;

  factory SaveData.fromJson(Map<String, dynamic> json) =>
      _$SaveDataFromJson(json);
}
