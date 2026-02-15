// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DetalsOfBillProduct extends StatefulWidget {
  String image;
  String name;
  int quantity;
  double price;
  double totalPriceofProduct;

  DetalsOfBillProduct(
      {required this.image,
      required this.name,
      required this.quantity,
      required this.price,
      required this.totalPriceofProduct,
      super.key});

  @override
  State<DetalsOfBillProduct> createState() => _DetalsOfBillProductState();
}

class _DetalsOfBillProductState extends State<DetalsOfBillProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey.shade300,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                  ),
                  color: Color(0xFF3467D2),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Text(
                  widget.name,
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF3467D2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Row(
                  children: [
                    Text(
                      "Quantity: ",
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: Text(
                        widget.quantity.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.dancingScript(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF3467D2),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Row(
                  children: [
                    Text(
                      "Price: ",
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: Text(
                        widget.price.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.dancingScript(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF3467D2),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 3),
                child: Row(
                  children: [
                    Text(
                      "Total Price: ",
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: Text(
                        widget.totalPriceofProduct.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.dancingScript(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF3467D2),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
