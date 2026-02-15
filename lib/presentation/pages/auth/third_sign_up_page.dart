// ignore_for_file: unused_element, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, use_build_context_synchronously, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

//import '../../../domain/params/sign_up_parameters.dart';
//import '../../manager/sign_up_pharmacy_cubit.dart';

class ThirdSignUpPage extends StatefulWidget {
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
  final File copyOfCy;
  final String pharmacyName;
  final int landlineNumber;
  final int mobileNumber;
  final double financialFund;
  const ThirdSignUpPage({
    Key? key,
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
    required this.copyOfCy,
    required this.pharmacyName,
    required this.landlineNumber,
    required this.mobileNumber,
    required this.financialFund,
  }) : super(key: key);
  @override
  State<ThirdSignUpPage> createState() => _ThirdSignUpPageState();
}

class _ThirdSignUpPageState extends State<ThirdSignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

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
                        right: MediaQuery.of(context).size.width * 0.4),
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
                    backgroundColor: const Color(0xFF3467D2),
                    radius: 18,
                    child: Center(
                      child: Text(
                        "2",
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
                        "3",
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
                ],
              ),
            ),
            _buildRowNameAndIcon(Icons.photo, 'Pharmacy Photo', 8, 5),
            _buildImageContainer(),
            _buildRowNameAndIcon(Icons.email_rounded, 'Email', 8, 5),
            _buildTextFormField(
              controller: _emailController,
              hintText: 'Enter Your Email',
              num: 8,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email.';
                }
                if (!value.contains('@gmail.com')) {
                  return 'Invalid email';
                }
                return null;
              },
            ),
            _buildRowNameAndIcon(Icons.lock, 'Password', 8, 5),
            _buildTextFormField(
              controller: _passwordController,
              hintText: 'Enter Your Password',
              num: 8,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password.';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              showObscureButton: true,
            ),
            _buildRowNameAndIcon(Icons.lock, 'Confirm Password', 8, 5),
            _buildTextFormField(
              controller: _confirmPasswordController,
              hintText: 'Enter The Confirm Password',
              num: 8,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your confirm password.';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match.';
                }
                return null;
              },
              showObscureButton: true,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width * 0.81,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF3467D2),
                ),
                child: Center(
                  child: Text(
                    'SignUp',
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
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
          borderRadius: BorderRadius.circular(15),
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
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Image.asset(
                            "images/app/cover.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Center(
                          child: Image.asset(
                            "images/app/snack.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
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

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    double? num,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
    bool showObscureButton = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: num!),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.055,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            suffixIcon: showObscureButton
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        if (controller == _passwordController) {
                          isPasswordVisible = !isPasswordVisible;
                        } else if (controller == _confirmPasswordController) {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        }
                      });
                    },
                    icon: Icon(
                      controller == _passwordController
                          ? isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off
                          : isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                      color: const Color(0xFF3467D2),
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
          ),
          keyboardType: keyboardType,
          onTap: onTap,
          textInputAction: textInputAction,
          validator: validator,
          obscureText: showObscureButton
              ? (controller == _passwordController
                  ? !isPasswordVisible
                  : !isConfirmPasswordVisible)
              : false,
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
          print('_selectedImage: $_selectedImage');
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
