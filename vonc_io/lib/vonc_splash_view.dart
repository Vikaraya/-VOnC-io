import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

//import 'package:vonc/view/login_signup/auth_screen.dart';
//import 'package:vonc/view/login_signup/example2.dart';
//import 'package:vonc/view/pages/cervices.dart';
//import 'package:vonc/view/pages/food_page.dart';
//import 'package:vonc/view/pages/living_Essentials.dart';
//import 'package:vonc/view/pages/living_generals.dart';
//import 'package:vonc/view/pages/offers_page.dart';

import 'package:vonc_io/view/login_signup/auth_screen.dart';
import 'package:vonc_io/view/pages/vonc_main_screen.dart';

class VoncSplashView extends StatefulWidget {
  const VoncSplashView({super.key});

  @override
  State<VoncSplashView> createState() => _VoncSplashViewState();
}

class _VoncSplashViewState extends State<VoncSplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset("assets/videos/gif/VOnC ss.gif"),
        splashIconSize: 2000.0,
        centered: true,
        nextScreen: const AuthScreen(),
        backgroundColor: Colors.black,
        duration: 1100,
      ),
    );
  }
}

// // foods Splash Screen
// class VoncFoods extends StatefulWidget {
//   const VoncFoods({super.key});

//   @override
//   State<VoncFoods> createState() => _VoncFoodsState();
// }

// class _VoncFoodsState extends State<VoncFoods> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSplashScreen(
//         splash: Image.asset("assets/icons/vonc_Foods_logo.png"),
//         splashIconSize: 200.0,
//         centered: true,
//         nextScreen: const FoodPage(),
//         backgroundColor: Colors.blueAccent.shade700,
//         duration: 1200,
//       ),
//     );
//   }
// }

// // VOnC Living_Generals splash screen

// class Vonclg extends StatefulWidget {
//   const Vonclg({super.key});

//   @override
//   State<Vonclg> createState() => _VonclgState();
// }

// class _VonclgState extends State<Vonclg> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSplashScreen(
//         splash: Image.asset("assets/icons/vonc_grocerys_logo.png"),
//         splashIconSize: 200.0,
//         centered: true,
//         nextScreen: const LivingGenerals(),
//         backgroundColor: Colors.lightGreenAccent.shade700,
//         duration: 1200,
//       ),
//     );
//   }
// }
// // VOnC Living_Essentials splash screen

// class Voncle extends StatefulWidget {
//   const Voncle({super.key});

//   @override
//   State<Voncle> createState() => _VoncleState();
// }

// class _VoncleState extends State<Voncle> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSplashScreen(
//         splash: Image.asset("assets/icons/vonc_Fashion_logo.png"),
//         splashIconSize: 200.0,
//         centered: true,
//         nextScreen: const LivingEssentials(),
//         backgroundColor: Colors.yellow.shade700,
//         duration: 1200,
//       ),
//     );
//   }
// }

// // VOnC Cervices splash screen

// class Vonc_Cervices extends StatefulWidget {
//   const Vonc_Cervices({super.key});

//   @override
//   State<Vonc_Cervices> createState() => _Vonc_CervicesState();
// }

// class _Vonc_CervicesState extends State<Vonc_Cervices> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSplashScreen(
//         splash: Image.asset("assets/icons/vonc_Cervices_logo.png"),
//         splashIconSize: 200.0,
//         centered: true,
//         nextScreen: const Cervices(),
//         backgroundColor: Colors.grey.shade700,
//         duration: 1200,
//       ),
//     );
//   }
// }
// // vonc_Offers splash Screen

// class vonc_Offers extends StatefulWidget {
//   const vonc_Offers({super.key});

//   @override
//   State<vonc_Offers> createState() => _vonc_OffersState();
// }

// class _vonc_OffersState extends State<vonc_Offers> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSplashScreen(
//         splash: Image.asset(""),
//         splashIconSize: 200.0,
//         centered: true,
//         nextScreen: const OffersPage(),
//         backgroundColor: Colors.purpleAccent.shade700,
//         duration: 1200,
//       ),
//     );
//   }
// }

// // VOnC_About Splash Screen

// class VoncAbout extends StatefulWidget {
//   const VoncAbout({super.key});

//   @override
//   State<VoncAbout> createState() => _VoncAboutState();
// }

// class _VoncAboutState extends State<VoncAbout> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSplashScreen(
//         splash: Image.asset(""),
//         splashIconSize: 200.0,
//         centered: true,
//         nextScreen: const VoncAbout(),
//         backgroundColor: Colors.black38,
//         duration: 1200,
//       ),
//     );
//   }
// }
// // VOnC_IO Splash Screen

// class VoncIo extends StatefulWidget {
//   const VoncIo({super.key});

//   @override
//   State<VoncIo> createState() => _VoncIoState();
// }

// class _VoncIoState extends State<VoncIo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSplashScreen(
//         splash: Image.asset(""),
//         splashIconSize: 200.0,
//         centered: true,
//         nextScreen: const VoncIo(),
//         backgroundColor: Colors.indigoAccent.shade700,
//         duration: 1200,
//       ),
//     );
//   }
// }
