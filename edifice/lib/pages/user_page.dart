import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, this.name, this.passwd});
  final name, passwd;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
              "Your username: ${widget.name}\n Password: ${widget.passwd}"),
        ),
      ),
    );
  }
}
