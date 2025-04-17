
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/build_text.dart';
import '../constants/glowing_image.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return SafeArea(
      child: Container(
        width: double.infinity,
        height: size.height * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF424346), Color(0xFF1A1B1B)],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Text(
                "👨‍💻 Behind the Code 👨‍💻",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),
              const SizedBox(height: 40),

              isMobile
                  ? Column(
                    children: [
                      _buildImage(context).animate().fadeIn(duration: 1000.ms),
                      const SizedBox(height: 40),
                      BuildText(
                        fontSize: isMobile ? 16 : 15,
                      ).animate().fadeIn(duration: 1200.ms).slideY(begin: 0.3),
                    ],
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildImage(
                          context,
                        ).animate().fadeIn(duration: 1000.ms),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 3, // Reduced from 2 to 3 for better balance
                        child: BuildText(
                          fontSize: isMobile ? 16 : 15,
                        ).animate().fadeIn(duration: 1200.ms).slideY(begin: 0.3),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final imageSize =
        isMobile ? (MediaQuery.of(context).size.width * 0.6).toDouble() : 400.0;

    return GlowingImage(imageSize: imageSize);
  }
}

