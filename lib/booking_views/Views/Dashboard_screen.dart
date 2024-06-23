import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduated_project/Api/doctor.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/News/Home_view/home_page.dart';
import 'package:graduated_project/booking_views/Views/doctor_details_screen.dart';
import 'package:graduated_project/booking_views/Views/doctor_search.dart';
import 'package:graduated_project/booking_views/Views/find_doctor.dart';
import 'package:graduated_project/booking_views/Widgets/article.dart';
import 'package:graduated_project/booking_views/Widgets/banner.dart';
import 'package:graduated_project/booking_views/Widgets/listIcons.dart';
import 'package:graduated_project/booking_views/Widgets/list_doctor1.dart';
import 'package:graduated_project/store_views/home_page_store.dart';

import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static String id = "Dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> doctors = [];
  void initState() {
    super.initState();
    loadDoctors();
  }

  loadDoctors() async {
    List<dynamic> fetchedDoctors = await DoctorApi.get();
    setState(() {
      doctors = fetchedDoctors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.06,
              child: Image.asset(
                "Assets/icons/bell.png",
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ],
        title: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Find your desire\nhealth solution",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
          ],
        ),
        toolbarHeight: 80,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(),
              child: TextField(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const find_doctor()));
                },
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.none,
                autofocus: false,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  focusColor: Colors.black26,
                  fillColor: const Color.fromARGB(255, 247, 247, 247),
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      height: 10,
                      width: 10,
                      child: Image.asset(
                        "Assets/icons/search.png",
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  prefixIconColor: const Color.fromARGB(255, 3, 190, 150),
                  label: const Text("Search doctor, drugs, articles..."),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Body Start fro here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              listIcons(Icon: "Assets/icons/Doctor.png", text: "Doctor"),
              listIcons(Icon: "Assets/icons/Pharmacy.png", text: "Pharmacy"),
              listIcons(Icon: "Assets/icons/Hospital.png", text: "Hospital"),
              listIcons(Icon: "Assets/icons/Ambulance.png", text: "Ambulance"),
            ],
          ),

          //List icons (Can Edit in Widgets )
          const SizedBox(
            height: 10,
          ),
          const banner(),
          // Banner Design
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Doctor",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: doctor_search(
                              searchText: '',
                            )));
                  },
                  child: Text(
                    "See all",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: const Color.fromARGB(255, 3, 190, 150),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 180,
              width: 400,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: doctors.length,
                itemBuilder: (BuildContext context, int index) {
                  final doctor = doctors[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: DoctorDetails(
                            doctor: doctor,
                          ),
                        ),
                      );
                    },
                    child: list_doctor1(
                      distance: "130m Away",
                      image: doctor['image'],
                      maintext: doctor['name'],
                      numRating: "4.6",
                      subtext: doctor['specialty'],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Health News",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, NewsHomePage.id);
                  },
                  child: Text(
                    "See all",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: const Color.fromARGB(255, 3, 190, 150),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //Article banner here import from widget>article
          article(
              image: "Assets/images2/article1.png",
              dateText: "Jun 10, 2021 ",
              duration: "5min read",
              mainText:
                  "The 25 Healthiest Fruits You Can Eat,\nAccording to a Nutritionist"),
        ]),
      ),
    );
  }
}
