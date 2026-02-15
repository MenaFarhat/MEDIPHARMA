// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/auth/log_in_page.dart';

import '../../widgets/custom_appbar.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  bool isPhotoVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.7,
        // ignore: prefer_const_constructors
        leading: Padding(
          padding: const EdgeInsets.only(left: 25, top: 15),
          child: Text(
            'Reset Password',
            style: GoogleFonts.lora(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.5),
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "images/app/code3.png",
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
      body: NotificationListener(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              isPhotoVisible = scrollNotification.metrics.pixels < 20;
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _buildRowNameAndIcon(Icons.lock, 'Password', 8, 20),
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return  LogInPage(showButton: false,);
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.81,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF3467D2),
                    ),
                    child: Center(
                      child: Text(
                        'Reset Password',
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
          ),
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
    bool showObscureButton = false,
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
