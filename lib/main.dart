
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/offline_screen.dart';
import 'package:my_portfolio/screens/portfolio_home.dart';
import 'package:my_portfolio/util/network_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NetworkService _networkService = NetworkService();
  // Light Theme Configuration
  ThemeData _buildLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      brightness: Brightness.light,
    );
  }

  // Dark Theme Configuration
  ThemeData _buildDarkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _networkService.connectionStream,
      builder: (context, snapshot) {
        debugPrint("Snapshot data: ${snapshot.data}, state: ${snapshot.connectionState}");
        // Case 1: Waiting for Stream Data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            title: 'Sudip DevLabs',
            debugShowCheckedModeBanner: false,
            theme: _buildLightTheme(),
            darkTheme: _buildDarkTheme(),
            themeMode: ThemeMode.system,
            home: const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.lightGreenAccent
                  ),
                  strokeWidth: 6.0,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          );
        }

        // Case 2: Error Occurred in Stream
        if (snapshot.hasError) {
          if (kDebugMode) {
            print("Stream Error: ${snapshot.error}");
            if (snapshot.stackTrace != null) {
              print("Stack Trace: ${snapshot.stackTrace}");
            }
          }
          return MaterialApp(
            title: 'Sudip DevLabs',
            debugShowCheckedModeBanner: false,
            theme: _buildLightTheme(),
            darkTheme: _buildDarkTheme(),
            themeMode: ThemeMode.system,
            home: const NoInternetScreen(),
          );
        }

        // Case 3: Stream Data Available
        bool hasConnection = snapshot.data ?? false;
        return MaterialApp(
          title: 'Sudip DevLabs',
          debugShowCheckedModeBanner: false,
          theme: _buildLightTheme(),
          darkTheme: _buildDarkTheme(),
          themeMode: ThemeMode.system,
          home: hasConnection ? const PortfolioHome() : const NoInternetScreen(),
        );
      },
    );
  }

  @override
  void dispose() {
    _networkService.dispose();
    super.dispose();
  }
}