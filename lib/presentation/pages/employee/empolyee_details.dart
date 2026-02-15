// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_element, avoid_print, non_constant_identifier_names, unused_field, library_private_types_in_public_api, use_build_context_synchronously, deprecated_member_use

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pharma/presentation/pages/employee/show_cv_file.dart';
import 'show_employee_photo.dart';

// ignore: must_be_immutable
class EmployeeDetailsScreen extends StatefulWidget {
  String image;
  String name;
  String email;
  double salary;
  String birthDate;
  String cvPath;
  EmployeeDetailsScreen(
      {required this.image,
      required this.name,
      required this.email,
      required this.salary,
      required this.birthDate,
      required this.cvPath,
      super.key});

  @override
  _EmployeeDetailsScreenState createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  final bool _isEditMode = false;
  String selectedMonth = '';

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cvController = TextEditingController();
  final TextEditingController _dayWorkStartDateController =
      TextEditingController();
  final TextEditingController _MonthWorkStartDateController =
      TextEditingController();
  final TextEditingController _YearWorkStartDateController =
      TextEditingController();
  final TextEditingController _dayWorkEndDateController =
      TextEditingController();
  final TextEditingController _MonthWorkEndDateController =
      TextEditingController();
  final TextEditingController _YearWorkEndDateController =
      TextEditingController();
  final TextEditingController _SalaryController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  List<Map<String, dynamic>> months = [
    {
      "month": "January",
      "active": true,
    },
    {
      "month": 'February',
      "active": true,
    },
    {
      "month": 'March',
      "active": true,
    },
    {
      "month": 'April',
      "active": true,
    },
    {
      "month": 'May',
      "active": true,
    },
    {
      "month": 'June',
      "active": false,
    },
    {
      "month": 'July',
      "active": false,
    },
    {
      "month": 'August',
      "active": false,
    },
    {
      "month": 'September',
      "active": false,
    },
    {
      "month": 'October',
      "active": false,
    },
    {
      "month": 'November',
      "active": false,
    },
    {
      "month": 'December',
      "active": false,
    },
  ];
  // List<bool> monthCheckValues = List<bool>.filled(12, false);
  String _selectedImage = '';

