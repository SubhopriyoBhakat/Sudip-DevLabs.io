import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (kDebugMode) {
        print('Could not launch $url');
      }
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 💡 Footer Logo / Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.code, color: Colors.tealAccent, size: 20),
                const SizedBox(width: 8),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Sudip",
                        style: GoogleFonts.orbitron(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: " Howlader",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: [
                IconButton(
                  icon: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/174/174857.png",
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  onPressed:
                      () => _launchURL(
                        "https://www.linkedin.com/in/sudip-howlader",
                      ),
                  tooltip: 'LinkedIn',
                  hoverColor: Colors.orangeAccent,
                ),

                IconButton(
                  icon: Image.asset(
                    'assets/images/gmail.png',
                    height: 25,
                    fit: BoxFit.cover,// Ensure fixed width for consistent size
                  ),
                  onPressed: () => _launchURL("mailto:sudipxtalks@gmail.com"),
                  tooltip: 'Email',
                  hoverColor: Colors.orangeAccent,
                ),

                IconButton(
                  icon: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/25/25231.png",  // Colorful GitHub icon URL
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  onPressed: () => _launchURL(
                    "https://github.com/FlexiDriod",
                  ),
                  tooltip: 'GitHub',
                  hoverColor: Colors.orangeAccent,
                ),

              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize:
                  MainAxisSize.min, // Important: Row should hug its children
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "© 2025 Sudip Howlader | Built with Flutter 💙",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white60,
                    ),
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "sudipxtalks@gmail.com",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white60,
                    ),
                  ),
                ),*/
              ],
            ),
          ],
        ).animate().fadeIn(duration: 800.ms),
      ),
    );
  }
}
