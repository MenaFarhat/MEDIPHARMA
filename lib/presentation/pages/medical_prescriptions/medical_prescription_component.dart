// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/medical_prescriptions/show_medical_prescription_photo.dart';

// ignore: must_be_immutable
class MedicalPrescriptionComponent extends StatefulWidget {
  String image;
  String idNumber;
  String medicineName;
  MedicalPrescriptionComponent({
    required this.medicineName,
    required this.image,
    required this.idNumber,
    super.key,
  });

  @override
  State<MedicalPrescriptionComponent> createState() =>
      _MedicalPrescriptionComponentState();
}

class _MedicalPrescriptionComponentState
    extends State<MedicalPrescriptionComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF3467D2),
                  width: 3,
                ),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.purpleAccent.shade400,
                    const Color(0xFF3467D2),
                    Colors.blueAccent,
                    Colors.grey.shade300,
                  ],
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ShowMedicalPrescriptionPhoto(
                        image: widget.image,
                        idNumber: widget.idNumber,
                        medicineName: widget.medicineName,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.27,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF3467D2),
                    width: 2,
                  ),
                  color: Colors.black.withOpacity(0.4),
                ),
                child: Center(
                  child: Text(
                    widget.medicineName,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ShowMedicalPrescriptionPhoto(
                          image: widget.image,
                          idNumber: widget.idNumber,
                          medicineName: widget.medicineName,
                        );
                      },
                    ),
                  );
                },
                child: Icon(
                  Icons.open_in_new_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          child: Text(
            widget.idNumber,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
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
    );
  }
}
