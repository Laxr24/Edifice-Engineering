import 'package:edifice/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:passwordfield/passwordfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  String userName = "";
  String password = "";

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 70.0, vertical: 20.0),
                  child: TextField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 70.0, vertical: 20.0),
                  child: PasswordField(
                    controller: passwordController,
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Builder(builder: (context) {
                  return LoginButton(
                    userNameController: userNameController,
                    passwordController: passwordController,
                  );
                }),
                const Spacer(),
                const SizedBox(
                  height: 10.0,
                ),
                const Image(
                  image: AssetImage("images/edifice_logo.png"),
                  width: 150.00,
                  height: 150.00,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton(
      {super.key, this.userNameController, this.passwordController});
  // ignore: prefer_typing_uninitialized_variables
  final userNameController, passwordController;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  String userName = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.black),
        foregroundColor: MaterialStatePropertyAll(Colors.white),
        fixedSize: MaterialStatePropertyAll(
          Size(300.0, 10.0),
        ),
      ),
      onPressed: () {
        //  Setting current state value.
        setState(() {
          userName = widget.userNameController.text;
          password = widget.passwordController.text;
        });

        debugPrint("Username $userName");
        debugPrint("Password $password");

        if (userName == "user1" || userName == "user2" || userName == "user3") {
          if (password == "user1pass" ||
              password == "user2pass" ||
              password == "user3pass") {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserPage(
                  name: userName,
                  passwd: password,
                ),
              ),
            );
          } else {
            const toast = SnackBar(
              content: Text("Wrong password. Try again"),
            );
            ScaffoldMessenger.of(context).showSnackBar(toast);
          }
        } else {
          const toast = SnackBar(
            content: Text("Wrong Username. Try again"),
          );
          ScaffoldMessenger.of(context).showSnackBar(toast);
        }
      },
      child: const Text(
        "Login",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }
}
