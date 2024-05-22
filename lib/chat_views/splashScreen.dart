import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:graduated_project/chat_views/onbordingSlider.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xff036666),
      splash: Image.asset(
        "Assets/images/image17.png",
      ),
      nextScreen: const onbordingSlider(),
      splashIconSize: 300,
      splashTransition: SplashTransition.decoratedBoxTransition,
      animationDuration: const Duration(milliseconds: 30),
    );
  }
}
