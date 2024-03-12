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
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Builder(builder: (context) {
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
                        userName = userNameController.text;
                        password = passwordController.text;
                      });
                      // Resetting the controller
                      // userNameController.dispose();
                      // passwordController.dispose();

                      debugPrint("Username $userName");
                      debugPrint("Password $password");
                      

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
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
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
