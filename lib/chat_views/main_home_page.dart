import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/booking_views/Views/Dashboard_screen.dart';
import 'package:graduated_project/booking_views/Views/shedule_screen.dart';
import 'package:graduated_project/chat_views/chat_home.dart';
import 'package:graduated_project/chat_views/dashboard_home.dart';
import 'package:graduated_project/store_views/home_page_store.dart';

class MainHomeView extends StatefulWidget {
  MainHomeView({Key? key}) : super(key: key);
  static String id = 'main Home Page ';
  @override
  _MainHomeViewState createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  int currentIndex = 0; // Initialize currentIndex to 0
  List<Widget> screens = [
    Dashboard(),
    SheduleScreen(),
    ChatHomeView(),
    HomePageStore()
  ]; // Update to your desired screens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: const Color.fromARGB(255, 215, 228, 235)),
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(16),
          //   topRight: Radius.circular(16),
          // ),
          // color: kPrimaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            selectedIndex: currentIndex,
            // backgroundColor: kPrimaryColor,
            rippleColor: Colors.grey, // tab button ripple color when pressed
            hoverColor: Colors.grey, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 30,
            tabActiveBorder: Border.all(
                color: Colors.grey.shade800, width: 0.5), // tab button border
            tabShadow: [
              BoxShadow(color: kDarkBlueColor, blurRadius: 64)
            ], // tab button shadow
            curve: Curves.decelerate, // tab animation curves
            duration: Duration(milliseconds: 300), // tab animation duration
            gap: 3, // the tab button gap between icon and text
            color: kDarkBlueColor, // unselected icon color
            activeColor: Colors.white, // selected icon and text color
            iconSize: 30, // tab button icon size
            tabBackgroundColor: kDarkBlueColor, // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            onTabChange: (value) {
              setState(() {
                currentIndex = value;
                setState(() {}); // Update currentIndex on tab change
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.book,
                text: 'Booking',
              ),
              GButton(
                icon: Icons.chat,
                text: 'Chat',
              ),
              GButton(
                icon: Icons.local_pharmacy_outlined,
                text: 'Pharmacy',
              )
            ],
          ),
        ),
      ),
      // Display the selected screen
    );
  }
}
