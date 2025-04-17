import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeButton extends StatefulWidget {
  const ResumeButton({super.key});

  @override
  State<ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<ResumeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Pulse effect
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchResume() {
    // Replace with your actual URL launcher
    launchUrl(Uri.parse("https://drive.google.com/file/d/1_UTCZxDHEJxpZtCx5c4P3GNYG23uyu_f/view?usp=drive_link"));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _launchResume,
      icon: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: child,
          );
        },
        child: const Icon(
            Icons.picture_as_pdf_rounded,
            size: 20,
          color: Colors.black,
        ),
      ),
      label: Text(
        "View Resume",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.deepPurple,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amberAccent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 8,
        shadowColor: Colors.black45,
      ),
    );
  }
}
