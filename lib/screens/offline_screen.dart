import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = MediaQuery.of(context).textScaler;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie Animation
                Flexible(
                  child: SizedBox(
                    width: size.width * 0.6,
                    child: Lottie.asset(
                      'assets/animations/noInternet.json',
                      frameRate: FrameRate.max,
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
        
                SizedBox(height: size.height * 0.03),
        
                // Main title
                Text(
                  "No Internet Connection",
                  style: TextStyle(
                    fontSize: textScale.scale(22),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
        
                SizedBox(height: size.height * 0.015),
        
                // Subtitle
                Text(
                  "Please check your connection and try again.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: textScale.scale(16),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
