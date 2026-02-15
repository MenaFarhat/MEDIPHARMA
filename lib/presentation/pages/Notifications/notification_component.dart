import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class NotificationComponent extends StatefulWidget {
  String image;
  String title;
  String content;
  NotificationComponent(
      {required this.image,
      required this.title,
      required this.content,
      super.key});

  @override
  State<NotificationComponent> createState() => _NotificationComponentState();
}

class _NotificationComponentState extends State<NotificationComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // color: Colors.grey.shade300.withOpacity(0.5),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xFF3467D2),
              child: Center(
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.007,
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.007,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    widget.title,
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFF3467D2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    widget.content,
                    maxLines: 2,
                    style: GoogleFonts.lora(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w800,
                      ),
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
