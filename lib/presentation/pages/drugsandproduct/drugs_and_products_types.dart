import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/drugsandproduct/drugs_and_products.dart';
import 'package:pharma/presentation/pages/search/search_field.dart';

// ignore: must_be_immutable
class DrugsScreen extends StatefulWidget {
  String name;
  bool isDrugs = true;
  DrugsScreen({required this.isDrugs, required this.name, super.key});

  @override
  State<DrugsScreen> createState() => _DrugsScreenState();
}

class _DrugsScreenState extends State<DrugsScreen> {
  List<Map<String, dynamic>> drugs = [
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": false,
      "combination":
          "jashflalhf LJHAFLSKHAL LJHASLFKHAL KHALKSFHA JAHSLJKFHA LKSALF ",
      "caliber": "jsfkjf jsfhjaf lshlafkha lkhlkag",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj sjhfkljahf ljhsajfha lkhsf",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
  ];
  List<Map<String, dynamic>> products = [
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
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
                    Text(
                      widget.name,
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF3467D2),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 17),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const SearchField();
                              },
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.search,
                          size: 27,
                          color: Color(0xFF3467D2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.95,
                child: widget.isDrugs
                    ? GridView.builder(
                        itemCount: drugs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          // mainAxisSpacing: 2,
                          childAspectRatio: 0.7,
                        ),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DrugsAndProducts(
                            name: drugs[index]["name"],
                            imageUrl: drugs[index]["image"],
                            total: drugs[index]["total"],
                            statment: drugs[index]["statment"],
                            combination: drugs[index]["combination"],
                            caliber: drugs[index]["caliber"],
                            type: drugs[index]["type"],
                            pharmaceuticalForm: drugs[index]
                                ["pharmaceuticalForm"],
                            netPrice: drugs[index]["netPrice"],
                            commonPrice: drugs[index]["commonPrice"],
                            productDate: drugs[index]["productDate"],
                            expDate: drugs[index]["expDate"],
                          );
                        },
                      )
                    : GridView.builder(
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          // mainAxisSpacing: 2,
                          childAspectRatio: 0.7,
                        ),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DrugsAndProducts(
                            name: products[index]["name"],
                            imageUrl: products[index]["image"],
                            total: products[index]["total"],
                            statment: products[index]["statment"],
                            combination: products[index]["combination"],
                            caliber: products[index]["caliber"],
                            type: products[index]["type"],
                            pharmaceuticalForm: products[index]
                                ["pharmaceuticalForm"],
                            netPrice: products[index]["netPrice"],
                            commonPrice: products[index]["commonPrice"],
                            productDate: products[index]["productDate"],
                            expDate: products[index]["expDate"],
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
