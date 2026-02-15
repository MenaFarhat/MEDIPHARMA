// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class ShowMedicalPrescriptionPhoto extends StatefulWidget {
  String image;
  String idNumber;
  String medicineName;
  ShowMedicalPrescriptionPhoto({
    required this.medicineName,
    required this.idNumber,
    required this.image,
    super.key,
  });

  @override
  State<ShowMedicalPrescriptionPhoto> createState() =>
      _ShowMedicalPrescriptionPhotoState();
}

class _ShowMedicalPrescriptionPhotoState
    extends State<ShowMedicalPrescriptionPhoto> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leadingWidth: MediaQuery.of(context).size.width,
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: IconButton(
                  onPressed: () {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: []);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                ),
              ),
              Text(
                "Medical Prescription Photo",
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (show == true) {
                      setState(() {
                        show = false;
                      });
                    } else {
                      setState(() {
                        show = true;
                      });
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: PhotoView(
                      imageProvider: AssetImage(widget.image),
                      minScale: PhotoViewComputedScale.covered,
                      maxScale: PhotoViewComputedScale.covered,
                    ),
                  ),
                ),
                show == true
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "This Medical Prescription for the Customer who has the ID Number ${widget.idNumber} in his card ",
                                maxLines: 5,
                                style: GoogleFonts.lora(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "the medicine you buy for this medical prescription is ${widget.medicineName}",
                                maxLines: 5,
                                style: GoogleFonts.lora(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
