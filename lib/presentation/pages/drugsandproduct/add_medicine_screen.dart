// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/medicine_switch.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _barcodeController = TextEditingController();

  final TextEditingController _tradeNameController = TextEditingController();

  final TextEditingController _combinationController = TextEditingController();

  final TextEditingController _caliberController = TextEditingController();

  final TextEditingController _pharmaceuticalFormController =
      TextEditingController();

  final TextEditingController _netPriceController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _productionDateController =
      TextEditingController();

  final TextEditingController _expirationDateController =
      TextEditingController();
  List<String> medicineTypes = [
    'Drink',
    'Tablets',
    'Capsules',
    'Effervescent',
  ];
  bool isAccepted = true;
  String? selectedType;
  final picker = ImagePicker();
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                        SystemChrome.setEnabledSystemUIMode(
                          SystemUiMode.manual,
                          overlays: [],
                        );
                        Navigator.pop(context);
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
                          left: MediaQuery.of(context).size.width * 0.01),
                      child: Text(
                        'Add Medicine',
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFF3467D2),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 55),
                    )
                  ],
                ),
              ),
              _buildRowNameAndIcon(Icons.image, 'Medicine photo', 15, 8),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: _buildImageContainer(),
              ),
              _buildRowNameAndIcon(Icons.type_specimen_outlined, 'Type', 10, 8),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: _buildListViewTypes(),
              ),
              _buildRowNameAndIcon(Icons.barcode_reader, 'Barcode', 10, 8),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: _buildBarcodeTextFormField(
                  controller: _barcodeController,
                  labelText: 'Barcode',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the barcode';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: _buildRowNameAndIcon(
                          Icons.vaccines_rounded, 'TradeName', 10, 8)),
                  Flexible(
                    flex: 1,
                    child: _buildRowNameAndIcon(
                        Icons.diversity_2_rounded, 'Combination', 10, 17),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Flexible(
                        child: _buildTextFormField(
                      controller: _tradeNameController,
                      labelText: 'TradeName',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the trade name';
                        }
                        return null;
                      },
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                        flex: 1,
                        child: _buildTextFormField(
                          controller: _combinationController,
                          labelText: 'Combination',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the combination';
                            }
                            return null;
                          },
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: _buildRowNameAndIcon(
                        Icons.gesture_rounded, 'Caliber', 10, 8),
                  ),
                  Flexible(
                    child: _buildRowNameAndIcon(
                        Icons.healing_rounded, 'Ph.Form', 10, 17),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Flexible(
                      child: _buildTextFormField(
                        controller: _caliberController,
                        labelText: 'Caliber',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the caliber';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                        flex: 1,
                        child: _buildTextFormField(
                          controller: _pharmaceuticalFormController,
                          labelText: 'Pharmaceutical Form',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the pharmaceutical form';
                            }
                            return null;
                          },
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: _buildRowNameAndIcon(
                        Icons.attach_money_rounded, 'Net Price', 10, 8),
                  ),
                  Flexible(
                    flex: 1,
                    child: _buildRowNameAndIcon(
                        Icons.inventory_2_rounded, 'Amount', 10, 17),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Flexible(
                        child: _buildTextFormField(
                      controller: _netPriceController,
                      labelText: 'Net Price',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the net price';
                        }
                        return null;
                      },
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                        flex: 1,
                        child: _buildTextFormField(
                          controller: _amountController,
                          labelText: 'Amount',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the amount';
                            }
                            return null;
                          },
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: _buildRowNameAndIcon(
                        Icons.date_range, 'Production Date', 10, 8),
                  ),
                  Flexible(
                    flex: 1,
                    child: _buildRowNameAndIcon(
                        Icons.date_range, 'Expiration Date', 10, 17),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: _buildDatePickerTextFormField(
                        controller: _productionDateController,
                        labelText: 'Production Date',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select the production date';
                          }
                          return null;
                        },
                        context: context,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: _buildDatePickerTextFormField(
                        controller: _expirationDateController,
                        labelText: 'Expiration Date',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select the expiration date';
                          }
                          return null;
                        },
                        context: context,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    _buildRowNameAndIcon(
                        Icons.not_interested_rounded, 'Statement', 5, 8),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: MedicineSwitcher(
                        isAccepted: isAccepted,
                        onChanged: (newValue) {
                          setState(() {
                            isAccepted = newValue;
                          });
                        },
                        text: Text(
                          isAccepted ? 'Accepted' : 'Forbidden',
                          style: GoogleFonts.lora(
                            textStyle: TextStyle(
                              fontSize: 17,
                              color: isAccepted ? Colors.green : Colors.red,
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
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (_selectedImage == null) {
                        _showErrorMessage('Photo is required');
                      } else if (selectedType == null) {
                        _showErrorMessage('Type Medicine is Required');
                      } else {
                        double netPrice =
                            double.parse(_netPriceController.text);
                        int amount = int.parse(_netPriceController.text);
                        int isAcceptedValue = isAccepted ? 1 : 0;
                        DateTime productionDate =
                            DateTime.parse(_productionDateController.text);
                        DateTime ExpDate =
                            DateTime.parse(_expirationDateController.text);

                        // context.read<AddMedicineCubit>().emitAddMedicine(
                        //     AddMedicineParameters(
                        //         1,
                        //         _barcodeController.text,
                        //         _tradeNameController.text,
                        //         _combinationController.text,
                        //         _caliberController.text,
                        //         selectedType!,
                        //         _pharmaceuticalFormController.text,
                        //         netPrice,
                        //         amount,
                        //         isAcceptedValue,
                        //         _selectedImage!,
                        //         productionDate,
                        //         ExpDate));
                      }
                    }
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
                        'Add',
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListViewTypes() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: medicineTypes.length,
        itemBuilder: (BuildContext context, int index) {
          String type = medicineTypes[index];
          bool isSelected = type == selectedType;

          IconData? icon;
          Color backgroundColor = Colors.white;
          Color textColor = isSelected ? Colors.white : Colors.black;

          switch (type) {
            case 'Drink':
              icon = Icons.medication_liquid;
              backgroundColor = isSelected ? Colors.blue : Colors.white;
              break;
            case 'Tablets':
              icon = Icons.medical_services_sharp;
              backgroundColor = isSelected ? Colors.green : Colors.white;
              break;
            case 'Capsules':
              icon = Icons.medication_outlined;
              backgroundColor = isSelected ? Colors.orange : Colors.white;
              break;
            case 'Effervescent':
              icon = Icons.medical_services_rounded;
              backgroundColor = isSelected ? Colors.yellow : Colors.white;
              break;
            default:
              icon = null;
              break;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedType = isSelected ? null : type;
                });
              },
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: isSelected ? Colors.transparent : Colors.grey,
                    width: 2.0,
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon ?? Icons.category,
                      color: textColor,
                      size: 28.0,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      type,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 12),
      child: TextFormField(
        controller: controller,
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
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color(0xFF3467D2),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color(0xFF3467D2),
              width: 2.0,
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
          hintText: 'Enter $labelText',
          hintStyle: GoogleFonts.lora(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        keyboardType: keyboardType,
        onTap: onTap,
        textInputAction: textInputAction,
        validator: validator,
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
              backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
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

  Widget _buildDatePickerTextFormField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
    BuildContext? context,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 12),
      child: TextFormField(
        onEditingComplete: () {
          // Perform actions when "Done" is pressed
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: []);
          FocusScope.of(context!).unfocus();
        },
        style: GoogleFonts.lora(
          textStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
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
          hintText: 'Select $labelText',
          hintStyle: GoogleFonts.lora(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w600,
            ),
          ),
          suffixIcon: IconButton(
            color: const Color(0xFF3467D2),
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context!,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                initialDatePickerMode: DatePickerMode.year,
                initialEntryMode: DatePickerEntryMode.input,
              );

              if (pickedDate != null) {
                controller.text =
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              }
              SystemChrome.setEnabledSystemUIMode(
                SystemUiMode.manual,
                overlays: [],
              );
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ),
        keyboardType: keyboardType,
        onTap: onTap,
        textInputAction: textInputAction,
        validator: validator,
      ),
    );
  }

  Widget _buildBarcodeTextFormField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 10, right: 12),
      child: TextFormField(
        controller: controller,
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
        decoration: InputDecoration(
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
          hintText: 'Enter $labelText',
          hintStyle: GoogleFonts.lora(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w600,
            ),
          ),
          suffixIcon: IconButton(
            color: const Color(0xFF3467D2),
            onPressed: () async {
              // final result = await Navigator.push<String?>(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ScannerScreen(),
              //   ),
              // );

              // if (result != null) {
              //   controller.text = result;
              // }
            },
            icon: const Icon(Icons.qr_code_scanner),
          ),
        ),
        keyboardType: keyboardType,
        onTap: onTap,
        textInputAction: textInputAction,
        validator: validator,
      ),
    );
  }

  Widget _buildRowNameAndIcon(
      IconData icon, String name, double top, double left) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF3467D2),
            size: 30,
          ),
          const SizedBox(width: 5),
          Text(
            name,
            style: GoogleFonts.lora(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFF3467D2),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Widget _buildImageContainer() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.photo_library,
                      color: Color(0xFF3467D2),
                      size: 30,
                    ),
                    title: Text(
                      'Choose from Gallery',
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
                      Icons.camera_alt,
                      color: Color(0xFF3467D2),
                      size: 30,
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
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Container(
          height: 120,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: _selectedImage != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.file(
                    _selectedImage!,
                    fit: BoxFit.cover,
                  ),
                )
              : const Icon(
                  Icons.add_photo_alternate,
                  size: 40,
                  color: Color(0xFF3467D2),
                ),
        ),
      ),
    );
  }
}
