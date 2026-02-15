// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'listofsalesproducts.dart';

class SearchByDateSales extends StatefulWidget {
  const SearchByDateSales({super.key});

  @override
  State<SearchByDateSales> createState() => _SearchByDateSalesState();
}

class _SearchByDateSalesState extends State<SearchByDateSales> {
  late DateTime date = DateTime.now();
  double totalPrice = 150.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                  Text(
                    'Search',
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
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        date = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          initialDatePickerMode: DatePickerMode.year,
                          initialEntryMode: DatePickerEntryMode.input,
                        ))!;
                        SystemChrome.setEnabledSystemUIMode(
                          SystemUiMode.manual,
                          overlays: [],
                        );
                      },
                      child: const Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xFF3467D2),
                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300.withOpacity(0.5),
                ),
                child: Center(
                  child: Text(
                    "${date.day}/${date.month}/${date.year}",
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
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ListOfSalesProducts(
                                date: "${date.day}/${date.month}/${date.year}",
                                totalPrice: totalPrice);
                          },
                        ),
                      );
                    },
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
                              "${date.day}/${date.month}/${date.year}",
                              style: GoogleFonts.lora(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                "${totalPrice.toString()} by thousand SY",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
