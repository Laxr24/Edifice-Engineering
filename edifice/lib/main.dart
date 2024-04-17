import 'package:edifice/pages/page_login.dart';
import 'package:flutter/material.dart';
import 'pages/page_profileinformation.dart';

void main() {
  runApp(const LoginPage());
}

// ------------ Test page -----------

// main() {
//   runApp(const MyTest());
// }

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestHome(),
    );
  }
}

class TestHome extends StatefulWidget {
  const TestHome({super.key});

  @override
  State<TestHome> createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  @override
  Widget build(BuildContext context) {
    return const ProfileInfoPage(
      name: "Jane Doe",
    );
  }
}
