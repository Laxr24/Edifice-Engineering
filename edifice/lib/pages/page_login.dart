import 'package:edifice/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

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
                    color: Colors.blue,
                    passwordConstraint: r'.*[@$#.*].*',
                    hintText: 'Password',
                    errorMessage:
                        'must contain special character either . * @ # \$',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                LoginButtonSnackbar(
                  userName: userNameController.text,
                  userPass: passwordController.text,
                ),
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

class LoginButtonSnackbar extends StatelessWidget {
  const LoginButtonSnackbar(
      {super.key, required this.userName, required this.userPass});
  final userName, userPass;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text("Username: $userName Pass: $userPass"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          // Navigator.pop(context);
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       if (userPass != null && userName != null) {
          //         return const UserPage(
          //           name: " ",
          //           passwd: "kothinPass",
          //         );
          //       } else {
          //         return const LoginPage();
          //       }
          //     },
          //   ),
          // );
        },
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            fixedSize: MaterialStatePropertyAll(Size(300, 10))),
        child: const Text('Login'),
      ),
    );
  }
}
