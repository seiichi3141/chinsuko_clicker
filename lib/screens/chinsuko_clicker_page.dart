import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chinsuko_clicker/providers/chinsuko_provider.dart';
import 'package:chinsuko_clicker/widgets/animated_chinsuko_image.dart';

class ChinsukoClickerPage extends ConsumerWidget {
  const ChinsukoClickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chinsukoState = ref.watch(chinsukoProvider);
    final count = chinsukoState.count;

    return Scaffold(
      appBar: AppBar(
        // 上部に「（焼いたちんすこうの数）ちんすこう」を表示
        title: Text('$count ちんすこう'),
      ),
      body: Center(
        // 説明テキストは削除し、画像のみ表示
        child: AnimatedChinsukoImage(
          onTap: () {
            // タップ時にカウンターをインクリメント
            ref.read(chinsukoProvider.notifier).increment();
          },
        ),
      ),
    );
  }
}
