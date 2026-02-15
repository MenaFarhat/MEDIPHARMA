import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class ShowProfilePhoto extends StatelessWidget {
  String image;
  String name;
  ShowProfilePhoto({required this.name, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leadingWidth: MediaQuery.of(context).size.width * 0.9,
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
                name,
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
        body: PhotoView(
          imageProvider: AssetImage(image),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered,
        ),
      ),
    );
  }
}
