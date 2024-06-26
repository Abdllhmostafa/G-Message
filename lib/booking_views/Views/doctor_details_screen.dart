import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduated_project/booking_views/Views/appointment.dart';
import 'package:graduated_project/booking_views/Widgets/date_select.dart';
import 'package:graduated_project/booking_views/Widgets/doctorList.dart';
import 'package:graduated_project/booking_views/Widgets/time_select.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorDetails extends StatefulWidget {
  final doctor;
  const DoctorDetails({
    super.key,
    required this.doctor,
  });
  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool showExtendedText = false;
  String? timeSelect;
  String? dateSelect;

  void updateTimeSelect(String selectedTime) {
    setState(() {
      timeSelect = selectedTime;
    });
  }

  void updateDateSelect(String selectedDate) {
    setState(() {
      dateSelect = selectedDate;
    });
  }

  void toggleTextVisibility() {
    setState(() {
      showExtendedText = !showExtendedText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("Assets/icons/back1.png"),
              )),
            ),
          ),
          title: Text(
            "Top Doctors",
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
          ),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 100,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("Assets/icons/more.png"),
                )),
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                doctorList(
                  distance: "800m away",
                  image: widget.doctor['image'],
                  maintext: widget.doctor['name'],
                  numRating: "4.7",
                  subtext: widget.doctor['specialty'],
                ),
                GestureDetector(
                  onTap: toggleTextVisibility,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          showExtendedText
                              ? widget.doctor['about']
                              : widget.doctor['about'],
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 37, 37, 37),
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          showExtendedText ? "Read less" : "Read more",
                          style: TextStyle(
                            color: showExtendedText
                                ? const Color.fromARGB(255, 1, 128, 111)
                                : const Color.fromARGB(255, 1, 128,
                                    111), // Change color based on visibility
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 3,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        date_Select(
                          date: "27",
                          maintext: "Thu",
                          onTap: updateDateSelect,
                        ),
                        date_Select(
                          date: "28",
                          maintext: "Fri",
                          onTap: updateDateSelect,
                        ),
                        date_Select(
                          date: "29",
                          maintext: "Sat",
                          onTap: updateDateSelect,
                        ),
                        date_Select(
                          date: "30",
                          maintext: "Sun",
                          onTap: updateDateSelect,
                        ),
                        date_Select(
                          date: "1",
                          maintext: "Mon",
                          onTap: updateDateSelect,
                        ),
                        date_Select(
                          date: "2",
                          maintext: "Tue",
                          onTap: updateDateSelect,
                        ),
                        date_Select(
                          date: "3",
                          maintext: "Wed",
                          onTap: updateDateSelect,
                        ),
                        date_Select(
                          date: "4",
                          maintext: "Thu",
                          onTap: updateDateSelect,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                //Time select container importing widget from widgets/times_select
                Container(
                  height: MediaQuery.of(context).size.height * 0.2400,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //In main container 2 Columns use
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2500,
                        width: MediaQuery.of(context).size.width * 0.2900,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              time_select(
                                mainText: "09:00 AM",
                                onTap: updateTimeSelect,
                              ),
                              time_select(
                                mainText: "01:00 AM",
                                onTap: updateTimeSelect,
                              ),
                              time_select(
                                mainText: "04:00 AM",
                                onTap: updateTimeSelect,
                              ),
                              time_select(
                                mainText: "07:00 AM",
                                onTap: updateTimeSelect,
                              ),
                            ]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2500,
                        width: MediaQuery.of(context).size.width * 0.2500,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              time_select(
                                mainText: "10:00 PM",
                                onTap: updateTimeSelect,
                              ),
                              time_select(
                                mainText: "02:00 PM",
                                onTap: updateTimeSelect,
                              ),
                              time_select(
                                mainText: "07:00 PM",
                                onTap: updateTimeSelect,
                              ),
                              time_select(
                                mainText: "09:00 PM",
                                onTap: updateTimeSelect,
                              ),
                            ]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2500,
                        width: MediaQuery.of(context).size.width * 0.2500,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              time_select(
                                mainText: "11:00 AM",
                                onTap: updateTimeSelect,
                              ),
                              time_select(
                                mainText: "03:00 PM",
                                onTap: updateTimeSelect,
                              ),
                              time_select(
                                mainText: "08:00 PM",
                                onTap: updateTimeSelect,
                              ),
                              time_select(
                                mainText: "10:00 AM",
                                onTap: updateTimeSelect,
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 80,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.1300,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 247, 247),
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "Assets/icons/Chat.png",
                                ),
                                filterQuality: FilterQuality.high)),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (timeSelect != null && dateSelect != null) {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: Appointment(
                                      doctor: widget.doctor,
                                      time: timeSelect!,
                                      date: dateSelect!,
                                    )));
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.6300,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 2, 179, 149),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Book Appointment",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ));
  }
}
