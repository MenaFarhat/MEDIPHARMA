// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/drugsandproduct/saver.dart';

// ignore: must_be_immutable
class AddQuantity extends StatefulWidget {
  bool statement;
  int quantity;
  AddQuantity({required this.quantity, required this.statement, super.key});

  @override
  State<AddQuantity> createState() => _AddQuantityState();
}

class _AddQuantityState extends State<AddQuantity> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            _buildRowNameAndIcon(Icons.credit_card, 'The Quantity', 8, 8),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: _buildTextFormField(
                keyboardType: TextInputType.number,
                context: context,
                textInputAction: TextInputAction.go,
                hintText: 'Enter The Quantity',
                validator: (value) {
                  if (int.parse(value!) > widget.quantity) {
                    return 'Please enter a vallid quantity.';
                  } else if (value.isEmpty) {
                    "please emter the Quantity";
                  }
                  return null;
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Saver();
                    },
                  ),
                );
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xFF3467D2),
                ),
                child: Center(
                  child: Text(
                    "Send",
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
    );
  }

  Widget _buildTextFormField({
    TextEditingController? controller,
    required String hintText,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    required BuildContext? context,
    Widget? suffix,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
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

  Widget _buildRowNameAndIcon(
      IconData icon, String name, double left, double top) {
    return Padding(
      padding: EdgeInsets.only(left: left, top: top),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF3467D2),
            size: 30,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, left: 3),
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
