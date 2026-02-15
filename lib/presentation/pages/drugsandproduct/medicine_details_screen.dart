// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pharma/presentation/pages/drugsandproduct/saver.dart';
import 'package:pharma/presentation/pages/drugsandproduct/show_product_photo.dart';

import '../search/search_field.dart';

class MedicineDetailsScreen extends StatefulWidget {
  final String tradeName;
  final String combination;
  final String caliber;
  final String type;
  final String pharmaceuticalForm;
  final double netPrice;
  final double commonPrice;
  final int amount;
  final bool statement;
  final String imageUrl;
  final DateTime productDate;
  final DateTime expDate;

  const MedicineDetailsScreen({
    super.key,
    required this.tradeName,
    required this.combination,
    required this.caliber,
    required this.type,
    required this.pharmaceuticalForm,
    required this.netPrice,
    required this.commonPrice,
    required this.amount,
    required this.statement,
    required this.imageUrl,
    required this.productDate,
    required this.expDate,
  });

  @override
  State<MedicineDetailsScreen> createState() => _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends State<MedicineDetailsScreen>
    with SingleTickerProviderStateMixin {
  double _imageHeight = 300;
  final picker = ImagePicker();
  File? _selectedImage;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _idNumber = TextEditingController();
  final TextEditingController _editPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: _imageHeight,
              child: Stack(
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ShowProductPhoto(
                              image: widget.imageUrl,
                              name: widget.tradeName,
                            );
                          },
                        ),
                      );
                    },
                    child: Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: () {
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: []);
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 8,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const Saver();
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Clipboard",
                            style: GoogleFonts.lora(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.forward_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              snapAnimationDuration: const Duration(milliseconds: 500),
              initialChildSize: 0.68,
              minChildSize: 0.65,
              maxChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                scrollController.addListener(() {
                  setState(() {
                    _imageHeight = scrollController.offset <= 0 ? 500 : 200;
                  });
                });
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 4,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              widget.tradeName,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lora(
                                textStyle: TextStyle(
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const SearchField();
                                    },
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.52,
                            child: Text(
                              widget.type,
                              style: GoogleFonts.dancingScript(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //     width: MediaQuery.of(context).size.width * 0.17),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  widget.statement ? Colors.red : Colors.green,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.statement ? 'Forbidden' : 'Permissible',
                            style: GoogleFonts.lora(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: widget.statement
                                    ? Colors.red
                                    : Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                Text(
                                  '${widget.commonPrice.toStringAsFixed(2)} SY',
                                  style: GoogleFonts.dancingScript(
                                    textStyle: TextStyle(
                                      fontSize: 21,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.008,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                _buildRowNameAndIcon(
                                                  Icons
                                                      .currency_exchange_rounded,
                                                  'The Price',
                                                  8,
                                                  8,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: _buildTextFormField(
                                                    controller: _editPrice,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    context: context,
                                                    textInputAction:
                                                        TextInputAction.go,
                                                    hintText:
                                                        "${widget.commonPrice.toString()} SY",
                                                    // validator: (value) {
                                                    //   if (value == null ||
                                                    //       value.isEmpty) {
                                                    //     return 'Please Enter a Quantity.';
                                                    //   }
                                                    //   if (value == ".") {
                                                    //     return 'Please Enter a Number.';
                                                    //   }
                                                    //   int parsedValue =
                                                    //       int.tryParse(value)!;
                                                    //   if (parsedValue == null ||
                                                    //       parsedValue <= 0 ||
                                                    //       parsedValue >
                                                    //           widget.amount) {
                                                    //     return 'Please Enter a valid Quantity.';
                                                    //   }

                                                    //   return null;
                                                    // },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: InkWell(
                                                    onTap: () {},
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.07,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                        color:
                                                            Color(0xFF3467D2),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Save",
                                                          style:
                                                              GoogleFonts.lora(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
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
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit_rounded,
                                    color: Color(0xFF3467D2),
                                    size: 27,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '${widget.amount.toString()} pieces',
                                  style: GoogleFonts.dancingScript(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: LinearPercentIndicator(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  animation: true,
                                  center: Text(
                                    "${widget.amount}%",
                                    style: GoogleFonts.dancingScript(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  lineHeight:
                                      MediaQuery.of(context).size.height * 0.03,
                                  animationDuration: 2000,
                                  percent: widget.amount / 50,
                                  progressColor: Colors.green,
                                  barRadius: const Radius.circular(40),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: _buildDetailsColumnText(
                                  context,
                                  'Net Price',
                                  "${widget.netPrice.toString()} SY",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: _buildDetailsColumnText(
                                  context,
                                  'Caliber',
                                  widget.caliber,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: _buildDetailsColumnText(
                                  context,
                                  'ExpDate',
                                  "${widget.expDate.day}/${widget.expDate.month}/${widget.expDate.year}",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildDetailsColumnText(
                                context,
                                'PharmaceuticalForm',
                                widget.pharmaceuticalForm,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 65),
                                child: _buildDetailsColumnText(
                                  context,
                                  'Combination',
                                  widget.combination,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: _buildDetailsColumnText(
                                  context,
                                  'ProductionDate',
                                  "${widget.productDate.day}/${widget.productDate.month}/${widget.productDate.year}",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if (widget.statement) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        _buildRowNameAndIcon(
                                            Icons.receipt_long_outlined,
                                            'Medical Prescription',
                                            8,
                                            5),
                                        Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: _buildImageContainer(context),
                                        )),
                                        _buildRowNameAndIcon(Icons.credit_card,
                                            'The ID number', 8, 8),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: _buildTextFormField(
                                            controller: _idNumber,
                                            keyboardType: TextInputType.number,
                                            context: context,
                                            textInputAction: TextInputAction.go,
                                            hintText: 'Enter The Number',
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your financial fund.';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return Saver();
                                                },
                                              ),
                                            );
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              color: Color(0xFF3467D2),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Send",
                                                style: GoogleFonts.lora(
                                                  textStyle: TextStyle(
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
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Form(
                                  key: formKey,
                                  child: Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildRowNameAndIcon(
                                            Icons
                                                .production_quantity_limits_rounded,
                                            'The Quantity',
                                            8,
                                            8,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: _buildTextFormField(
                                              controller: _amountController,
                                              keyboardType:
                                                  TextInputType.number,
                                              context: context,
                                              textInputAction:
                                                  TextInputAction.go,
                                              hintText: 'Enter The Quantity',
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please Enter a Quantity.';
                                                }
                                                if (value == ".") {
                                                  return 'Please Enter a Number.';
                                                }
                                                int parsedValue =
                                                    int.tryParse(value)!;
                                                if (parsedValue <= 0 ||
                                                    parsedValue >
                                                        widget.amount) {
                                                  return 'Please Enter a valid Quantity.';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: InkWell(
                                              onTap: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return Saver();
                                                      },
                                                    ),
                                                  );
                                                }
                                              },
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.07,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  color: Color(0xFF3467D2),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Send",
                                                    style: GoogleFonts.lora(
                                                      textStyle: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
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
                              },
                            );
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
                              'Add To Clipboard',
                              style: GoogleFonts.lora(
                                textStyle: TextStyle(
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
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsColumnText(
      BuildContext context, String firstLine, String secondLine) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.08),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                firstLine,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
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
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: const Icon(
                                Icons.cancel_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.005,
                      color: const Color(0xFF3467D2),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        secondLine,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              firstLine,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleFonts.lora(
                textStyle: TextStyle(
                  fontSize: 18,
                  color: const Color(0xFF3467D2),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.007,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.23,
              child: Text(
                secondLine,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
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
      padding: EdgeInsets.all(5),
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
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          cursorColor: Color(0xFF3467D2),
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
            color: Color(0xFF3467D2),
            size: 30,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, left: 3),
            child: Text(
              name,
              style: GoogleFonts.lora(
                textStyle: TextStyle(
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

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Widget _buildImageContainer(BuildContext contex) {
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
                        textStyle: TextStyle(
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
                        textStyle: TextStyle(
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
          height: 200,
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
              : Icon(
                  Icons.add_photo_alternate,
                  size: 40,
                  color: Color(0xFF3467D2),
                ),
        ),
      ),
    );
  }
}
