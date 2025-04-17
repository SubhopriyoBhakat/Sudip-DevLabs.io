import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/resume_download.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600; // Check if mobile screen
    bool shouldShowTooltip = size.width > 700; // Tooltip will only show on wider screens

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.9,
      child: Center(
        child: Stack(
          //alignment: Alignment.center,
          children: [
            Center(
              child: Column(
                // Column
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF6AE99F),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Text(
                        "Software Developer",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Hi, I'm Sudip", // 👋",
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 32 : 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE3D5B1), // Colors.deepPurple[900],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: isMobile ? double.infinity : 700,
                    child: DefaultTextStyle(
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white60,
                      ),
                      child: Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "Welcome to my portfolio — transforming ideas into code.",
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 100),
                            ),
                            TypewriterAnimatedText(
                              "I'm Sudip — a passionate Flutter Full-stack Developer.",
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 100),
                            ),
                            TypewriterAnimatedText(
                              "Crafting UIs with Flutter, powerful backends with Serverpod.",
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 100),
                            ),
                            TypewriterAnimatedText(
                              "Stacked with Firebase, PostgreSQL, REST and GraphQL.",
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          onTap: () {
                            if (kDebugMode) {
                              print("Tap Event");
                            }
                          },
                          repeatForever: true,
                          stopPauseOnTap: true,
                          displayFullTextOnTap: true,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 60,
                  ), // Some spacing for the tech stack icons
                  // Tech Stack Icons (Flutter, Dart, Java, PostgreSQL)
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      SvgPicture.network(
                        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
                        height: 40,
                        /*placeholderBuilder: (BuildContext context){
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            period: Duration(seconds: 2),
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 50,
                              height: 40, // Same height as the SVG
                              color: Colors.white, // Placeholder color
                            ),
                          );
                        },*/
                      ),
                      SvgPicture.network(
                        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg',
                        height: 40,
                      ),
                      SvgPicture.network(
                        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg',
                        height: 40,
                      ),
                      SvgPicture.network(
                        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg',
                        height: 40,
                      ),
                      SvgPicture.network(
                        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg',
                        height: 40,
                      ),
                      SvgPicture.network(
                        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg',
                        height: 40,
                      ),
                      SvgPicture.network(
                        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg',
                        height: 40,
                      ),
                      SvgPicture.network(
                        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/graphql/graphql-plain.svg',
                        height: 40,
                      ),
                      SvgPicture.network(
                        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg',
                        height: 40,
                      ),
                      SvgPicture.network(
                        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postman/postman-original.svg',
                        height: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 50,
                    runSpacing: 20,
                    children: [ResumeButton()],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Align(
              alignment: size.width > 700
                  ? Alignment.topRight
                  : Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      child: shouldShowTooltip
                          ? Tooltip(
                        // The message to show on hover/tap
                        message: 'Drop a message',
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          color: Colors.black, // Tooltip text color
                          fontSize: 14, // Tooltip text size
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Colors.amberAccent,
                            ),
                          ),
                          onPressed: () => _launchURL("https://www.linkedin.com/in/sudip-howlader"),
                          child: Text(
                              "💬 Let's Connect!",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                      )
                          :  TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.amberAccent,
                          ),
                        ),
                        onPressed: () => _launchURL("https://www.linkedin.com/in/sudip-howlader"),
                        child: Text(
                          "💬 Let's Connect!",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    if (kDebugMode) {
      print('Could not launch $url');
    }
    throw 'Could not launch $url';
  }
}
