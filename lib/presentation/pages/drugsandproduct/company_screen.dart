// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pharma/presentation/pages/drugsandproduct/drugs_and_products_types.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CompanyScreen extends StatefulWidget {
  String name;
  String imageUrl;

  CompanyScreen({required this.name, required this.imageUrl, super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DrugsScreen(
            name: widget.name,
            isDrugs: true,
          );
        }));
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.1,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300, // Shadow color
              offset: const Offset(0, 3), // Offset in x and y direction
              blurRadius: 2, // Blur radius
              spreadRadius: 0, // Spread radius
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF3467D2),
                image: DecorationImage(
                  image: AssetImage(
                    widget.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                Text(
                  widget.name,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF3467D2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                Container(
                  child: Text(
                    "Medi-Pharma",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.dancingScript(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
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
