import 'dart:math';
import 'package:flutter/material.dart';

class CursorsWidget extends StatefulWidget {
  final int cursorCount;
  const CursorsWidget({super.key, required this.cursorCount});

  @override
  State<CursorsWidget> createState() => _CursorsWidgetState();
}

class _CursorsWidgetState extends State<CursorsWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 30秒で1回転するように設定し、連続回転させる
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // カーソルがない場合は何も表示しない
    if (widget.cursorCount <= 0) return const SizedBox();

    // 円状配置用のパラメータ（必要に応じて調整してください）
    final double radius = 120;
    const double iconSize = 30;
    final double angleStep = 2 * pi / widget.cursorCount;

    return SizedBox(
      width: 2 * radius,
      height: 2 * radius,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // _controller.value が 0～1 を変化するので、これを 0～2π に変換してベースの回転角度とする
          final double baseAngle = _controller.value * 2 * pi;
          List<Widget> cursorWidgets = [];

          for (int i = 0; i < widget.cursorCount; i++) {
            // 各カーソルの配置角度はベース角度に等間隔のオフセットを加算
            final double angle = baseAngle + i * angleStep;
            final double dx = radius * cos(angle);
            final double dy = radius * sin(angle);
            // アイコンが中央（原点）を向くように、回転角は配置角度 + π（画像のデフォルト向きが右向きの場合）
            final double rotationAngle = angle + pi;

            cursorWidgets.add(
              Positioned(
                // 中心が (radius, radius) となるように、アイコンの中心位置に合わせるため iconSize/2 を引く
                left: radius + dx - iconSize / 2,
                top: radius + dy - iconSize / 2,
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: Image.asset(
                    'assets/cursor.png',
                    width: iconSize,
                    height: iconSize,
                  ),
                ),
              ),
            );
          }
          return Stack(
            clipBehavior: Clip.none,
            children: cursorWidgets,
          );
        },
      ),
    );
  }
}
