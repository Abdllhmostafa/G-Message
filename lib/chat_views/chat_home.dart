import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/Widgets_store/custom_button.dart';
import 'package:graduated_project/chat_views/chat_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatHomeView extends StatelessWidget {
  ChatHomeView({super.key});
  static String id = 'Chat Home';
  @override
  Widget build(BuildContext context) {
    // var email = ModalRoute.of(context)!.settings.arguments;
    // String userName = ModalRoute.of(context)!.settings.arguments.toString();
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String? email = arguments?['email'] as String?;
    final String? userName = arguments?['userName'] as String?;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              Icons.chat,
              size: 30,
            ),
          )
        ],
        title: Text(
          'Medical inquiry',
          style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '(NOTES)\n' +
                    '1 > Real-Time Communication: Patients can chat with doctors in real-time, getting immediate responses to their health queries.\n\n' +
                    '2 > Confidential and Secure: Ensures patient confidentiality and data security through encryption and secure login protocols.\n\n' +
                    '3 > /24/7 Availability: Provides round-the-clock access to medical professionals for urgent advice.\n\n' +
                    '4 > Multilingual Support: Offers services in multiple languages .',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomButton(
                    text: 'Medical inquiry her  >>',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ChatView.id,
                        arguments: {"email": email, "userName": userName},
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
