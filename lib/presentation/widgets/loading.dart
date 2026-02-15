// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoadingScreen extends StatelessWidget {
  String title;
  LoadingScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.9),
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.6,
              bottom: MediaQuery.of(context).size.height * 0.4,
              child: Center(
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFF3467D2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.assignment,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              )),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.27,
              bottom: MediaQuery.of(context).size.height * 0.4,
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFF3467D2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.ac_unit_outlined,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              )),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.7,
              bottom: MediaQuery.of(context).size.height * 0.54,
              child: Center(
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFF3467D2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.attach_money_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              )),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.5,
              bottom: MediaQuery.of(context).size.height * 0.55,
              child: Center(
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFF3467D2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.barcode_reader,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              )),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.25,
              bottom: MediaQuery.of(context).size.height * 0.56,
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFF3467D2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.group,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              )),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.2,
              bottom: MediaQuery.of(context).size.height * 0.63,
              child: Center(
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFF3467D2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.enhanced_encryption_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              )),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.35,
              bottom: MediaQuery.of(context).size.height * 0.64,
              child: Center(
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFF3467D2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.equalizer,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              )),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.55,
            bottom: MediaQuery.of(context).size.height * 0.66,
            child: Center(
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: const Color(0xFF3467D2),
                ),
                child: const Center(
                  child: Icon(
                    Icons.vaccines_rounded,
                    color: Colors.white,
                    size: 28,
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
