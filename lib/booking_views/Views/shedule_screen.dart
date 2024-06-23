import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/booking_views/Views/shedule_tab1.dart';
import 'package:graduated_project/booking_views/Views/shedule_tab2.dart';
import 'package:graduated_project/booking_views/Views/shedule_tab3.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SheduleScreen extends StatefulWidget {
  const SheduleScreen({super.key});

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<SheduleScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Top Doctors",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
          ),
          centerTitle: false,
          elevation: 0,
          toolbarHeight: 80,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("Assets/icons/bell.png"),
                )),
              ),
            ),
          ],
          backgroundColor: kPrimaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 00),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            // height: 50,
                            width: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 235, 235, 235)),
                              color: Color.fromARGB(255, 241, 241, 241),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: TabBar(
                                    indicator: BoxDecoration(
                                      color: Color.fromARGB(255, 5, 185, 155),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    indicatorColor: const Color.fromARGB(
                                        255, 241, 241, 241),
                                    unselectedLabelColor:
                                        const Color.fromARGB(255, 32, 32, 32),
                                    labelColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    controller: tabController,
                                    tabs: const [
                                      Tab(
                                        text: "  Upcoming  ",
                                      ),
                                      Tab(
                                        text: "  Completed  ",
                                      ),
                                      Tab(
                                        text: "  Cancel  ",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: TabBarView(
                                controller: tabController,
                                children: const [
                              shedule_tab1(),
                              shedule_tab2(),
                              shedule_tab3(),
                            ]))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
