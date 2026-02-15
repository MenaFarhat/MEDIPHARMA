// ignore_for_file: unused_element, use_build_context_synchronously, avoid_unnecessary_containers, sized_box_for_whitespace, unused_element_parameter

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/profile/edit_profile.dart';
import 'package:pharma/presentation/pages/profile/show_profile_photo.dart';
import 'package:pharma/presentation/screens/auth_screen.dart';
import 'changePassword/resetthepassword.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool lang = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(
                    //   onPressed: () {
                    //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    //         overlays: []);
                    //     Navigator.pop(context);
                    //   },
                    //   icon: const Icon(
                    //     Icons.arrow_back_ios_new_rounded,
                    //     size: 30,
                    //     color: Color(0xFF3467D2),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.4),
                      child: Text(
                        'Profile',
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFF3467D2),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const EditProfile();
                                },
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Color(0xFF3467D2),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          _buildInkweelButtonRow(
                                              icon: Icons.password_outlined,
                                              text: "Change The Passwprd",
                                              iconColor:
                                                  const Color(0xFF3467D2),
                                              textColor:
                                                  const Color(0xFF3467D2),
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return const ResetPassword();
                                                    },
                                                  ),
                                                );
                                              }),
                                          _buildInkweelButtonRow(
                                              icon: Icons.language_rounded,
                                              text: "Language",
                                              iconColor:
                                                  const Color(0xFF3467D2),
                                              textColor:
                                                  const Color(0xFF3467D2),
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              "Select Language",
                                                              style: GoogleFonts
                                                                  .lora(
                                                                textStyle:
                                                                    const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 16.0),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                InkWell(
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      lang =
                                                                          true;
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: Text(
                                                                    "English",
                                                                    style:
                                                                        GoogleFonts
                                                                            .lora(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: lang ==
                                                                                true
                                                                            ? const Color(0xFF3467D2)
                                                                            : const Color(0xFF959EAE),
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 16,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                InkWell(
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      lang =
                                                                          false;
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: Text(
                                                                    "Arabic",
                                                                    style:
                                                                        GoogleFonts
                                                                            .lora(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: lang ==
                                                                                false
                                                                            ? const Color(0xFF3467D2)
                                                                            : const Color(0xFF959EAE),
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                                  },
                                                );
                                              }),
                                          _buildInkweelButtonRow(
                                            icon: Icons.logout_rounded,
                                            text: "Logout",
                                            iconColor: const Color(0xFF959EAE),
                                            textColor: const Color(0xFF959EAE),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            "Logout",
                                                            style: GoogleFonts
                                                                .lora(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 16.0),
                                                          Text(
                                                            "Are you sure you want to logout?",
                                                            style: GoogleFonts
                                                                .lora(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 24.0),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              TextButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  overlayColor:
                                                                      WidgetStateProperty.all(
                                                                          Colors
                                                                              .transparent),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  'Cancel',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lora(
                                                                    textStyle:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 12.0),
                                                              TextButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  overlayColor:
                                                                      WidgetStateProperty.all(
                                                                          Colors
                                                                              .transparent),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pushReplacement(
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) {
                                                                        return const ChooseAuth();
                                                                      },
                                                                    ),
                                                                  );
                                                                },
                                                                child: Text(
                                                                  'Logout',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lora(
                                                                    textStyle:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Color(
                                                                          0xFF3467D2),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
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
                                                },
                                              );
                                            },
                                          ),
                                          _buildInkweelButtonRow(
                                            icon: Icons.delete_forever_rounded,
                                            text: "Delete The Account",
                                            iconColor: Colors.red.shade700,
                                            textColor: Colors.red.shade700,
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            "Delete Account",
                                                            style: GoogleFonts
                                                                .lora(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 16.0),
                                                          Text(
                                                            "Are you sure you want to delete this Account?",
                                                            style: GoogleFonts
                                                                .lora(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 24.0),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              TextButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  overlayColor:
                                                                      WidgetStateProperty.all(
                                                                          Colors
                                                                              .transparent),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  'Cancel',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lora(
                                                                    textStyle:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 12.0),
                                                              TextButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  overlayColor:
                                                                      WidgetStateProperty.all(
                                                                          Colors
                                                                              .transparent),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  'Delete',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lora(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .red
                                                                          .shade700,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
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
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: const Icon(
                              Icons.settings,
                              color: Color(0xFF3467D2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ShowProfilePhoto(
                              image: "images/app/code1.png",
                              name: "Mena Zead Farhat",
                            );
                          },
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundColor: Color(0xFF3467D2),
                      backgroundImage: AssetImage("images/app/code1.png"),
                    ),
                  ),
                ),
              ),
              _buildRowNameAndIcon(
                  Icons.local_pharmacy_rounded, "Name Of Pharmacy", 8, 5),
              _buildTextFormField(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                hintText: "MinaPharmacy",
                isEnabled: false,
                num: 8,
              ),
              _buildRowNameAndIcon(Icons.person, 'The Owner', 8, 0),
              _buildTextFormField(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                hintText: "Mina Zead Farhat",
                isEnabled: false,
                num: 8,
              ),
              _buildRowNameAndIcon(Icons.email_rounded, "Email", 8, 0),
              _buildTextFormField(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                hintText: "Mina.farhat333@gmail.com",
                isEnabled: false,
                num: 8,
              ),
              _buildRowNameAndIcon(
                  Icons.location_city_outlined, 'City And Region', 8, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.08,
                    isEnabled: false,
                    num: 8,
                    hintText: 'Damascuse',
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city.';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.08,
                    isEnabled: false,
                    num: 8,
                    hintText: 'Bab-Toma',
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your region.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              _buildRowNameAndIcon(Icons.phone_enabled_rounded,
                  'Landline and Mobile Number', 8, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.08,
                    isEnabled: false,
                    num: 8,
                    hintText: '4711919',
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city.';
                      }
                      return null;
                    },
                  ),
                  _buildTextFormField(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.08,
                    isEnabled: false,
                    num: 8,
                    hintText: '0937956046',
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your region.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInkweelButtonRow({
    required IconData icon,
    required String text,
    required Color iconColor,
    required Color textColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
        size: 28,
      ),
      title: Text(
        text,
        style: GoogleFonts.lora(
          textStyle: TextStyle(
            fontSize: 16,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildTextFormField({
    TextEditingController? controller,
    required String hintText,
    TextInputType? keyboardType,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
    bool? isEnabled,
    String? initialValue,
    double? num,
    double? width,
    double? height,
    Widget? suffixIcon,
  }) {
    // controller!.text = initialValue ?? '';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: num!),
      child: Container(
        width: width,
        height: height,
        child: TextFormField(
          onEditingComplete: () {
            // Perform actions when "Done" is pressed
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: []);
            FocusScope.of(context).unfocus();
          },
          style: GoogleFonts.lora(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
          cursorColor: const Color(0xFF3467D2),
          cursorHeight: 25,
          enableSuggestions: true,
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              enabled: isEnabled!,
              hintStyle: GoogleFonts.lora(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              suffixIcon: suffixIcon),
          keyboardType: keyboardType,
          onTap: onTap,
          textInputAction: textInputAction,
          validator: validator,
        ),
      ),
    );
  }

  Widget _buildRowNameAndIcon(
      IconData icon, String name, double left, double top) {
    return Padding(
      padding: EdgeInsets.only(left: left, top: top),
      child: Row(
        children: [
          Container(
            child: Icon(
              icon,
              color: const Color(0xFF3467D2),
              size: 30,
            ),
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              name,
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
      ),
    );
  }
}
