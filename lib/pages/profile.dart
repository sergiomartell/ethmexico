import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/back.png"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Profile(
            imageUrl:
                "https://pbs.twimg.com/profile_images/1453570894916321285/EAR3t2BU_400x400.jpg",
            name: "major_tom",
            website: "https://sergiomartell.com",
            designation: "Patron",
            email: "",
            phone_number: "",
          ),
        ),
      ),
    );
  }
}
