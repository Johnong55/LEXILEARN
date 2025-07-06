import 'package:flutter/material.dart';
import 'dart:math';

class BellSwingIcon extends StatefulWidget {
  const BellSwingIcon({Key? key}) : super(key: key);

  @override
  _BellSwingIconState createState() => _BellSwingIconState();
}

class _BellSwingIconState extends State<BellSwingIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // A TweenSequence for swinging effect and returning to center
    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: pi / 4), weight: 1),
      TweenSequenceItem(tween: Tween(begin: pi / 4, end: -pi / 4), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -pi / 4, end: pi / 8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: pi / 8, end: -pi / 8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -pi / 8, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _startShake() {
    if (_controller.isAnimating) return;
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startShake,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value,
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                const Icon(Icons.notifications_none, color: Colors.white, size: 28),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
