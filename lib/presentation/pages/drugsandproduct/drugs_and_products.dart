// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/drugsandproduct/medicine_details_screen.dart';

// ignore: must_be_immutable
class DrugsAndProducts extends StatefulWidget {
  String name;
  String imageUrl;
  int total;
  bool statment;
  String combination;
  String caliber;
  String type;
  String pharmaceuticalForm;
  double netPrice;
  double commonPrice;
  DateTime productDate;
  DateTime expDate;
  DrugsAndProducts(
      {required this.name,
      required this.imageUrl,
      required this.total,
      required this.statment,
      required this.combination,
      required this.caliber,
      required this.type,
      required this.pharmaceuticalForm,
      required this.netPrice,
      required this.commonPrice,
      required this.productDate,
      required this.expDate,
      super.key});

  @override
  State<DrugsAndProducts> createState() => _DrugsAndProductsState();
}

class _DrugsAndProductsState extends State<DrugsAndProducts> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MedicineDetailsScreen(
                tradeName: widget.name,
                combination: widget.combination,
                caliber: widget.caliber,
                type: widget.type,
                pharmaceuticalForm: widget.pharmaceuticalForm,
                netPrice: widget.netPrice,
                commonPrice: widget.commonPrice,
                amount: widget.total,
                statement: widget.statment,
                imageUrl: widget.imageUrl,
                productDate: widget.productDate,
                expDate: widget.expDate,
              );
            },
          ),
        );
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 3),
                        blurRadius: 2,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  // left: 8,
                  child: ClipPath(
                    clipper: DiscountClipper(), // Custom clipper
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            widget.statment ? "Forbidden" : 'Permissible',
                            style: GoogleFonts.lora(
                              textStyle: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            backgroundColor: widget.statment == false
                                ? Colors.green
                                : Colors.red,
                            radius: 9,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.006),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  widget.name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF3467D2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.006),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${widget.total.toString()} unit",
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
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${widget.commonPrice.toString()} SY",
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

class DiscountClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double curveHeight = size.height * 0.15;
    final double curveWidth = size.width * 0.15;
    final double controlPointX = size.width * 0.12;
    final double controlPointY = size.height * 0.18;

    path.moveTo(0, curveHeight);
    path.quadraticBezierTo(controlPointX, controlPointY, curveWidth, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(curveWidth, size.height);
    path.quadraticBezierTo(
        controlPointX, size.height * 0.82, 0, size.height * 0.85);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
