
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFDF6FF), // pastel lavender-pink
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Get in Touch",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent.shade200,
            ),
          ).animate().fadeIn().slideY(begin: 0.2),
          const SizedBox(height: 20),
          Text(
            "Let's build something amazing together!",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black54,
            ),
          ).animate().fadeIn(delay: 300.ms),
          const SizedBox(height: 30),

          // Contact Box
          Container(
            width: 500,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Color(0xFFE3F2FD), Color(0xFFFFF3FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.shade100,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                _contactRow(Icons.email, "sudip@example.com"),
                const SizedBox(height: 12),
                _contactRow(Icons.phone, "+91 12345 67890"),
                const SizedBox(height: 12),
                _contactRow(Icons.location_on, "Kathmandu, Nepal"),
              ],
            ),
          ).animate().fadeIn().slideY(begin: 0.4),
        ],
      ),
    );
  }

  Widget _contactRow(IconData icon, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.deepPurpleAccent),
        const SizedBox(width: 12),
        Text(
          data,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
