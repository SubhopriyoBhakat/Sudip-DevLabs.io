import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkService {
  late StreamSubscription<InternetStatus> _listener; // Declare listener as a class-level variable
  final StreamController<bool> _controller = StreamController<bool>.broadcast();

  NetworkService() {
    // Listen for connectivity changes
    _listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
      final isConnected = status == InternetStatus.connected;
      if (kDebugMode) {
        print('Internet Connected: $isConnected');
      }
      _controller.sink.add(isConnected); // Emit status changes
    });

    // Perform an initial connection check
    _checkConnection();
  }

  Stream<bool> get connectionStream => _controller.stream;

  Future<void> _checkConnection() async {
    await Future.delayed(Duration(milliseconds: 500)); // optional tweak
    final isConnected = await InternetConnection().hasInternetAccess;
    if (kDebugMode) {
      print('Initial Internet Connection: $isConnected');
    }
    _controller.sink.add(isConnected); // Emit initial connection status
  }

  void dispose() {
    _listener.cancel(); // Properly close the listener
    _controller.close(); // Close the stream controller
  }
}