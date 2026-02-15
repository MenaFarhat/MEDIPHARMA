// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/auth/first_sign_up_page.dart';
import '../pages/auth/log_in_page.dart';
import '../widgets/custom_clipper.dart';

class ChooseAuth extends StatelessWidget {
  const ChooseAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.645,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          0.4, // Adjust the height as needed
                      color: const Color(
                          0xFF3467D2), // Replace with your desired color
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: BottomCenterClipper(),
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          0.9, // Adjust the height as needed
                      color: const Color(
                          0xFF3467D2), // Replace with your desired color
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    "images/app/Auth.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return LogInPage(
                      showButton: true,
                    );
                  },
                ),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.81,
              decoration: BoxDecoration(
                color: const Color(0xFF3467D2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Login",
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) {
                  return const FirstSignupScreen();
                })),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.81,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF3467D2)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Sign up",
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF3467D2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
