// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_appbar.dart';

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({super.key});

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  bool isPhotoVisible = true;
  var formkey = GlobalKey<FormState>();
  FocusNode? pin2FocusNode;

  FocusNode? pin3FocusNode;

  FocusNode? pin4FocusNode;

  var pin1Controller = TextEditingController();

  var pin2Controller = TextEditingController();

  var pin3Controller = TextEditingController();

  var pin4Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.7,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25, top: 15),
          child: Text(
            'Verification Code',
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
              "images/app/code2.png",
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "OTP Verification",
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFF3467D2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    "Enter the verification code we just sent on \nyour email address",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lora(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: _buildPinCodeFields(context),
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
                  width: MediaQuery.of(context).size.width * 0.71,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF3467D2),
                  ),
                  child: Center(
                    child: Text(
                      'Verify',
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
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.17,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFFEFF2F5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6), // Shadow color
                offset: const Offset(0, 3), // Offset in x and y direction
                blurRadius: 5, // Blur radius
                spreadRadius: 0, // Spread radius
              ),
            ],
          ),
          child: TextFormField(
            onEditingComplete: () {
              // Perform actions when "Done" is pressed
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                  overlays: []);
              FocusScope.of(context).unfocus();
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1), // Limit to 1 digit
            ],
            autofocus: true,
            controller: pin1Controller,
            textAlign: TextAlign.center,
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              hintText: '*',
              hintStyle: GoogleFonts.lora(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            onChanged: (value) {
              nextField(value, pin2FocusNode);
            },
            keyboardType: const TextInputType.numberWithOptions(),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.17,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFFEFF2F5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6), // Shadow color
                offset: const Offset(0, 3), // Offset in x and y direction
                blurRadius: 5, // Blur radius
                spreadRadius: 0, // Spread radius
              ),
            ],
          ),
          child: TextFormField(
            onEditingComplete: () {
              // Perform actions when "Done" is pressed
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                  overlays: []);
              FocusScope.of(context).unfocus();
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1), // Limit to 1 digit
            ],
            controller: pin2Controller,
            focusNode: pin2FocusNode,
            textAlign: TextAlign.center,
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              hintText: '*',
              hintStyle: GoogleFonts.lora(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            onChanged: (value) {
              nextField(value, pin3FocusNode);
            },
            keyboardType: const TextInputType.numberWithOptions(),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.17,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFFEFF2F5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6), // Shadow color
                offset: const Offset(0, 3), // Offset in x and y direction
                blurRadius: 5, // Blur radius
                spreadRadius: 0, // Spread radius
              ),
            ],
          ),
          child: TextFormField(
            onEditingComplete: () {
              // Perform actions when "Done" is pressed
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                  overlays: []);
              FocusScope.of(context).unfocus();
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1), // Limit to 1 digit
            ],
            controller: pin3Controller,
            focusNode: pin3FocusNode,
            textAlign: TextAlign.center,
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              hintText: '*',
              hintStyle: GoogleFonts.lora(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            onChanged: (value) {
              nextField(value, pin4FocusNode);
            },
            keyboardType: const TextInputType.numberWithOptions(),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.17,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFFEFF2F5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6), // Shadow color
                offset: const Offset(0, 3), // Offset in x and y direction
                blurRadius: 5, // Blur radius
                spreadRadius: 0, // Spread radius
              ),
            ],
          ),
          child: TextFormField(
            onEditingComplete: () {
              // Perform actions when "Done" is pressed
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                  overlays: []);
              FocusScope.of(context).unfocus();
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1), // Limit to 1 digit
            ],
            controller: pin4Controller,
            focusNode: pin4FocusNode,
            textAlign: TextAlign.center,
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              hintText: '*',
              hintStyle: GoogleFonts.lora(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.length == 1) {
                pin4FocusNode!.unfocus();
                // Then you need to check is the code is correct or not
              }
            },
            keyboardType: const TextInputType.numberWithOptions(),
          ),
        ),
      ],
    );
  }
}
