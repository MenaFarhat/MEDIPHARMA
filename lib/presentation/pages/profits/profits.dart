// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/profits/purchases/bills.dart';
import 'package:pharma/presentation/pages/profits/sales/showsales.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Profits extends StatefulWidget {
  const Profits({super.key});

  @override
  State<Profits> createState() => _ProfitsState();
}

class _ProfitsState extends State<Profits> {
  double treausy = 55.66;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'Accounting',
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      color: Color(0xFF3467D2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              _buildRowNameAndIcon(
                  Icons.bar_chart_sharp, "Earnings Chart", 8, 20),
              Container(
                padding: const EdgeInsets.only(left: 5, top: 10),
                height: MediaQuery.of(context).size.height * 0.45,
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(
                          // Bind data source
                          color: const Color(0xFF3467D2),
                          dataSource: <SalesData>[
                            SalesData('Sat', 20),
                            SalesData('Sun', 30),
                            SalesData('Mon', 40),
                            SalesData('Tus', 30),
                            SalesData('Wen', 50),
                            SalesData('Thr', 90),
                            SalesData('Fri', 20),
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales,)
                    ]),
              ),
              _buildRowNameAndIcon(Icons.savings, "Treasury", 8, 5),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "you have in your Treasury a ",
                      style: GoogleFonts.lora(
                        textStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      treausy.toString(),
                      style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF3467D2),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      " by thousand SY",
                      style: GoogleFonts.lora(
                        textStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildRowNameAndIcon(
                  Icons.point_of_sale_rounded, "Sales&Purchases", 8, 15),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const ShowSales();
                            },
                          ),
                        );
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade300.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            "Show Sales",
                            style: GoogleFonts.lora(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF3467D2),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const Bills();
                            },
                          ),
                        );
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade300.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            "Show Purchases",
                            style: GoogleFonts.lora(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF3467D2),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.058,
              ),
              Text(
                "these Accounting depend on you!",
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowNameAndIcon(
      IconData icon, String name, double left, double top) {
    return Padding(
      padding: EdgeInsets.only(left: left, top: top),
      child: Row(
        children: [
          Container(
            child: Icon(
              icon,
              color: const Color(0xFF3467D2),
              size: 30,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              name,
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF3467D2),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
