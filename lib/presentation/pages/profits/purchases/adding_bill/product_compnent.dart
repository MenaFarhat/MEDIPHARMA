// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProductComponent extends StatefulWidget {
  String name;
  String image;
  int num;
  ProductComponent(
      {required this.name, required this.image, required this.num, super.key});

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey.shade300.withOpacity(0.5),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                  color: const Color(0xFF3467D2),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      (widget.num + 1).toString(),
                      style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF3467D2),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 10),
            child: Row(
              children: [
                Text(
                  "Name: ",
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF3467D2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "The Quantity ",
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3467D2),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.065,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey.shade300.withOpacity(0.5),
                      ),
                      child: TextFormField(
                        onEditingComplete: () {
                          // Perform actions when "Done" is pressed
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter Quantity",
                          hintStyle: GoogleFonts.lora(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.grey.shade300.withOpacity(0.5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.grey.shade300.withOpacity(0.5)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "The Price",
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3467D2),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.065,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey.shade300.withOpacity(0.5),
                      ),
                      child: TextFormField(
                        onEditingComplete: () {
                          // Perform actions when "Done" is pressed
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter Price",
                          hintStyle: GoogleFonts.lora(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.grey.shade300.withOpacity(0.5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.grey.shade300.withOpacity(0.5)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
