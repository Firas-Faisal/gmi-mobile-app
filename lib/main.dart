import 'package:flutter/material.dart';
import 'package:gmi_mobile_app/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  // Ensures that Flutter is fully initialized before running the app
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Keep the splash screen visible while asynchronous operations complete
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Simulating some background operations like data loading or API calls
  await loadData();

  // Remove the splash screen after the loading process is complete
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

// Simulating an async function that takes time to load data
Future<void> loadData() async {
  // Simulate a network request or any other background task
  await Future.delayed(const Duration(seconds: 3));
}
