// ignore_for_file: use_build_context_synchronously, unused_element, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, unused_element_parameter, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _imageUrlController = TextEditingController();

  String _selectedImage = '';

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
                          left: MediaQuery.of(context).size.width * 0.015),
                      child: Text(
                        'Edit-Profile',
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
                        onTap: () {},
                        child: const Icon(
                          Icons.check_rounded,
                          size: 30,
                          color: Color(0xFF3467D2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey.shade300.withOpacity(0.5),
                      backgroundImage: _selectedImage.isNotEmpty
                          ? FileImage(File(_selectedImage)) as ImageProvider
                          : _imageUrlController.text.isNotEmpty
                              ? NetworkImage(_imageUrlController.text)
                              : null,
                      child: _selectedImage.isEmpty &&
                              _imageUrlController.text.isEmpty
                          ? const Icon(
                              Icons.person,
                              size: 64.0,
                            )
                          : null,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300.withOpacity(0.5),
                      ),
                      child: IconButton(
                        onPressed: _showImagePickerModal,
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Color(0xFF3467D2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildRowNameAndIcon(
                  Icons.local_pharmacy_rounded, "Name Of Pharmacy", 8, 5),
              _buildTextFormField(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                hintText: "MinaPharmacy",
                isEnabled: true,
                num: 8,
              ),
              _buildRowNameAndIcon(Icons.person, 'The Owner', 8, 0),
              _buildTextFormField(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                hintText: "Mina Zead Farhat",
                isEnabled: false,
                num: 8,
                suffixIcon: const Icon(
                  Icons.lock_rounded,
                  color: Color(0xFF3467D2),
                ),
              ),
              _buildRowNameAndIcon(Icons.email_rounded, "Email", 8, 0),
              _buildTextFormField(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                hintText: "Mina.farhat333@gmail.com",
                isEnabled: false,
                num: 8,
                suffixIcon: const Icon(
                  Icons.lock_rounded,
                  color: Color(0xFF3467D2),
                ),
              ),
              _buildRowNameAndIcon(
                  Icons.location_city_outlined, 'City And Region', 8, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.08,
                    isEnabled: true,
                    num: 8,
                    hintText: 'Damascuse',
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
                    isEnabled: true,
                    num: 8,
                    hintText: 'Bab-Toma',
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
              _buildRowNameAndIcon(Icons.phone_enabled_rounded,
                  'Landline and Mobile Number', 8, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.08,
                    isEnabled: true,
                    num: 8,
                    hintText: '4711919',
                    keyboardType: TextInputType.phone,
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
                    isEnabled: true,
                    num: 8,
                    hintText: '0937956046',
                    keyboardType: TextInputType.phone,
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

  Widget _buildTextFormField({
    TextEditingController? controller,
    required String hintText,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
    bool? isEnabled,
    String? initialValue,
    double? num,
    double? width,
    double? height,
    Widget? suffixIcon,
  }) {
    // controller!.text = initialValue ?? '';

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
              enabled: isEnabled!,
              hintStyle: GoogleFonts.lora(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              suffixIcon: suffixIcon),
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
