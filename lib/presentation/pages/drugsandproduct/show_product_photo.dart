// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class ShowProductPhoto extends StatefulWidget {
  String image;
  String name;
  ShowProductPhoto({required this.name, required this.image, super.key});

  @override
  State<ShowProductPhoto> createState() => _ShowProductPhotoState();
}

class _ShowProductPhotoState extends State<ShowProductPhoto> {
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
              Container(
                width: MediaQuery.of(context).size.width * 0.77,
                child: Text(
                  widget.name,
                  overflow: TextOverflow.ellipsis,
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
          imageProvider: AssetImage(widget.image),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered,
        ),
      ),
    );
  }
}
