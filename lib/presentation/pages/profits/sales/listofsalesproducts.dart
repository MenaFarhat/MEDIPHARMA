import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detailofproduct.dart';

// ignore: must_be_immutable
class ListOfSalesProducts extends StatefulWidget {
  String date;
  double totalPrice;
  ListOfSalesProducts(
      {required this.date, required this.totalPrice, super.key});

  @override
  State<ListOfSalesProducts> createState() => _ListOfSalesProductsState();
}

class _ListOfSalesProductsState extends State<ListOfSalesProducts> {
  List<Map<String, dynamic>> data = [
    {
      "image": "images/app/mm.jpg",
      "name": "Cetamool",
      "quantity": 3,
      "price": 1500.0,
      "total Price": 450000.0,
    },
    {
      "image": "images/app/mm.jpg",
      "name": "Panadol",
      "quantity": 1,
      "price": 2000.0,
      "total Price": 2000.0,
    },
    {
      "image": "images/app/mm.jpg",
      "name": "التهاب عيار 500",
      "quantity": 2,
      "price": 5000.0,
      "total Price": 10000.0,
    },
    {
      "image": "images/app/mm.jpg",
      "name": "حليب أطفال",
      "quantity": 2,
      "price": 10000.0,
      "total Price": 20000.0,
    },
    {
      "image": "images/app/mm.jpg",
      "name": "Panadol",
      "quantity": 1,
      "price": 2000.0,
      "total Price": 2000.0,
    },
    {
      "image": "images/app/mm.jpg",
      "name": "Panadol",
      "quantity": 1,
      "price": 2000.0,
      "total Price": 2000.0,
    },
    {
      "image": "images/app/mm.jpg",
      "name": "Panadol",
      "quantity": 1,
      "price": 2000.0,
      "total Price": 2000.0,
    },
    {
      "image": "images/app/mm.jpg",
      "name": "Panadol",
      "quantity": 1,
      "price": 2000.0,
      "total Price": 2000.0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
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
                          left: MediaQuery.of(context).size.width * 0.09),
                      child: Text(
                        widget.date.replaceAll("-", "/"),
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
                          right: MediaQuery.of(context).size.width * 0.07),
                      child: Text(
                        "${widget.totalPrice.toString()} SY",
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
              // ignore: sized_box_for_whitespace
              Container(
                height: MediaQuery.of(context).size.height * 0.93,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return DetailsOfProduct(
                      image: data[index]["image"],
                      name: data[index]["name"],
                      quantity: data[index]["quantity"],
                      price: data[index]["price"],
                      totalPriceofProduct: data[index]["total Price"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
