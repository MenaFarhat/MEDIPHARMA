import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class ShowBillPhoto extends StatelessWidget {
  String image;
  String date;
  ShowBillPhoto({required this.date, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leadingWidth: MediaQuery.of(context).size.width * 0.7,
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
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.22),
                child: Text(
                  date,
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: PhotoView(
          imageProvider: AssetImage(image),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered,
        ),
      ),
    );
  }
}
