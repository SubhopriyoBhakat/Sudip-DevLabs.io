import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*class GlowingTitle extends StatelessWidget {
  final Widget child;

  const GlowingTitle(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.purpleAccent, Colors.blueAccent, Colors.cyanAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        text,
        style: GoogleFonts.orbitron(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 20.0,
              color: Colors.purpleAccent.withAlpha((255 * 0.6).toInt()), // alpha = 153
              offset: const Offset(0, 0),
            ),
            Shadow(
              blurRadius: 30.0,
              color: Colors.cyanAccent.withAlpha(102), // 0.4 * 255
              offset: const Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}*/

class GlowingTitle extends StatelessWidget {
  final Widget child;

  const GlowingTitle({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Color(0xFF00FFC6), // Mint green
            Color(0xFF00B2FF), // Sky blue
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        child: DefaultTextStyle.merge(
          style: GoogleFonts.orbitron(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: const [
              Shadow(
                blurRadius: 20.0,
                color: Color(0x9900FFC6), // ~60% opacity
                offset: Offset(0, 0),
              ),
              Shadow(
                blurRadius: 30.0,
                color: Color(0x6600B2FF), // ~40% opacity
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

