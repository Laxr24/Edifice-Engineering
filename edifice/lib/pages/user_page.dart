import 'package:edifice/components/video.dart';
import 'package:edifice/pages/page_profileinformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, this.name, this.passwd});
  final name, passwd;
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String username = "";
  // Title of the pages
  final List<String> _titles = [
    "Content browser",
    "Profile Information",
    "Settings"
  ];
  final List<Widget> _screens = [];
  int screenIndex = 0;
  int titleIndex = 0;
  @override
  void initState() {
    super.initState();
    username = widget.name;
    _screens.add(ContentBrowser());
    _screens.add(ProfileInformation(name: username));
    _screens.add(Settings());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[titleIndex]),
      ),
      drawer: Drawer(
        width: 300.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  setState(() {
                    titleIndex = 0;
                    screenIndex = 0;
                  });
                },
                minWidth: 280.0,
                color: const Color.fromARGB(255, 223, 255, 231),
                elevation: 0.9,
                child: const Text("Browse contents"),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    titleIndex = 1;
                    screenIndex = 1;
                  });
                },
                minWidth: 280.0,
                color: const Color.fromARGB(255, 223, 255, 231),
                elevation: 0.9,
                child: const Text("Profile information"),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    titleIndex = 2;
                    screenIndex = 2;
                  });
                },
                minWidth: 280.0,
                color: const Color.fromARGB(255, 223, 255, 231),
                elevation: 0.9,
                child: const Text("Settings"),
              ),
              MaterialButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                minWidth: 280.0,
                color: Color.fromARGB(255, 224, 62, 41),
                elevation: 0.9,
                child: const Text(
                  "Exit application",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _screens[screenIndex],
    );
  }
}

class ContentBrowser extends StatefulWidget {
  const ContentBrowser({super.key});

  @override
  State<ContentBrowser> createState() => _ContentBrowserState();
}

class _ContentBrowserState extends State<ContentBrowser> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          VideoCard(
            url:
                "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
          ),
          VideoCard(
            url:
                "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
          ),
          VideoCard(
            url:
                "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
          ),
          VideoCard(
            url:
                "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
          ),
        ]),
      ),
    );
  }
}

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return ProfileCard(
      name: name,
      age: 22,
      role: "Manager",
      level: 3,
      image: "",
      info: "This information of profile",
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Profile and App. settings",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                  "This is your profile and application setting area. This feature will allow you to control your subscription, preferances, contents, application modes and other settings. Currently we are working on this feature.",
                  style: TextStyle(fontSize: 20.0)),
            ),
          ],
        ),
      ),
    );
  }
}
