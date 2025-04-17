import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/hover_chip.dart';

class BuildText extends StatelessWidget {
  final double fontSize;

  const BuildText({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 800.0,
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.1), // translucent white
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2), // soft black shadow
              spreadRadius: 2,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 0.2), // light border
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🎓 Education
            Text(
              "🎓 Education",
              style: GoogleFonts.poppins(
                fontSize: fontSize + 2,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "BCA (Hons.) - Burdwan Raj College",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "The University of Burdwan",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      "2021 - 2024",
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 🚀 Skills
            Text(
              "🚀 Skills",
              style: GoogleFonts.poppins(
                fontSize: fontSize + 2,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                HoverChip(text: "Java"),
                HoverChip(text: "Dart"),
                HoverChip(text: "Flutter"),
                HoverChip(text: "Serverpod"),
                HoverChip(text: "PostgreSQL"),
                HoverChip(text: "REST APIs"),
              ],
            ),
            const SizedBox(height: 24),

            // 💡 Interests
            Text(
              "💡 Interests",
              style: GoogleFonts.poppins(
                fontSize: fontSize + 2,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                HoverChip(text: "Mobile App Development"),
                HoverChip(text: "PostgreSQL Development"),
                HoverChip(text: "Cyber Security"),
                HoverChip(text: "API Development"),
              ],
            ),
            const SizedBox(height: 24),

            // 🎮 Hobbies
            Text(
              "🎮 Hobbies",
              style: GoogleFonts.poppins(
                fontSize: fontSize + 2,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                HoverChip(text: "Learning New Technologies"),
                HoverChip(text: "Traveling & Exploring"),
                HoverChip(text: "Watching Movies"),
                HoverChip(text: "Listening to Music"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
