import 'package:flutter/material.dart';
import 'package:webview_universal/webview_universal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WebViewController wvController = WebViewController();

  @override
  void initState() {
    super.initState();
    wvController.init(
        context: context,
        setState: setState,
        uri: Uri.parse("http://103.73.226.60:8000"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: WebView(
            controller: wvController,
          ),
        ),
      ),
    );
  }
}
