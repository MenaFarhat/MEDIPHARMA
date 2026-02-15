// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pharma/presentation/pages/drugsandproduct/medicine_details_screen.dart';

// ignore: must_be_immutable
class SearchComponent extends StatefulWidget {
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

  SearchComponent(
      {required this.imageUrl,
      required this.name,
      required this.netPrice,
      required this.type,
      required this.total,
      required this.caliber,
      required this.combination,
      required this.commonPrice,
      required this.pharmaceuticalForm,
      required this.statment,
      required this.productDate,
      required this.expDate,
     
      super.key});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pushReplacement(
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
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          border: Border.all(
            color: const Color(0xFF3467D2),
            width: 3,
           
          ),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "The Price: ",
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF3467D2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    child: Text(
                      "${widget.commonPrice.toString()} SY",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "The Type: ",
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF3467D2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    child: Text(
                      widget.type,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "The Quantity: ",
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF3467D2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width * 0.4,
                lineHeight: MediaQuery.of(context).size.height * 0.03,
                percent: widget.total / 50,
                center: Text(
                  "${widget.total}%",
                  style: GoogleFonts.dancingScript(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                animation: true,
                backgroundColor: Colors.grey.shade400,
                progressColor: const Color(0xFF3467D2),
                barRadius: const Radius.circular(40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
