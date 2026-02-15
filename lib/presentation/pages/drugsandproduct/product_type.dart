import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/drugsandproduct/drugs_and_products_types.dart';

// ignore: must_be_immutable
class ProductType extends StatefulWidget {
  String name;
  String imageUrl;
  ProductType({required this.imageUrl, required this.name, super.key});

  @override
  State<ProductType> createState() => _ProductTypeState();
}

class _ProductTypeState extends State<ProductType> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DrugsScreen(
                name: widget.name,
                isDrugs: false,
              );
            },
          ),
        );
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.1,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300, // Shadow color
              offset: const Offset(0, 3), // Offset in x and y direction
              blurRadius: 2, // Blur radius
              spreadRadius: 0, // Spread radius
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF3467D2),
                image: DecorationImage(
                  image: AssetImage(
                    widget.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF3467D2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
