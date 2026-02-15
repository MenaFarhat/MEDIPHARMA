// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/profits/purchases/show_bill_photo.dart';

import 'listofbillproduct.dart';

// ignore: must_be_immutable
class SearchByDateBillComponent extends StatefulWidget {
  String date;
  String image;
  double totalPrice;
  String description;
  String storageHouseName;
  SearchByDateBillComponent(
      {required this.date,
      required this.image,
      required this.totalPrice,
      required this.description,
      required this.storageHouseName,
      super.key});

  @override
  State<SearchByDateBillComponent> createState() =>
      _SearchByDateBillComponentState();
}

class _SearchByDateBillComponentState extends State<SearchByDateBillComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ListOfBillProduct(
                    date: widget.date,
                    totalPrice: widget.totalPrice,
                  );
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
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.35),
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Positioned(
                top: 3,
                right: 3,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.54,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return ShowBillPhoto(
                                                image: widget.image,
                                                date: widget.date,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(18),
                                            topRight: Radius.circular(18),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(widget.image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: 3,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey.shade300
                                            .withOpacity(0.5),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: const Icon(
                                            Icons.clear_rounded,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "The Date: ",
                                        style: GoogleFonts.lora(
                                          textStyle: const TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF3467D2),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        widget.date,
                                        style: GoogleFonts.lora(
                                          textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "The Storage-House Name: ",
                                        style: GoogleFonts.lora(
                                          textStyle: const TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF3467D2),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 2),
                                  child: Text(
                                    widget.storageHouseName,
                                    style: GoogleFonts.lora(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "The Total Price: ",
                                        style: GoogleFonts.lora(
                                          textStyle: const TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF3467D2),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 2),
                                  child: Text(
                                    "${widget.totalPrice.toString()} by thoousand SY",
                                    style: GoogleFonts.dancingScript(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    "The Description: ",
                                    style: GoogleFonts.lora(
                                      textStyle: const TextStyle(
                                        fontSize: 17,
                                        color: Color(0xFF3467D2),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 2),
                                  child: Text(
                                    widget.description,
                                    maxLines: 4,
                                    style: GoogleFonts.lora(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade300.withOpacity(0.5),
                    radius: 15,
                    child: const Center(
                      child: Icon(
                        Icons.priority_high_rounded,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.date,
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      "${widget.totalPrice.toString()} by thousand SY",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
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
        ),
      ],
    );
  }
}
