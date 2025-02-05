import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedChinsukoImage extends StatefulWidget {
  const AnimatedChinsukoImage({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<AnimatedChinsukoImage> createState() => _AnimatedChinsukoImageState();
}

class _AnimatedChinsukoImageState extends State<AnimatedChinsukoImage> {
  int animationKey = 0;

  void _handleTap() {
    widget.onTap();
    setState(() {
      animationKey++; // キー更新でアニメーション再生
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Animate(
        key: ValueKey(animationKey),
        effects: [
          ScaleEffect(
            begin: const Offset(1, 1),
            end: const Offset(1.2, 1.2),
            duration: 200.ms,
            curve: Curves.bounceOut,
          ),
        ],
        child: Image.asset(
          'assets/chinsuko.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
