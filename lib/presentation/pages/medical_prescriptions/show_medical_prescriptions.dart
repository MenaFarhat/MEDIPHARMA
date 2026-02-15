import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";

import "medical_prescription_component.dart";

class ShowMedicalPrescriptions extends StatefulWidget {
  const ShowMedicalPrescriptions({super.key});

  @override
  State<ShowMedicalPrescriptions> createState() =>
      _ShowMedicalPrescriptionsState();
}

class _ShowMedicalPrescriptionsState extends State<ShowMedicalPrescriptions> {
  List<Map<String, dynamic>> medicalPrescription = [
    {
      "image": "images/app/mm.jpg",
      "ID Number": "010123548795632",
      "Medicine Name": "Cytamol gjhg kgj jbkjhkjhl nbk",
    },
    {
      "image": "images/app/mm.jpg",
      "ID Number": "02365145535",
      "Medicine Name": "Cytamol",
    },
    {
      "image": "images/app/mm.jpg",
      "ID Number": "02365145535",
      "Medicine Name": "Cytamol",
    },
    {
      "image": "images/app/mm.jpg",
      "ID Number": "02365145535",
      "Medicine Name": "Cytamol",
    },
    {
      "image": "images/app/mm.jpg",
      "ID Number": "02365145535",
      "Medicine Name": "Cytamol",
    },
    {
      "image": "images/app/mm.jpg",
      "ID Number": "02365145535",
      "Medicine Name": "Cytamol",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
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
                        'Medical Prescription',
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
                          right: MediaQuery.of(context).size.width * 0.07),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.92,
                child: GridView.builder(
                  itemCount: medicalPrescription.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    // mainAxisSpacing: 2,
                    childAspectRatio: 0.73,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MedicalPrescriptionComponent(
                      image: medicalPrescription[index]["image"],
                      idNumber: medicalPrescription[index]["ID Number"],
                      medicineName: medicalPrescription[index]["Medicine Name"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
