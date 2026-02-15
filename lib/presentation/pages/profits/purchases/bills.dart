import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/profits/purchases/search_bydate_purchases.dart';
import 'adding_bill/add_bill.dart';
import 'listofbill.dart';

class Bills extends StatefulWidget {
  const Bills({super.key});

  @override
  State<Bills> createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  List<Map<String, dynamic>> data = [
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 10000.30,
      "Description":
          "This is for products I know khgkggkhgkjgkjkgjhghjghghjvvjgjvjv jhfjhgjhgjh hgkg jkNSLkdjalkjflknb bdhbfks kjbkjsdf kjhkjahskfjhkjahjf kjhsajfhka jkjhakfs  kguiu iugiuys uyIUDOadyu aHDGhadgu bjc",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 30.30,
      "Description": "This is for products I know",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 30.30,
      "Description": "This is for products I know",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 30.30,
      "Description": "This is for products I know",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 200.30,
      "Description": "This is for products I know",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 30.30,
      "Description": "This is for products I know",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 30.30,
      "Description": "This is for products I know",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 30.30,
      "Description": "This is for products I know",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 30.30,
      "Description": "This is for products I know",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 30.30,
      "Description": "This is for products I know",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 30.30,
      "Description":
          "This is for products I know hshgakjfkja abskjfkha lkj;KDJ;/ JHAFJHSAHF HAOSUHF hsdfh jhaf",
      "Storage House Name": "Mina ff",
    },
    {
      "date": "10/1/2022",
      "image": "images/app/mm.jpg",
      "totalPrice": 30.30,
      "Description":
          "This is for products I know jakjfas kdjahkd nBZKJChakjahhjahFKALKFH JASKJFH JKAJHKSJHF ",
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
                          left: MediaQuery.of(context).size.width * 0.11),
                      child: Text(
                        'Purchases',
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
                          right: MediaQuery.of(context).size.width * 0.045),
                      child: Row(
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SearchByDatePurchases();
                                  },
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.search,
                              size: 30,
                              color: Color(0xFF3467D2),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const AddingBill();
                                  },
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.add,
                              size: 35,
                              color: Color(0xFF3467D2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.94,
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    // mainAxisSpacing: 2,
                    childAspectRatio: 0.75,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListOfBill(
                      date: data[index]["date"],
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
