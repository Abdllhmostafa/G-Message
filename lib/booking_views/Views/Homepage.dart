import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduated_project/booking_views/Views/Dashboard_screen.dart';
import 'package:graduated_project/booking_views/Views/shedule_screen.dart';

class HomepageBook extends StatefulWidget {
  @override
  State<HomepageBook> createState() => _HomepageBookState();
}

class _HomepageBookState extends State<HomepageBook> {
  List<IconData> icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.clipboardCheck,
  ];

  int page = 0;

  List<Widget> pages = [
    Dashboard(), // You can replace this with your actual pages

    SheduleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[page], // Display the selected page
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        iconSize: 20,
        activeIndex: page,
        height: 80,
        splashSpeedInMilliseconds: 300,
        gapLocation: GapLocation.none,
        activeColor: const Color.fromARGB(255, 0, 190, 165),
        inactiveColor: const Color.fromARGB(255, 223, 219, 219),
        onTap: (int tappedIndex) {
          setState(() {
            page = tappedIndex; // Update the selected page
          });
        },
      ),
    );
  }
}
