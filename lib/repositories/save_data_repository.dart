// lib/repositories/save_data_repository.dart

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chinsuko_clicker/models/save_data.dart';

class SaveDataRepository {
  static const _key = 'save_data_list';

  Future<List<SaveData>> loadSaves() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_key);
    if (jsonList == null) return [];
    return jsonList
        .map((jsonStr) => SaveData.fromJson(json.decode(jsonStr)))
        .toList();
  }

  Future<void> saveSaveData(SaveData saveData) async {
    final prefs = await SharedPreferences.getInstance();
    final saves = await loadSaves();
    // 既存の同IDのセーブがあれば削除
    final newSaves = saves.where((s) => s.id != saveData.id).toList();
    newSaves.add(saveData);
    final jsonList = newSaves.map((s) => json.encode(s.toJson())).toList();
    await prefs.setStringList(_key, jsonList);
  }

  Future<void> deleteSaveData(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final saves = await loadSaves();
    final newSaves = saves.where((s) => s.id != id).toList();
    final jsonList = newSaves.map((s) => json.encode(s.toJson())).toList();
    await prefs.setStringList(_key, jsonList);
  }
}