  @override
  Widget build(BuildContext context) {
    Widget monthCheck(int index) {
      if (months[index]["active"] == false) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              months[index]["month"].toString(),
              style: GoogleFonts.dancingScript(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Checkbox(
              value: months[index]["active"],
              onChanged: (value) {
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
                              'Salary Giving',
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
                              "Enter The Salary you want to give to ${widget.name}:",
                              style: GoogleFonts.lora(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            _buildTextFormField(
                              controller: _SalaryController,
                              hintText: "Enter the Salary",
                              num: 8,
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              context: context,
                            ),
                            const SizedBox(height: 24.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
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
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      months[index]["active"] = value!;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Send',
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
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  months[index]["month"].toString(),
                  style: GoogleFonts.dancingScript(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.0025,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Checkbox(
              overlayColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
              value: months[index]["active"],
              onChanged: (value) {},
            ),
          ],
        );
      }
    }

    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFF3467D2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 25,
                                  color: Color(0xFF3467D2),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'The Employee',
                          style: GoogleFonts.lora(
                            textStyle: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            child: Center(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
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
                                                'Are you sure you want to delete ${widget.name}?',
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                    style: ButtonStyle(
                                                      overlayColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'Cancel',
                                                      style: GoogleFonts.lora(
                                                        textStyle:
                                                            const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12.0),
                                                  TextButton(
                                                    style: ButtonStyle(
                                                      overlayColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'Delete',
                                                      style: GoogleFonts.lora(
                                                        textStyle: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors
                                                              .red.shade600,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                },
                                child: const Icon(
                                  Icons.delete_forever_rounded,
                                  size: 30,
                                  color: Color(0xFF3467D2),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      _showImagePickerModal();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.8),
                          image: DecorationImage(
                            image: _selectedImage.isEmpty
                                ? AssetImage(widget.image)
                                : FileImage(File(_selectedImage))
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      //height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Text(
                          widget.name,
                          style: GoogleFonts.lora(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      //height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Text(
                          widget.birthDate,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lora(
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.7),
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
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white.withOpacity(0.9),
                ),
                child: Column(
                  children: [
                    _buildRowNameAndIcon(
                        Icons.accessibility_new_outlined, "About", 8, 40),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20.0,
                                          ),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "The Email:",
                                                style: GoogleFonts.lora(
                                                  textStyle: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16.0),
                                              Text(
                                                widget.email,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.lora(
                                                  textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey.shade700,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.email_rounded,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red.shade700,
                            ),
                            child: Center(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  if (widget.cvPath.endsWith('.pdf')) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return ShowCVFile(
                                          name: widget.name,
                                          filePath: widget.cvPath,
                                          add: false,
                                        );
                                      }),
                                    );
                                  }
                                },
                                child: Text(
                                  "PDF",
                                  style: GoogleFonts.lora(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.teal.shade500,
                            ),
                            child: Center(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20.0,
                                          ),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "The Salary:",
                                                style: GoogleFonts.lora(
                                                  textStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.teal.shade500,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16.0),
                                              Text(
                                                "${widget.salary.toString()} SY",
                                                style:
                                                    GoogleFonts.dancingScript(
                                                  textStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey.shade700,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.attach_money_rounded,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildRowNameAndIcon(
                      Icons.point_of_sale_rounded,
                      "Month Salary",
                      8,
                      40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              monthCheck(0),
                              monthCheck(1),
                              monthCheck(2),
                              monthCheck(3),
                              monthCheck(4),
                              monthCheck(5),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Column(
                            children: [
                              monthCheck(6),
                              monthCheck(7),
                              monthCheck(8),
                              monthCheck(9),
                              monthCheck(10),
                              monthCheck(11),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    double? num,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
    BuildContext? context,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: num!),
      child: Container(
        width: MediaQuery.of(context!).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.08,
        child: TextFormField(
          onEditingComplete: () {
            // Perform actions when "Done" is pressed
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: []);
            FocusScope.of(context).unfocus();
          },
          style: GoogleFonts.lora(
            textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          cursorColor: const Color(0xFF3467D2),
          cursorHeight: 25,
          enableSuggestions: true,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.lora(
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w600,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color(0xFF3467D2),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color(0xFF3467D2),
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color(0xFF3467D2),
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            suffix: Text(
              "SY",
              style: GoogleFonts.lora(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          keyboardType: keyboardType,
          onTap: onTap,
          textInputAction: textInputAction,
          validator: validator,
        ),
      ),
    );
  }

  void _showImagePickerModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.photo,
                size: 30,
                color: Color(0xFF3467D2),
              ),
              title: Text(
                'Show Photo',
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3467D2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ShowEmployeePhoto(
                        name: widget.name,
                        image: widget.image,
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_album_rounded,
                size: 30,
                color: Color(0xFF3467D2),
              ),
              title: Text(
                'Pick from Gallery',
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3467D2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_camera,
                size: 30,
                color: Color(0xFF3467D2),
              ),
              title: Text(
                'Take a Photo',
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3467D2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _pickImage(ImageSource source) async {
    final permissionStatus = await Permission.camera.request();
    if (permissionStatus.isGranted) {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = pickedImage.path;
        });
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      _showPermissionDialog(
        context,
        'Camera Permission',
        'Please enable camera permission in app settings to use this feature.',
        [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Open Settings'),
            onPressed: () {
              openAppSettings();
            },
          ),
        ],
      );
    } else {
      _showPermissionDialog(
        context,
        'Camera Permission',
        'Permission denied. Please grant camera permission to use this feature.',
        [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    }
  }

  void _showPermissionDialog(
    BuildContext context,
    String title,
    String message,
    List<Widget> actions,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: actions,
      ),
    );
  }

  void _pickCVFile() async {
    PermissionStatus permissionStatus = await Permission.storage.request();
    if (permissionStatus.isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        String filePath = file.path ?? '';
        _cvController.text = filePath;
      }
    } else {
      print('Permission not granted to access storage.');
    }
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
              size: 25,
            ),
          ),
          const SizedBox(
            width: 5,
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
