import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/about_section.dart';
import 'package:my_portfolio/widgets/drawer_menu.dart';
import 'package:my_portfolio/widgets/footer_section.dart';
import 'package:my_portfolio/widgets/hero_section.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/animated_gradient_bg.dart';
import '../widgets/glowing_title.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});
  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  bool isLoading = true; // Control the loading state
  bool _isAtTop = true;
  // ScrollController to control the scroll position
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _simulateLoading();
    _scrollController.addListener(() {
      setState(() {
        // Check if we're at the top of the page (scroll position is 0)
        _isAtTop = _scrollController.offset == 0;
      });
    });
  }


  // Simulating a network delay (loading) for 3 seconds (you can replace it with your data fetching logic)
  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      isLoading = false; // Set loading to false after delay
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return AnimatedGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:
            isLoading // Check the loading state before rendering the AppBar
                ? AppBar(
                  title: Shimmer.fromColors(
                    // Shimmer base color
                    baseColor: Colors.grey[700]!,
                    // Shimmer highlight color
                    highlightColor: Colors.grey[500]!,
                    // Duration for animation
                    period: const Duration(seconds: 2),
                    child: Container(
                      width: 250,
                      height: 30,
                      color: Colors.white,
                    ),
                  ),
                  elevation: 2,
                )
                : AppBar(
                  // Actual AppBar content after loading
                  title: GestureDetector(
                    onTap: () {
                      // Navigate to PortfolioHomeScreen when tapped
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PortfolioHome()),
                      );
                    },
                    child: GlowingTitle(
                        child: Center(
                        child: Text(
                          "✨ Sudip’s Lab 👨‍💻",
                          textAlign: TextAlign.center,
                        )
                    )
                    ),
                  ),
                  elevation: 2,
                  //actions: isMobile ? null : const [DrawerMenu()],
                ),
        //drawer:  null, //isMobile ? const DrawerMenu() :
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF2e2f33), Color(0xFF3a3b3f)],
            ),
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: const [
                HeroSection(),
                AboutSection(),
                ProjectsSection(),
                //ContactSection(),
                FooterSection(),
              ],
            ),
          ),
        ),
        floatingActionButton: _isAtTop
            ? null // Hide FAB when at the top
            : FloatingActionButton(
          elevation: 10,
          onPressed: () {
            // When pressed, scroll to the top
            _scrollController.animateTo(
              0, // Scroll to the top
              duration: Duration(milliseconds: 500), // Animation duration
              curve: Curves.easeInOut, // Animation curve
            );
          }, // Icon for the FAB
          tooltip: "Scroll to top",
          backgroundColor: Colors.transparent,  // Set background color to transparent since we are using an image
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),  // Circle shape
            side: BorderSide(
              color: Colors.blue,  // Border color
              width: 1,             // Border width
            ),
          ),
          child:  ClipOval(
            child: Image.network(
              //'https://img.icons8.com/bubbles/100/long-arrow-up.png',
              'https://img.icons8.com/clouds/100/long-arrow-up.png',// Replace with your image URL
              fit: BoxFit.cover,  // Ensure the image covers the entire button
            ),
          ),// Tooltip text
        ),
      ),
    );

  }
  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _scrollController.dispose();
    super.dispose();
  }
}
