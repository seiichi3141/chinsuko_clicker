import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chinsuko_clicker/models/save_data.dart';
import 'package:chinsuko_clicker/providers/chinsuko_provider.dart';
import 'package:chinsuko_clicker/providers/save_data_notifier.dart';
import 'package:chinsuko_clicker/widgets/animated_chinsuko_image.dart';
import 'package:chinsuko_clicker/widgets/cursors_widget.dart';

class GamePage extends StatelessWidget {
  final SaveData saveData;
  const GamePage({super.key, required this.saveData});

  @override
  Widget build(BuildContext context) {
    // グローバルな chinsukoProvider をオーバーライドして、
    // saveData.state で初期化する
    return ProviderScope(
      overrides: [
        chinsukoProvider.overrideWith(
          (ref) => ChinsukoCounter(initialState: saveData.state),
        ),
      ],
      child: GamePageContent(saveData: saveData),
    );
  }
}

class GamePageContent extends ConsumerStatefulWidget {
  final SaveData saveData;
  const GamePageContent({super.key, required this.saveData});

  @override
  GamePageContentState createState() => GamePageContentState();
}

class GamePageContentState extends ConsumerState<GamePageContent> {
  // ローカルな状態管理用プロバイダー（初期状態は saveData.state）

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chinsukoState = ref.watch(chinsukoProvider);
    return Scaffold(
      appBar: AppBar(
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
      body: Row(
        children: [
          // 左側：クリックエリア（中央にちんすこう画像、その周囲にカーソルのアニメーション）
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  // メインのちんすこう画像（タップで手動クリック）
                  AnimatedChinsukoImage(
                    onTap: () {
                      ref.read(chinsukoProvider.notifier).increment();
                    },
                  ),
                  // 中央のちんすこう画像の周囲にカーソルを配置するウィジェット
                  CursorsWidget(cursorCount: chinsukoState.cursors),
                ],
              ),
            ),
          ),
          // 右側：ショップUI（例としてカーソル購入用）
          Container(
            width: 250,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(8),
            child: Consumer(
              builder: (context, ref, child) {
                final chinsukoState = ref.watch(chinsukoProvider);
                final nextCost =
                    ref.read(chinsukoProvider.notifier).nextCursorCost;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ショップ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      title: const Text('カーソル'),
                      subtitle: Text('必要ちんすこう: $nextCost'),
                      trailing: Text('${chinsukoState.cursors}'),
                      onTap: () {
                        ref.read(chinsukoProvider.notifier).buyCursor();
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
