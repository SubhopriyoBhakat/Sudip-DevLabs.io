
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/project_card.dart';
import '../constants/project_data.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [Color(0xFF333333), Color(0xFF1A1A1A)], // Charcoal to Black
          center: Alignment.topCenter,
          radius: 0.8,
          stops: [0.1, 1.0],
        ),
      ),

      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Projects",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              children:
              projectData.map((project) {
                    return ProjectCard(
                      //width: cardWidth,
                      title: project["title"]!,
                      description: project["description"]!,
                      githubUrl: project["githubUrl"]!,
                      imagePath: project["imagePath"]!,
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
