import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:voting_counter/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 768,
        defaultScale: true,
        defaultScaleFactor: 1,
        breakpoints: const [
          ResponsiveBreakpoint.resize(768, name: MOBILE, scaleFactor: 1),
          ResponsiveBreakpoint.resize(1100, name: TABLET, scaleFactor: 1),
          ResponsiveBreakpoint.resize(1280, name: DESKTOP, scaleFactor: 1),
          ResponsiveBreakpoint.autoScale(2560, name: "4K", scaleFactor: 1),
        ],
      ),
      title: 'Seçim Sayacı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(),
    );
  }
}
