// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/profits/sales/listofsalesproducts.dart';

// ignore: must_be_immutable
class ListOfDateSales extends StatefulWidget {
  String date;
  double totalPrice;
  ListOfDateSales({required this.date, required this.totalPrice, super.key});

  @override
  State<ListOfDateSales> createState() => _ListOfDateSalesState();
}

class _ListOfDateSalesState extends State<ListOfDateSales> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ListOfSalesProducts(
                  date: widget.date, totalPrice: widget.totalPrice);
            },
          ),
        );
      },
      splashColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF3467D2).withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage("images/app/snack.png"),
                fit: BoxFit.contain,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            ),
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.date.replaceAll("-", "/"),
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.004,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  "${widget.totalPrice.toString()} by Thousand SY",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.dancingScript(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
