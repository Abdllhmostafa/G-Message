import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduated_project/booking_views/Views/doctor_details_screen.dart';
import 'package:graduated_project/booking_views/Views/doctor_search.dart';
import 'package:graduated_project/booking_views/Widgets/doctorList.dart';
import 'package:graduated_project/booking_views/Widgets/listIcons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class find_doctor extends StatelessWidget {
  const find_doctor({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.06,
              child: Image.asset("Assets/icons/back2.png")),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Column(
          children: [
            Text(
              "Find Doctor",
              style: GoogleFonts.inter(
                  color: Color.fromARGB(255, 51, 47, 47),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
          ],
        ),
        toolbarHeight: 100,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(),
              child: TextField(
                textAlign: TextAlign.start,
                controller: searchController,
                textInputAction: TextInputAction.none,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  focusColor: Colors.black26,
                  fillColor: Color.fromARGB(255, 247, 247, 247),
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                      width: MediaQuery.of(context).size.width * 0.01,
                      child: GestureDetector(
                        onTap: () {
                          if (searchController.text.isNotEmpty) {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: doctor_search(
                                      searchText: searchController.text,
                                    )));
                          }
                        },
                        child: Image.asset(
                          'Assets/icons/search.png',
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                  prefixIconColor: const Color.fromARGB(255, 3, 190, 150),
                  label: Text("Search doctor, drugs, articles..."),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Top Doctor",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              listIcons(Icon: "Assets/icons/Doctor.png", text: "General"),
              listIcons(Icon: "Assets/icons/Lungs.png", text: "Lungs Prob"),
              listIcons(Icon: "Assets/icons/Dentist.png", text: "General"),
              listIcons(
                  Icon: "Assets/icons/psychology.png", text: "Psychiatrist")
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              listIcons(Icon: "Assets/icons/covid.png", text: "General"),
              listIcons(Icon: "Assets/icons/injection.png", text: "Lungs Prob"),
              listIcons(Icon: "Assets/icons/cardiologist.png", text: "General"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Recommended Doctors",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: DoctorDetails(
                        doctor: [],
                      )));
            },
            child: doctorList(
                distance: "800m away",
                image: "Assets/icons/male-doctor.png",
                maintext: "Dr. Ahmed Ragab",
                numRating: "4.7",
                subtext: "Chardiologist"),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Your Recent Doctors",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1900,
                width: MediaQuery.of(context).size.width * 0.2900,
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.100,
                    width: MediaQuery.of(context).size.width * 0.1900,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("Assets/icons/male-doctor.png"),
                            filterQuality: FilterQuality.high)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Dr. Marcus")],
                  )
                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1900,
                width: MediaQuery.of(context).size.width * 0.2900,
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.100,
                    width: MediaQuery.of(context).size.width * 0.1900,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("Assets/icons/female-doctor.png"),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.contain)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Dr. Maria")],
                  )
                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1900,
                width: MediaQuery.of(context).size.width * 0.2900,
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.100,
                    width: MediaQuery.of(context).size.width * 0.1900,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "Assets/icons/black-doctor.png",
                            ),
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Dr. Luke")],
                  )
                ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
