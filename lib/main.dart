import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmi_mobile_app/drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Gmi Mobile App';

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: appTitle,
      home: HamburgerMenu(),
    );
  }
}
