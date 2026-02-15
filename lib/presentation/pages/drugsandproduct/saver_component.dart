// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SaverComponent extends StatefulWidget {
  String image;
  String name;
  double price;
  int quantity;
  int sizeList;
  int index;
  SaverComponent(
      {required this.image,
      required this.name,
      required this.price,
      required this.quantity,
      required this.sizeList,
      required this.index,
      super.key});

  @override
  State<SaverComponent> createState() => _SaverComponentState();
}

class _SaverComponentState extends State<SaverComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                    ),
                    child: Text(
                      widget.name,
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.price.toString(),
                          style: GoogleFonts.dancingScript(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Text(
                          " SY",
                          style: GoogleFonts.dancingScript(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Icon(Icons.delete_rounded),
                ),
              )
            ],
          ),
        ),
        widget.index != widget.sizeList - 1
            ? Divider(
                color: Colors.grey.shade300.withOpacity(0.8),
                indent: MediaQuery.of(context).size.width * 0.37,
                endIndent: MediaQuery.of(context).size.width * 0.02,
                thickness: 1.5,
              )
            : Container(),
      ],
    );
  }
}
