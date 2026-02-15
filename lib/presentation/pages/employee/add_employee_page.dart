// ignore_for_file: use_build_context_synchronously, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, deprecated_member_use

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/presentation/pages/employee/show_cv_file.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  String _selectedImage = '';
  // ignore: unused_field
  File? _image;
  String filePath = "";

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _cvLinkController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool hasFile = filePath.isNotEmpty;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
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
                          left: MediaQuery.of(context).size.width * 0.17),
                      child: Text(
                        'Add Employee',
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
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 80.0,
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
              _buildRowNameAndIcon(Icons.person, 'Full Name', 8, 5),
              Column(
                children: [
                  _buildTextFormField(
                    controller: _firstNameController,
                    hintText: 'First Name',
                    num: 8,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please enter a first name.';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    controller: _lastNameController,
                    hintText: 'Last Name',
                    num: 0,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please enter a last name.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              _buildRowNameAndIcon(Icons.email_rounded, 'Email', 8, 0),
              _buildTextFormField(
                controller: _emailController,
                hintText: 'Email',
                num: 8,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email.';
                  }
                  if (!value.contains('@')) {
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              _buildRowNameAndIcon(Icons.calendar_today_rounded, 'Date', 8, 0),
              _buildDateTextField(
                icon: Icons.calendar_month,
                controller: _birthDateController,
                hintText: 'Birth Date',
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  final DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    initialDatePickerMode: DatePickerMode.year,
                    initialEntryMode: DatePickerEntryMode.input,
                  );
                  if (date != null) {
                    _birthDateController.text =
                        "${date.day}/${date.month}/${date.year}";
                  }
                  SystemChrome.setEnabledSystemUIMode(
                    SystemUiMode.manual,
                    overlays: [],
                  );
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Birth Date .';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRowNameAndIcon(Icons.file_present_rounded, 'Cv', 8, 0),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (!hasFile) {
                          await _pickCVFile();
                        } else {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: const Icon(
                                      Icons.file_open_rounded,
                                      size: 30,
                                      color: Color(0xFF3467D2),
                                    ),
                                    title: Text(
                                      'Show The CV File',
                                      style: GoogleFonts.lora(
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF3467D2),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      print(filePath);
                                      if (filePath.endsWith('.pdf')) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return ShowCVFile(
                                              name: "The CV File",
                                              filePath: filePath,
                                              add: true,
                                            );
                                          }),
                                        );
                                      }
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                      Icons.file_upload_rounded,
                                      size: 30,
                                      color: Color(0xFF3467D2),
                                    ),
                                    title: Text(
                                      'Replace The CV File',
                                      style: GoogleFonts.lora(
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF3467D2),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      _pickCVFile();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red.shade600,
                        ),
                        child: const Center(
                          child: Text(
                            "PDF",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamilyFallback: ["Roboto-Bold.ttf"],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
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
                      'Send',
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

  Future<void> _pickCVFile() async {
    PermissionStatus permissionStatus = await Permission.storage.request();
    if (permissionStatus.isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          filePath = file.path!;
          _cvLinkController.text = filePath;
        });
      }
    } else {
      print('Permission not granted to access storage.');
    }
  }

  // ignore: unused_element
  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Error',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: const Text(
              'OK',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
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

  Widget _buildDateTextField({
    required TextEditingController controller,
    required String hintText,
    required VoidCallback onTap,
    String? Function(String?)? validator,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
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
          readOnly: true,
          onTap: onTap,
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
            suffixIcon: IconButton(
              icon: Icon(
                icon,
                color: const Color(0xFF3467D2),
              ),
              onPressed: onTap,
            ),
          ),
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
}
