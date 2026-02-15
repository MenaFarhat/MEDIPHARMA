// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/Notifications/notification_component.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notes = [
    {
      "image": "images/app/logo.png",
      "title": "Access Permition",
      "content": "Wellcome! you can to access to application",
    },
    {
      "image": "images/app/logo.png",
      "title": "Access Permition",
      "content": "Wellcome! you can to access to application",
    },
    {
      "image": "images/app/logo.png",
      "title": "Access Permition",
      "content": "Wellcome! you can to access to application",
    },
    {
      "image": "images/app/logo.png",
      "title": "Access Permition",
      "content": "Wellcome! you can to access to application",
    },
    {
      "image": "images/app/logo.png",
      "title": "Access Permition",
      "content": "Wellcome! you can to access to application",
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
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.3,
                      ),
                      child: Text(
                        'Notifications',
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFF3467D2),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 55),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.95,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ListView.builder(
                  itemCount: notes.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015),
                      child: NotificationComponent(
                        image: notes[index]["image"],
                        title: notes[index]["title"],
                        content: notes[index]["content"],
                      ),
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
