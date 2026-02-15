import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pharma/presentation/pages/Notifications/notification_screen.dart';
import 'package:pharma/presentation/pages/profile/profile.dart';
import 'package:pharma/presentation/screens/homescreen.dart';

import '../pages/employee/employee_page.dart';
import '../pages/profits/profits.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int counter = 9;
  final screens = [
    const HomeScreen(),
    const Profits(),
    EmployeeScreen(),
    const NotificationScreen(),
    const Profile(),
  ];
  int curentindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: screens[curentindex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          ),
          child: CustomNavigationBar(
            onTap: (index) {
              setState(() {
                curentindex = index;
              });
            },
            items: [
              CustomNavigationBarItem(
                icon: const Icon(
                  Icons.local_pharmacy_rounded,
                ),
                // title: Text(
                //   "Home",
                //   style: TextStyle(
                //     fontSize: 12,
                //     fontWeight: FontWeight.bold,
                //     color: curentindex == 0
                //         ? const Color(0xFF3467D2)
                //         : const Color(0xFF959EAE),
                //     fontFamilyFallback: const ["Roboto-Bold.ttf"],
                //   ),
                // ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(
                  Icons.trending_up_rounded,
                ),
                // title: Text(
                //   "Accounting",
                //   style: TextStyle(
                //     fontSize: 12,
                //     fontWeight: FontWeight.bold,
                //     color: curentindex == 1
                //         ? const Color(0xFF3467D2)
                //         : const Color(0xFF959EAE),
                //     fontFamilyFallback: const ["Roboto-Bold.ttf"],
                //   ),
                // ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(
                  Icons.groups_rounded,
                ),
                // title: Text(
                //   "Employees",
                //   style: TextStyle(
                //     fontSize: 12,
                //     fontWeight: FontWeight.bold,
                //     color: curentindex == 2
                //         ? const Color(0xFF3467D2)
                //         : const Color(0xFF959EAE),
                //     fontFamilyFallback: const ["Roboto-Bold.ttf"],
                //   ),
                // ),
              ),
              CustomNavigationBarItem(
                icon: Stack(
                  children: [
                    const Icon(
                      Icons.notifications,
                      size: 27,
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Center(
                          child: counter > 9
                              ? const Text(
                                  '+9',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "$counter",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                    )
                  ],
                ),
                // title: Text(
                //   "Notifications",
                //   style: TextStyle(
                //     fontSize: 12,
                //     fontWeight: FontWeight.bold,
                //     color: curentindex == 3
                //         ? const Color(0xFF3467D2)
                //         : const Color(0xFF959EAE),
                //     fontFamilyFallback: const ["Roboto-Bold.ttf"],
                //   ),
                // ),
              ),
              CustomNavigationBarItem(
                icon: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: curentindex == 4
                          ? const Color(0xFF3467D2)
                          : Colors.white,
                      width: 2,
                    ),
                    image: const DecorationImage(
                      image: AssetImage("images/app/mm.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: CircleAvatar(
                  //   // radius: 20,
                  //   backgroundImage: AssetImage("images/app/Auth.png"),
                  // ),
                ),
                // title: Text(
                //   "Profile",
                //   style: TextStyle(
                //     fontSize: 12,
                //     fontWeight: FontWeight.bold,
                //     color: curentindex == 4
                //         ? const Color(0xFF3467D2)
                //         : const Color(0xFF959EAE),
                //     fontFamilyFallback: const ["Roboto-Bold.ttf"],
                //   ),
                // ),
              ),
            ],
            currentIndex: curentindex,
            selectedColor: const Color(0xFF3467D2),
            unSelectedColor: const Color(0xFF959EAE),
            iconSize: 30,
          ),
        ),
      ),
    );
  }
}
