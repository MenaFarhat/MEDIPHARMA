// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/auth/second_sign_up_page.dart';

class FirstSignupScreen extends StatefulWidget {
  const FirstSignupScreen({super.key});

  @override
  _FirstSignupScreenState createState() => _FirstSignupScreenState();
}

class _FirstSignupScreenState extends State<FirstSignupScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _RegistrationNumberController =
      TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _MonthController = TextEditingController();
  final TextEditingController _YearController = TextEditingController();
  final TextEditingController _dayReleasedOnDateController =
      TextEditingController();
  final TextEditingController _MonthReleasedOnDateController =
      TextEditingController();
  final TextEditingController _YearReleasedOnDateController =
      TextEditingController();
  final TextEditingController _CityController = TextEditingController();
  final TextEditingController _RegionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _RegistrationNumberController.dispose();
    _dayController.dispose();
    _MonthController.dispose();
    _YearController.dispose();
    _dayReleasedOnDateController.dispose();
    _MonthReleasedOnDateController.dispose();
    _YearReleasedOnDateController.dispose();
    _CityController.dispose();
    _RegionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                        'Signup',
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
                          right: MediaQuery.of(context).size.width * 0.035),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => SecondSignUpPage(
                                      firstName: _firstNameController.text,
                                      middleName: _middleNameController.text,
                                      lastName: _lastNameController.text,
                                      city: _CityController.text,
                                      region: _RegionController.text,
                                      registrationDayDate: _dayController.text,
                                      registrationMonthDate:
                                          _MonthController.text,
                                      registrationYearDate:
                                          _YearController.text,
                                      registrationNumber: int.parse(
                                          _RegistrationNumberController.text),
                                      releasedOnDayDate:
                                          _dayReleasedOnDateController.text,
                                      releasedOnMonthDate:
                                          _MonthReleasedOnDateController.text,
                                      releasedOnYearDate:
                                          _YearReleasedOnDateController.text,
                                    )));
                          }
                        },
                        child: Text(
                          "Next",
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: 18,
                      child: Center(
                        child: Text(
                          "1",
                          style: GoogleFonts.dancingScript(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 5,
                      color: Colors.grey.shade300,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: 18,
                      child: Center(
                        child: Text(
                          "2",
                          style: GoogleFonts.dancingScript(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 5,
                      color: Colors.grey.shade300,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: 18,
                      child: Center(
                        child: Text(
                          "3",
                          style: GoogleFonts.dancingScript(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildRowNameAndIcon(
                  Icons.person_outline_outlined, 'Full Name', 8, 5),
              Column(
                children: [
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.08,
                    num: 5,
                    controller: _firstNameController,
                    hintText: 'First Name',
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name.';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.08,
                    num: 0,
                    controller: _middleNameController,
                    hintText: 'Middle Name',
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your middle name.';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.08,
                    num: 0,
                    controller: _lastNameController,
                    hintText: 'Last Name',
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              _buildRowNameAndIcon(
                  Icons.assignment, 'Registration Number', 8, 0),
              _buildTextFormField(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                num: 5,
                controller: _RegistrationNumberController,
                hintText: 'Registration Number',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your registration number.';
                  }
                  return null;
                },
              ),
              _buildRowNameAndIcon(
                  Icons.date_range_rounded, 'Registration Date', 8, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNumberTextField(
                    hintText: 'Day',
                    controller: _dayController,
                    numbers: List<int>.generate(31, (index) => index + 1),
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please select a day.';
                      }
                      int parsedValue = value;
                      if (parsedValue < 1 || parsedValue > 31) {
                        return 'Please select a valid day.';
                      }
                      return null;
                    },
                  ),
                  _buildNumberTextField(
                    hintText: 'Month',
                    controller: _MonthController,
                    numbers: List<int>.generate(12, (index) => index + 1),
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please select a month.';
                      }
                      int parsedValue = value;
                      if (parsedValue < 1 || parsedValue > 12) {
                        return 'Please select a valid month.';
                      }
                      return null;
                    },
                  ),
                  _buildNumberYearTextField(
                    hintText: 'Year',
                    controller: _YearController,
                    numbers: List<int>.generate(100, (index) => index),
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please select a year.';
                      }
                      int parsedValue = value;
                      int currentYear = DateTime.now().year;
                      if (parsedValue < currentYear - 100 ||
                          parsedValue > currentYear) {
                        return 'Please select a valid year.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              _buildRowNameAndIcon(
                  Icons.date_range_rounded, 'Released On Date', 8, 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNumberTextField(
                    hintText: 'Day',
                    controller: _dayReleasedOnDateController,
                    numbers: List<int>.generate(31, (index) => index + 1),
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please select a day.';
                      }
                      int parsedValue = value;
                      if (parsedValue < 1 || parsedValue > 31) {
                        return 'Please select a valid day.';
                      }
                      return null;
                    },
                  ),
                  _buildNumberTextField(
                    hintText: 'Month',
                    controller: _MonthReleasedOnDateController,
                    numbers: List<int>.generate(12, (index) => index + 1),
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please select a month.';
                      }
                      int parsedValue = value;
                      if (parsedValue < 1 || parsedValue > 12) {
                        return 'Please select a valid month.';
                      }
                      return null;
                    },
                  ),
                  _buildNumberYearTextField(
                    hintText: 'Year',
                    controller: _YearReleasedOnDateController,
                    numbers: List<int>.generate(100, (index) => index),
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please select a year.';
                      }
                      int parsedValue = value;
                      int currentYear = DateTime.now().year;
                      if (parsedValue < currentYear - 100 ||
                          parsedValue > currentYear) {
                        return 'Please select a valid year.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              _buildRowNameAndIcon(
                  Icons.location_city_outlined, 'City And Region', 8, 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.08,
                    num: 8,
                    controller: _CityController,
                    hintText: 'City',
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city.';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.08,
                    num: 8,
                    controller: _RegionController,
                    hintText: 'Region',
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your region.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberTextField({
    required String hintText,
    required TextEditingController controller,
    required List<int> numbers,
    String? Function(int?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 100,
        child: DropdownButtonFormField<int>(
          decoration: InputDecoration(
            hintText: hintText,
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
              vertical: 8.0,
              horizontal: 12.0,
            ),
            hintStyle: GoogleFonts.lora(
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          isExpanded: true,
          initialValue: int.tryParse(controller.text),
          items: numbers.map((number) {
            return DropdownMenuItem<int>(
              value: number,
              child: Container(
                alignment: Alignment.center,
                height:
                    30, // Set the desired height for the dropdown list items
                child: Text(
                  number.toString(),
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          selectedItemBuilder: (BuildContext context) {
            return numbers.map<Widget>((number) {
              return Container(
                alignment: Alignment.center,
                height: 30, // Set the desired height for the selected item
                child: Text(
                  number.toString(),
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList();
          },
          onChanged: (value) {
            controller.text = value.toString();
          },
          validator: validator,
          dropdownColor: Colors.white,
          menuMaxHeight: 150,
        ),
      ),
    );
  }

  Widget _buildNumberYearTextField({
    required String hintText,
    required TextEditingController controller,
    required List<int> numbers,
    String? Function(int?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 100,
        child: DropdownButtonFormField<int>(
          decoration: InputDecoration(
            hintText: hintText,
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
              vertical: 8.0,
              horizontal: 12.0,
            ),
            hintStyle: GoogleFonts.lora(
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          initialValue: int.tryParse(controller.text),
          items: numbers.map((number) {
            int year = DateTime.now().year - number;
            return DropdownMenuItem<int>(
              value: year,
              child: Container(
                alignment: Alignment.center,
                height:
                    30, // Set the desired height for the dropdown list items
                child: Text(
                  year.toString(),
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            controller.text = value.toString();
          },
          validator: validator,
          dropdownColor: Colors.white,
          menuMaxHeight: 150,
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
    double? width,
    double? height,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: num!),
      child: Container(
        width: width,
        height: height,
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
          ),
          keyboardType: keyboardType,
          onTap: onTap,
          textInputAction: textInputAction,
          validator: validator,
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
          const SizedBox(width: 5),
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
