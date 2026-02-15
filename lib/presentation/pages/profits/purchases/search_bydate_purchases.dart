// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_bydatebill_component.dart';

class SearchByDatePurchases extends StatefulWidget {
  const SearchByDatePurchases({super.key});

  @override
  State<SearchByDatePurchases> createState() => _SearchByDatePurchasesState();
}

class _SearchByDatePurchasesState extends State<SearchByDatePurchases> {
  late DateTime date = DateTime.now();
  List<Map<String, dynamic>> data = [
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 300.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "image": "images/app/mm.jpg",
      "totalPrice": 500.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
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
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.87,
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 6 / 7,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SearchByDateBillComponent(
                      date: "${date.day}/${date.month}/${date.year}",
                      image: data[index]["image"],
                      totalPrice: data[index]["totalPrice"],
                      description: data[index]["Description"],
                      storageHouseName: data[index]["Storage House Name"],
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
