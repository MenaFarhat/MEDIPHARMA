// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/profits/purchases/adding_bill/product_compnent.dart';

class ProductsOfBill extends StatefulWidget {
  const ProductsOfBill({super.key});

  @override
  State<ProductsOfBill> createState() => _ProductsOfBillState();
}

class _ProductsOfBillState extends State<ProductsOfBill> {
  List<Map<String, dynamic>> data = [
    {
      "name": "mmm",
      "image": "images/app/mm.jpg",
    },
    {
      "name": "mmm",
      "image": "images/app/mm.jpg",
    },
    {
      "name": "mmm",
      "image": "images/app/mm.jpg",
    },
    {
      "name": "mmm",
      "image": "images/app/mm.jpg",
    },
    {
      "name": "mmm",
      "image": "images/app/mm.jpg",
    },
    {
      "name": "mmm",
      "image": "images/app/mm.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: []);
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 30,
                        color: Color(0xFF3467D2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.07),
                      child: Text(
                        "Bill's Products",
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFF3467D2),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: Text(
                          "Send",
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
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ProductComponent(
                      name: data[index]["name"],
                      image: data[index]["image"],
                      num: index,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade300.withOpacity(0.5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 40,
                            color: Color(0xFF3467D2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
