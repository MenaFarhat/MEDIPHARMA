// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, use_build_context_synchronously, non_constant_identifier_names, avoid_print, deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'third_sign_up_page.dart';

// ignore: must_be_immutable
class SecondSignUpPage extends StatefulWidget {
  String? imageFilePath;

  final String firstName;
  final String middleName;
  final String lastName;
  final int registrationNumber;
  final String registrationDayDate;
  final String registrationMonthDate;
  final String registrationYearDate;
  final String releasedOnDayDate;
  final String releasedOnMonthDate;
  final String releasedOnYearDate;
  final String city;
  final String region;

  SecondSignUpPage({
    Key? key,
    this.imageFilePath,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.registrationNumber,
    required this.registrationDayDate,
    required this.registrationMonthDate,
    required this.registrationYearDate,
    required this.releasedOnDayDate,
    required this.releasedOnMonthDate,
    required this.releasedOnYearDate,
    required this.city,
    required this.region,
  }) : super(key: key);

  @override
  State<SecondSignUpPage> createState() => _SecondSignUpPageState();
}

class _SecondSignUpPageState extends State<SecondSignUpPage> {
  @override
  void initState() {
    super.initState();
    printData();
  }

  void printData() {
    print('First Name: ${widget.firstName}');
    print('Middle Name: ${widget.middleName}');
    print('Last Name: ${widget.lastName}');
    print('Registration Number: ${widget.registrationNumber}');
    print('Registration Day Date: ${widget.registrationDayDate}');
    print('Registration Month Date: ${widget.registrationMonthDate}');
    print('Registration Year Date: ${widget.registrationYearDate}');
    print('Released On Day Date: ${widget.releasedOnDayDate}');
    print('Released On Month Date: ${widget.releasedOnMonthDate}');
    print('Released On Year Date: ${widget.releasedOnYearDate}');
    print('City: ${widget.city}');
    print('Region: ${widget.region}');
  }

  final TextEditingController _NameOfThePharmacyController =
      TextEditingController();
  final TextEditingController _LandNumberController = TextEditingController();
  final TextEditingController _MobileNumberController = TextEditingController();
  final TextEditingController _FinancialFundController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? _image;
  final picker = ImagePicker();
  String _selectedImage = '';

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
                        right: MediaQuery.of(context).size.width * 0.045),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          if (_image == null) {
                            _showErrorMessage('Photo is required');
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ThirdSignUpPage(
                                firstName: widget.firstName,
                                middleName: widget.middleName,
                                lastName: widget.lastName,
                                registrationNumber: widget.registrationNumber,
                                registrationDayDate: widget.registrationDayDate,
                                registrationMonthDate:
                                    widget.registrationMonthDate,
                                registrationYearDate:
                                    widget.registrationYearDate,
                                releasedOnDayDate: widget.releasedOnDayDate,
                                releasedOnMonthDate: widget.releasedOnMonthDate,
                                releasedOnYearDate: widget.releasedOnYearDate,
                                city: widget.city,
                                region: widget.region,
                                copyOfCy: File(_selectedImage),
                                pharmacyName: _NameOfThePharmacyController.text,
                                landlineNumber:
                                    int.parse(_LandNumberController.text),
                                mobileNumber:
                                    int.parse(_MobileNumberController.text),
                                financialFund:
                                    double.parse(_FinancialFundController.text),
                              ),
                            ));
                          }
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
                    backgroundColor: const Color(0xFF3467D2),
                    radius: 18,
                    child: Center(
                      child: Text(
                        "1",
                        style: GoogleFonts.dancingScript(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 5,
                    color: const Color(0xFF3467D2),
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
                Icons.badge_outlined, 'Copy Of The Cyndicate Card', 8, 8),
            Center(child: _buildImageContainer()),
            _buildRowNameAndIcon(
                Icons.local_pharmacy_rounded, 'Name Of Pharmacy', 8, 5),
            _buildTextFormField(
              controller: _NameOfThePharmacyController,
              hintText: 'Pharmacy Name',
              num: 8,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name of pharmacy.';
                }
                return null;
              },
            ),
            _buildRowNameAndIcon(
                Icons.phone_enabled_rounded, 'Landline Number', 8, 0),
            _buildTextFormField(
              controller: _LandNumberController,
              num: 8,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              hintText: 'Enter Your Landline Number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your landline number.';
                }
                return null;
              },
            ),
            _buildRowNameAndIcon(
                Icons.phone_iphone_rounded, 'Mobile Number', 8, 0),
            _buildTextFormField(
              controller: _MobileNumberController,
              num: 8,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              hintText: 'Enter Your Mobile Number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your mobile number.';
                }
                return null;
              },
            ),
            _buildRowNameAndIcon(
                Icons.attach_money_rounded, 'Financial Fund', 8, 0),
            _buildTextFormField(
              controller: _FinancialFundController,
              num: 8,
              suffix: const Text(
                "SY",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3467D2),
                  fontFamilyFallback: ["Roboto-Bold.ttf"],
                ),
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.go,
              hintText: 'Enter The Number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your financial fund.';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    ));
  }

  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Error',
          style: GoogleFonts.lora(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        content: Text(
          message,
          style: GoogleFonts.lora(
            textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: Text(
              'OK',
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
    );
  }

  Widget _buildImageContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFF3467D2),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF3467D2),
              const Color(0xFF3467D2).withOpacity(0.6),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              if (_selectedImage.isNotEmpty)
                Positioned.fill(
                  child: Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  ),
                )
              else
                Positioned.fill(
                  child: Image.asset(
                    "images/app/card.png",
                    fit: BoxFit.fill,
                  ),
                ),
              Positioned(
                right: 3,
                bottom: 3,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: _buildPhotoIconButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoIconButton() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(
          Icons.add_a_photo_rounded,
          size: 30,
          color: Color(0xFF3467D2),
        ),
        onPressed: () {
          _showImagePickerModal();
        },
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    double? num,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    Widget? suffix,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: num!),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
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
            suffix: suffix,
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
                Icons.photo_library,
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
          _image = File(pickedImage.path);
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
