import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ProfileCard(
                name: name,
                age: 22,
                role: "Manager",
                level: 3,
                image: "",
                info: "This information of profile",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TagChips extends StatelessWidget {
  const TagChips(
      {super.key, required this.tagText, required this.backgroundColor});
  final tagText, backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: backgroundColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        child: Text(
          "$tagText",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  final String name, image, info, role;
  final int age, level;
  const ProfileCard(
      {super.key,
      required this.name,
      required this.image,
      required this.info,
      required this.role,
      required this.age,
      required this.level});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: const DecorationImage(
                    image: AssetImage("images/profile_img.png"),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "#${widget.name}",
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          Text(
            widget.info,
            style: const TextStyle(fontSize: 15.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text("Tags:"),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              TagChips(
                tagText: widget.role.toString(),
                backgroundColor: Color.fromARGB(255, 168, 194, 252),
              ),
              TagChips(
                tagText: "${widget.age} years",
                backgroundColor: Color.fromARGB(255, 115, 243, 65),
              ),
              TagChips(
                tagText: "Level ${widget.level}",
                backgroundColor: Color.fromARGB(255, 250, 184, 121),
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.call,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.mail_outline,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.blur_circular,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
