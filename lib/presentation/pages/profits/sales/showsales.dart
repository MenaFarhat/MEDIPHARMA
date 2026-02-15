import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/profits/sales/listofdatesales.dart';
import 'package:pharma/presentation/pages/profits/sales/search_bydate_sales.dart';

class ShowSales extends StatefulWidget {
  const ShowSales({super.key});

  @override
  State<ShowSales> createState() => _ShowSalesState();
}

class _ShowSalesState extends State<ShowSales> {
  List<Map<String, dynamic>> data = [
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
    },
    {
      "date": "10/1/2022",
      "totalPrice": 30.30,
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
                          left: MediaQuery.of(context).size.width * 0.015),
                      child: Text(
                        'Sales',
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
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const SearchByDateSales();
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
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.95,
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
                    return ListOfDateSales(
                      date: data[index]["date"],
                      totalPrice: data[index]["totalPrice"],
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
