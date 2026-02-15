// ignore_for_file: unused_element, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_floating_action_button.dart';
import '../../widgets/shadowdown.dart';
import 'add_employee_page.dart';
import 'empolyee_details.dart';

class EmployeeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dummyData = [
    {
      'name': 'Mina Farhat ',
      'salary': 5000.0,
      'photo': 'images/app/mm.jpg',
      "Email": "mina@gmail.com",
      "Birth_Date": "2/5/1990",
      "CV":
          "/data/user/0/com.example.pharma/cache/file_picker/الخطوات الأولى في OneDrive.pdf",
    },
    {
      'name': 'Pew pew',
      'salary': 6000.0,
      'photo': 'images/app/appBar.png',
      "Email": "mina@gmail.com",
      "Birth_Date": "2/5/1990",
      "CV":
          "/data/user/0/com.example.pharma/cache/file_picker/الخطوات الأولى في OneDrive.pdf",
    },
    {
      'name': 'Pew pew',
      'salary': 6000.0,
      'photo': 'images/app/appBar.png',
      "Email": "mina@gmail.com",
      "Birth_Date": "2/5/1990",
      "CV":
          "/data/user/0/com.example.pharma/cache/file_picker/الخطوات الأولى في OneDrive.pdf",
    },
    {
      'name': 'Pew pew',
      'salary': 6000.0,
      'photo': 'images/app/appBar.png',
      "Email": "mina@gmail.com",
      "Birth_Date": "2/5/1990",
      "CV":
          "/data/user/0/com.example.pharma/cache/file_picker/الخطوات الأولى في OneDrive.pdf",
    },
    {
      'name': 'NN',
      'salary': 6000.0,
      'photo': 'images/app/appBar.png',
      "Email": "mina@gmail.com",
      "Birth_Date": "2/5/1990",
      "CV":
          "/data/user/0/com.example.pharma/cache/file_picker/الخطوات الأولى في OneDrive.pdf",
    },
    {
      'name': 'SS',
      'salary': 6000.0,
      'photo': 'images/app/appBar.png',
      "Email": "mina@gmail.com",
      "Birth_Date": "2/5/1990",
      "CV":
          "/data/user/0/com.example.pharma/cache/file_picker/الخطوات الأولى في OneDrive.pdf",
    },
    {
      'name': 'Hehe',
      'salary': 6000.0,
      'photo': 'images/app/appBar.png',
      "Email": "mina@gmail.com",
      "Birth_Date": "2/5/1990",
      "CV":
          "/data/user/0/com.example.pharma/cache/file_picker/الخطوات الأولى في OneDrive.pdf",
    },
    {
      'name': 'Pew pew',
      'salary': 6000.0,
      'photo': 'images/app/appBar.png',
      "Email": "mina@gmail.com",
      "Birth_Date": "2/5/1990",
      "CV":
          "/data/user/0/com.example.pharma/cache/file_picker/الخطوات الأولى في OneDrive.pdf",
    },
    {
      'name': 'Ahmad',
      'salary': 7000.0,
      'photo': 'images/app/appBar.png',
      "Email": "mina@gmail.com",
      "Birth_Date": "2/5/1990",
      "CV":
          "/data/user/0/com.example.pharma/cache/file_picker/الخطوات الأولى في OneDrive.pdf",
    },
  ];

  EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildListView(context),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const AddEmployeePage(),
                transitionsBuilder: (_, animation, __, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                        reverseCurve: Curves.easeInOut,
                      ),
                    ),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 700),
              ),
            );
          },
          iconData: Icons.person_add,
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Employees Page',
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
            padding: const EdgeInsets.only(top: 10),
            child: FadingScroller(builder: (context, scrollController) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView.builder(
                  itemCount: dummyData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EmployeeDetailsScreen(
                              image: dummyData[index]["photo"],
                              name: dummyData[index]["name"],
                              email: dummyData[index]["Email"],
                              salary: dummyData[index]["salary"],
                              birthDate: dummyData[index]["Birth_Date"],
                              cvPath: dummyData[index]["CV"],
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(dummyData[index]['photo']),
                        ),
                        title: Text(
                          dummyData[index]['name'],
                          style: GoogleFonts.lora(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          '${dummyData[index]['salary']} SY',
                          style: GoogleFonts.dancingScript(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: _buildPopupMenu(context, index),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  PopupMenuButton<String> _buildPopupMenu(BuildContext context, int index) {
    return PopupMenuButton<String>(
      surfaceTintColor: Colors.transparent,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      onSelected: (String choice) {
        if (choice == 'Delete') {
          showDeleteDialog(context, index);
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'Delete',
            child: Center(
              child: Text(
                'Delete',
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ];
      },
    );
  }

  void showDeleteDialog(BuildContext context, int index) {
    final String employeeName = dummyData[index]['name'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Delete Employee',
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF3467D2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Are you sure you want to delete $employeeName?',
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: []);
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: []);
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Delete',
                        style: GoogleFonts.lora(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.red.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
