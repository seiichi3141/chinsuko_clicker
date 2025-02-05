import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chinsuko_clicker/models/save_data.dart';
import 'package:chinsuko_clicker/models/chinsuko_state.dart';
import 'package:chinsuko_clicker/providers/chinsuko_provider.dart';
import 'package:chinsuko_clicker/providers/save_data_notifier.dart';
import 'package:chinsuko_clicker/widgets/animated_chinsuko_image.dart';

class GamePage extends ConsumerStatefulWidget {
  final SaveData saveData;
  const GamePage({super.key, required this.saveData});

  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  // ローカルなちんすこう状態管理用のプロバイダー
  late final StateNotifierProvider<ChinsukoCounter, ChinsukoState>
      _gameProvider;

  @override
  void initState() {
    super.initState();
    _gameProvider = StateNotifierProvider<ChinsukoCounter, ChinsukoState>(
      (_) => ChinsukoCounter(initialState: widget.saveData.state),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chinsukoState = ref.watch(_gameProvider);
    return Scaffold(
      appBar: AppBar(
        // 上部に「（焼いたちんすこうの数）ちんすこう」を表示
        title: Text('${chinsukoState.count} ちんすこう'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              // 現在の状態でセーブデータを更新
              final updatedSave = widget.saveData.copyWith(
                state: chinsukoState,
                updatedAt: DateTime.now(),
              );
              await ref
                  .read(saveDataNotifierProvider.notifier)
                  .addOrUpdateSave(updatedSave);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('保存しました')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: AnimatedChinsukoImage(
          onTap: () {
            ref.read(_gameProvider.notifier).increment();
          },
        ),
      ),
    );
  }
}
