import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chinsuko_clicker/models/save_data.dart';
import 'package:chinsuko_clicker/models/chinsuko_state.dart';
import 'package:chinsuko_clicker/providers/save_data_notifier.dart';
import 'package:chinsuko_clicker/screens/game_page.dart';
import 'package:uuid/uuid.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateNotifierProvider を watch して最新のセーブ一覧を取得
    final saves = ref.watch(saveDataNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('セーブデータ選択'),
      ),
      body: saves.isEmpty
          ? const Center(child: Text('セーブデータがありません'))
          : ListView.builder(
              itemCount: saves.length,
              itemBuilder: (context, index) {
                final save = saves[index];
                return ListTile(
                  title: Text(save.name),
                  subtitle: Text('ちんすこう: ${save.state.count}'),
                  onTap: () async {
                    // 選択したセーブでゲーム開始
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(saveData: save),
                      ),
                    );
                    // ゲーム画面から戻った際、念のため最新状態に更新（任意）
                    ref.read(saveDataNotifierProvider.notifier).loadSaves();
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 新規セーブの作成（初期状態は count = 0）
          final newSave = SaveData(
            id: const Uuid().v4(),
            name: 'セーブ ${DateTime.now().toLocal()}',
            state: const ChinsukoState(),
            updatedAt: DateTime.now(),
          );
          // SaveDataNotifier 経由でセーブデータを追加
          await ref
              .read(saveDataNotifierProvider.notifier)
              .addOrUpdateSave(newSave);
          // 新規セーブでゲーム開始
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GamePage(saveData: newSave),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
