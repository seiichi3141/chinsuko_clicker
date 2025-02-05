import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chinsuko_clicker/models/save_data.dart';
import 'package:chinsuko_clicker/repositories/save_data_repository.dart';

class SaveDataNotifier extends StateNotifier<List<SaveData>> {
  final SaveDataRepository _repository;
  SaveDataNotifier({required SaveDataRepository repository})
      : _repository = repository,
        super([]) {
    loadSaves();
  }

  /// SharedPreferences からセーブデータ一覧を読み込み、状態を更新する
  Future<void> loadSaves() async {
    final saves = await _repository.loadSaves();
    state = saves;
  }

  /// セーブデータを追加または更新し、一覧をリロードする
  Future<void> addOrUpdateSave(SaveData saveData) async {
    await _repository.saveSaveData(saveData);
    await loadSaves();
  }

  /// 指定したIDのセーブデータを削除し、一覧をリロードする
  Future<void> deleteSave(String id) async {
    await _repository.deleteSaveData(id);
    await loadSaves();
  }
}

/// グローバルに利用する StateNotifierProvider
final saveDataNotifierProvider =
    StateNotifierProvider<SaveDataNotifier, List<SaveData>>((ref) {
  return SaveDataNotifier(repository: SaveDataRepository());
});
