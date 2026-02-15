// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pharma/presentation/pages/drugsandproduct/saver.dart';
import 'package:pharma/presentation/pages/medical_prescriptions/show_medical_prescriptions.dart';
import 'package:pharma/presentation/pages/search/search_field.dart';
import '../pages/drugsandproduct/add_medicine_screen.dart';
import '../pages/drugsandproduct/add_product_screen.dart';
import '../pages/drugsandproduct/company_screen.dart';
import '../pages/drugsandproduct/product_type.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_floating_action_button.dart';
import '../widgets/shadowdown.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> medicine = [
    {
      "name": "Mina0",
      "image": "images/app/code1.png",
    },
    {
      "name": "Mina1",
      "image": "images/app/code1.png",
    },
    {
      "name": "Mina2",
      "image": "images/app/code1.png",
    },
    {
      "name": "Mina3",
      "image": "images/app/code1.png",
    },
    {
      "name": "Mina4",
      "image": "images/app/code1.png",
    },
    {
      "name": "Mina5",
      "image": "images/app/code1.png",
    },
    {
      "name": "Mina6",
      "image": "images/app/code1.png",
    },
    {
      "name": "Mina7",
      "image": "images/app/code1.png",
    },
    {
      "name": "Mina8",
      "image": "images/app/code1.png",
    },
    {
      "name": "Mina9",
      "image": "images/app/code1.png",
    },
  ];
  List<Map<String, dynamic>> productType = [
    {
      "name": "Baby Products",
      "image": "images/app/baby.png",
    },
    {
      "name": "Beauty products",
      "image": "images/app/beauty.png",
    },
    {
      "name": "Medical accessories",
      "image": "images/app/medical.png",
    },
  ];
  bool c = false;
  int counter = 9;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leadingWidth: 150,
          leading: Image.asset(
            "images/app/logo.png",
            fit: BoxFit.contain,
          ),
          preferredSize: const Size(1, 60),
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Image.asset(
                  'images/app/appBar.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          actions: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const ShowMedicalPrescriptions();
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.all_inbox_rounded,
                size: 27,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Saver();
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.assignment,
                size: 27,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18),
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
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFE0E0E0),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              c = false;
                            });
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: c == false
                                  ? const Color(0xFF3467D2)
                                  : const Color(0xFFE0E0E0),
                            ),
                            child: Center(
                              child: Text(
                                "Drugs",
                                style: GoogleFonts.lora(
                                  textStyle: TextStyle(
                                    fontSize: 19,
                                    color: c == false
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              c = true;
                            });
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: c == true
                                  ? const Color(0xFF3467D2)
                                  : const Color(0xFFE0E0E0),
                            ),
                            child: Center(
                              child: Text(
                                "Products",
                                style: GoogleFonts.lora(
                                  textStyle: TextStyle(
                                    fontSize: 19,
                                    color:
                                        c == true ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              c == false
                  ? Container(
                      padding: const EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: FadingScroller(
                        builder: (context, scrollController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: medicine.length,
                            itemBuilder: (context, index) {
                              if (index == medicine.length - 1) {
                                return ListView(
                                  shrinkWrap: true,
                                  children: [
                                    CompanyScreen(
                                      name: medicine[index]["name"],
                                      imageUrl: medicine[index]["image"],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                    ),
                                  ],
                                );
                              }
                              return CompanyScreen(
                                name: medicine[index]["name"],
                                imageUrl: medicine[index]["image"],
                              );
                            },
                          );
                        },
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: FadingScroller(
                        builder: (context, scrollController) =>
                            ListView.builder(
                          shrinkWrap: true,
                          itemCount: productType.length,
                          itemBuilder: (context, index) {
                            return ProductType(
                              name: productType[index]["name"],
                              imageUrl: productType[index]["image"],
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3467D2).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage("images/app/snack.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Choose what you want to add!",
                            style: GoogleFonts.lora(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const AddMedicineScreen();
                                  },
                                ),
                              );
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.medication,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Center(
                                      child: Text(
                                        "add a Medicine",
                                        style: GoogleFonts.lora(
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const AddProductScreen();
                                  },
                                ),
                              );
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.medical_services_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Center(
                                      child: Text(
                                        "add a Product",
                                        style: GoogleFonts.lora(
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          iconData: Icons.add,
        ),
      ),
    );
  }
}
