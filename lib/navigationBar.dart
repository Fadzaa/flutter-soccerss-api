import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hit_api/Home.dart';
import 'package:hit_api/Profile.dart';
import 'package:hit_api/listFootball.dart';
import 'package:hit_api/loginForm.dart';
import 'SplashScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class navigationBar extends StatefulWidget {
  const navigationBar({Key? key}) : super(key: key);

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  int _currentIndex = 0;

  final tabs = [
    Home(),
    listFootball(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/homeIcon.svg"),
              label: 'Home',
              backgroundColor: Color.fromRGBO(1, 240, 255, 0.7),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/listIcon.svg"),
              label: 'List',
              backgroundColor: Color.fromRGBO(1, 240, 255, 0.7),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/profileIcon.svg"),
              label: "Profile",
              backgroundColor: Color.fromRGBO(1, 240, 255, 0.7),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      )

    );

  }
}
