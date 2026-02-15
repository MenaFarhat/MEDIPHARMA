// ignore_for_file: sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/drugsandproduct/saver_component.dart';
import 'package:pharma/presentation/widgets/nav_bar.dart';

import '../../widgets/loading.dart';

class Saver extends StatefulWidget {
  const Saver({super.key});

  @override
  State<Saver> createState() => _SaverState();
}

class _SaverState extends State<Saver> {
  bool b = false;
  List<Map<String, dynamic>> data = [
    // {
    //   "image": "images/app/mm.jpg",
    //   "name": "Panadol",
    //   "price": 1500.0,
    //   "quantity": 20,
    // },
    // {
    //   "image": "images/app/mm.jpg",
    //   "name": "Panadol",
    //   "price": 1500.0,
    //   "quantity": 20,
    // },
    // {
    //   "image": "images/app/mm.jpg",
    //   "name": "Panadol",
    //   "price": 1500.0,
    //   "quantity": 20,
    // },
    // {
    //   "image": "images/app/mm.jpg",
    //   "name": "Panadol",
    //   "price": 1500.0,
    //   "quantity": 20,
    // },
    // {
    //   "image": "images/app/mm.jpg",
    //   "name": "Panadol",
    //   "price": 1500.0,
    //   "quantity": 20,
    // },
    // {
    //   "image": "images/app/mm.jpg",
    //   "name": "Panadol",
    //   "price": 1500.0,
    //   "quantity": 20,
    // },
    // {
    //   "image": "images/app/mm.jpg",
    //   "name": "Panadol",
    //   "price": 1500.0,
    //   "quantity": 20,
    // },
    // {
    //   "image": "images/app/mm.jpg",
    //   "name": "Panadol",
    //   "price": 1500.0,
    //   "quantity": 20,
    // },
    // {
    //   "image": "images/app/mm.jpg",
    //   "name": "Panadol",
    //   "price": 1500.0,
    //   "quantity": 20,
    // },
    // {
    //   "image": "images/app/mm.jpg",
    //   "name": "Panadol",
    //   "price": 1500.0,
    //   "quantity": 20,
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
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
                            SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: [],
                            );
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
                              left: MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            'Clipboard',
                            style: GoogleFonts.lora(
                              textStyle: const TextStyle(
                                fontSize: 24,
                                color: Color(0xFF3467D2),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 55),
                        )
                      ],
                    ),
                  ),
                  data.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.15,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/app/empty.png",
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "There is no thing here!",
                                style: GoogleFonts.lora(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF3467D2),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return SaverComponent(
                                      image: data[index]["image"],
                                      name: data[index]["name"],
                                      price: data[index]["price"],
                                      quantity: data[index]["quantity"],
                                      index: index,
                                      sizeList: data.length,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    b = true;
                                  });
                                  Timer(const Duration(milliseconds: 800), () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const MyNavBar(),
                                      ),
                                    );
                                  });
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.075,
                                  width:
                                      MediaQuery.of(context).size.width * 0.81,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFF3467D2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Sale Conformation',
                                      style: GoogleFonts.lora(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            b == true
                ? LoadingScreen(
                    title: "Saving Sales Information",
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
