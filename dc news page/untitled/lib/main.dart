import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/newspage.dart';
import 'package:untitled/preferences.dart';
import 'package:untitled/splashscreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
 // WebView.platform = SurfaceAndroidWebView();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      title: 'Vartha',
    );
  }
}