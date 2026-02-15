// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pharma/presentation/pages/profits/purchases/adding_bill/products_of_bill.dart';

class AddingBill extends StatefulWidget {
  const AddingBill({super.key});

  @override
  State<AddingBill> createState() => _AddingBillState();
}

class _AddingBillState extends State<AddingBill> {
  TextEditingController imageUrlController = TextEditingController();

  String _selectedImage = '';
  File? image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: Text(
                        'New Bill',
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
                          right: MediaQuery.of(context).size.width * 0.06),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const ProductsOfBill();
                              },
                            ),
                          );
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
              _buildRowNameAndIcon(
                  Icons.photo_filter_rounded, "Bill's Photo", 8, 15),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 5),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xFF3467D2),
                        image: DecorationImage(
                          image: _selectedImage.isEmpty
                              ? const AssetImage("images/app/mm.jpg")
                              : FileImage(File(_selectedImage))
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.black12.withOpacity(0.3),
                      ),
                      child: InkWell(
                        onTap: () {
                          _showImagePickerModal();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Center(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor:
                                Colors.grey.shade300.withOpacity(0.5),
                            child: const Center(
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Color(0xFF3467D2),
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildRowNameAndIcon(Icons.store_mall_directory_rounded,
                  "Storage-House Name", 8, 10),
              _buildTextFormField(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.06,
                num: 8,
                hintText: "Enter Storage-House Name",
              ),
              _buildRowNameAndIcon(Icons.wallet_rounded, "Price of Bill", 8, 2),
              _buildTextFormField(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.06,
                num: 8,
                hintText: "Enter Total Price",
                keyboardType: const TextInputType.numberWithOptions(),
                suffix: const Text(
                  "SY",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3467D2),
                    fontFamilyFallback: ["Roboto-Bold.ttf"],
                  ),
                ),
              ),
              _buildRowNameAndIcon(
                  Icons.description_rounded, "Description", 8, 2),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.27,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey.shade300.withOpacity(0.5),
                  ),
                  child: TextFormField(
                    maxLines: 15,
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
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Enter Description",
                      alignLabelWithHint: true,
                      hintStyle: GoogleFonts.lora(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
           
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    TextEditingController? controller,
    required String hintText,
    double? num,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
    double? width,
    double? height,
    Widget? suffix,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: num!),
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
          image = File(pickedImage.path);
          _selectedImage = pickedImage.path;
        });
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // ignore: use_build_context_synchronously
      _showPermissionDialog(
        // ignore: use_build_context_synchronously
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
      // ignore: use_build_context_synchronously
      _showPermissionDialog(
        // ignore: use_build_context_synchronously
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
