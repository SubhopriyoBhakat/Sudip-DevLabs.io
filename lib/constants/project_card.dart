
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String githubUrl;
  final String? imagePath;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.githubUrl,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive values based on screen width
        double cardWidth = constraints.maxWidth < 400
            ? constraints.maxWidth
            : constraints.maxWidth * 0.9;

        double imageSize = cardWidth * 0.3;
        double titleFont = cardWidth * 0.07;
        double descFont = cardWidth * 0.045;

        return Center(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: cardWidth,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                // Midnight Purple Gradient
                /*gradient: const LinearGradient(
                  colors: [Color(0xFF1E1B2E), Color(0xFF3B2F63)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),*/
                // Charcoal to Slate
                gradient: const LinearGradient(
                  colors: [Color(0xFF2C3E50), Color(0xFF4CA1AF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: imagePath != null && imagePath!.isNotEmpty
                        ? Image.asset(
                      imagePath!,
                      height: imageSize,
                      width: imageSize,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        if (kDebugMode) print("Image load error: $error");
                        return _placeholderIcon(imageSize);
                      },
                    )
                        : _placeholderIcon(imageSize),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: titleFont.clamp(16.0, 24.0),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF5F5F5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: descFont.clamp(12.0, 16.0),
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      final uri = Uri.parse(githubUrl);
                      if (await canLaunchUrl(uri)) {
                        launchUrl(uri);
                      }
                    },
                    icon: const Icon(Icons.code),
                    label: const Text("View on GitHub"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _placeholderIcon(double size) {
    return Container(
      height: size,
      width: size,
      color: Colors.deepPurple.shade100,
      child: const Icon(
        Icons.apps,
        size: 60,
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}
