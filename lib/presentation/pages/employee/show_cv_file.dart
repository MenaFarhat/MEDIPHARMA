// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ShowCVFile extends StatefulWidget {
  String name;
  String filePath;
  bool add;
  ShowCVFile(
      {required this.add,
      required this.name,
      required this.filePath,
      super.key});

  @override
  State<ShowCVFile> createState() => _ShowCVFileState();
}

class _ShowCVFileState extends State<ShowCVFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3467D2),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 20,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        if (widget.add == true) {
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else {
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 25,
                        color: Color(0xFF3467D2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.compare_arrows_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      "Swipe\nHorizontal",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: PDFView(
              filePath: widget.filePath,
              enableSwipe: true,
              autoSpacing: true,
              swipeHorizontal: true,
              pageFling: true,
              pageSnap: true,
              preventLinkNavigation: true,
              defaultPage: 0,
              fitPolicy: FitPolicy.BOTH,
            ),
          ),
        ],
      ),
    );
  }
}
