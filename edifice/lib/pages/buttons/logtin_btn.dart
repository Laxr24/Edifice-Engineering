import 'package:flutter/material.dart'; 

class LoginButtonSnackbar extends StatefulWidget {
  const LoginButtonSnackbar(
      {super.key, this.userName, this.userPass});
  final userName, userPass;

  @override
  State<LoginButtonSnackbar> createState() => _LoginButtonSnackbarState();
}

class _LoginButtonSnackbarState extends State<LoginButtonSnackbar> {

  String username = ""; 
  String passWord = ""; 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
                    setState(() {
                      username = widget.userName; 
                      passWord = widget.userPass; 
                    });
          final snackBar = SnackBar(
            content: Text("Username: $username Pass: $passWord"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          debugPrint(username); 
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