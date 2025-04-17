import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HoverChip extends StatefulWidget {
  final String text;

  const HoverChip({super.key, required this.text});

  @override
  HoverChipState createState() => HoverChipState();
}

class HoverChipState extends State<HoverChip> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  final List<Color> vibrantHoverColors = [
    Colors.amber,
    Colors.cyan,
    Colors.pinkAccent,
    Colors.deepPurpleAccent,
    Colors.orangeAccent,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.tealAccent,
    Colors.indigoAccent,
    Colors.lime,
  ];

  int _currentIndex = 0;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && _isHovered) {
        _currentIndex = (_currentIndex + 1) % vibrantHoverColors.length;
        _animateToNextColor();
      }
    });

    _animateToNextColor();
  }

  void _animateToNextColor() {
    final nextIndex = (_currentIndex + 1) % vibrantHoverColors.length;
    _colorAnimation = ColorTween(
      begin: vibrantHoverColors[_currentIndex],
      end: vibrantHoverColors[nextIndex],
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward(from: 0);
  }

  void _startHoverEffect() {
    setState(() => _isHovered = true);
    _controller.forward(from: 0);
  }

  void _stopHoverEffect() {
    setState(() => _isHovered = false);
    _controller.stop();
    _currentIndex = 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hoverColor = _colorAnimation.value ?? Colors.white24;

    return MouseRegion(
      onEnter: (_) => _startHoverEffect(),
      onExit: (_) => _stopHoverEffect(),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: _isHovered ? hoverColor : Colors.white24,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white30),
            ),
            child: Text(
              widget.text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: _isHovered ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
