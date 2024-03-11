import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Image(
                        image: AssetImage("images/bd_logo.png"),
                        width: 100.00,
                        height: 100.00,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Image(
                        image: AssetImage("images/rhd_logo.png"),
                        width: 100.00,
                        height: 100.00,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 70.0, vertical: 20.0),
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 70.0, vertical: 20.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    debugPrint("Username: " + userNameController.text);
                    debugPrint("Password: " + passwordController.text);
                    Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 10.0,
                ),
                Image(
                  image: AssetImage("images/edifice_logo.png"),
                  width: 150.00,
                  height: 150.00,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
