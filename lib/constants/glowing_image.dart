import 'dart:math';
import 'package:flutter/material.dart';

class GlowingImage extends StatefulWidget {
  final double imageSize;
  const GlowingImage({super.key, required this.imageSize});

  @override
  State<GlowingImage> createState() => _GlowingImageState();
}

class _GlowingImageState extends State<GlowingImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  final List<Color> _glowColors = [
    Colors.blueAccent,
    Colors.pinkAccent,
    Colors.orangeAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = _controller.drive(
      ColorTween(
        begin: _glowColors[0],
        end: _glowColors[1],
      ),
    );

    // Optional: Change colors randomly in loop
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        final random = Random();
        final next = _glowColors[random.nextInt(_glowColors.length)];
        final current = _colorAnimation.value ?? _glowColors[0];
        _colorAnimation = _controller.drive(ColorTween(begin: current, end: next));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: widget.imageSize*0.8,
            height: widget.imageSize * 1.2,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: _colorAnimation.value!.withAlpha((0.7 * 255).toInt()),
                  blurRadius: 25,
                  spreadRadius: 8,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child:  Image.asset(
              'assets/images/myImage.jpg',
              width: widget.imageSize,
              height: widget.imageSize,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
