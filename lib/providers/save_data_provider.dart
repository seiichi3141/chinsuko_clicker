// lib/providers/save_data_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chinsuko_clicker/models/save_data.dart';
import 'package:chinsuko_clicker/repositories/save_data_repository.dart';

final saveDataListProvider = FutureProvider<List<SaveData>>((ref) async {
  final repo = SaveDataRepository();
  return await repo.loadSaves();
});
