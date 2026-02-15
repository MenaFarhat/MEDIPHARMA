import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/presentation/pages/search/search_component.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  List<Map<String, dynamic>> searchResults = [
    {
      "name": "Mmmmm fjhgjhg vhkh nbkjj",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
    {
      "name": "Mmmmm",
      "image": "images/app/code2.png",
      "total": 20,
      "statment": true,
      "combination": "jashflalhf",
      "caliber": "jsfkjf",
      "type": "Baby Products",
      "pharmaceuticalForm": "KJDHKj",
      "netPrice": 1500.0,
      "commonPrice": 2000.0,
      "productDate": DateTime.now(),
      "expDate": DateTime.now(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 30,
                          color: Color(0xFF3467D2),
                        ),
                      ),
                      Text(
                        'Search',
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFF3467D2),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {},
                          child: const Icon(
                            Icons.qr_code_rounded,
                            color: Color(0xFF3467D2),
                            size: 27,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    // color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,

                    child: TextFormField(
                      onEditingComplete: () {
                        // Perform actions when "Done" is pressed
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: []);
                        FocusScope.of(context).unfocus();
                      },
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      cursorColor: Colors.black,
                      cursorHeight: 25,
                      enableSuggestions: true,
                      autofocus: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "search",
                        hintStyle: GoogleFonts.lora(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 16.0,
                        ),
                        prefixIcon: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {},
                          child: Icon(
                            Icons.search,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.855,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: GridView.builder(
                      itemCount: searchResults.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.56,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SearchComponent(
                          name: searchResults[index]["name"],
                          imageUrl: searchResults[index]["image"],
                          total: searchResults[index]["total"],
                          statment: searchResults[index]["statment"],
                          combination: searchResults[index]["combination"],
                          caliber: searchResults[index]["caliber"],
                          type: searchResults[index]["type"],
                          pharmaceuticalForm: searchResults[index]
                              ["pharmaceuticalForm"],
                          netPrice: searchResults[index]["netPrice"],
                          commonPrice: searchResults[index]["commonPrice"],
                          productDate: searchResults[index]["productDate"],
                          expDate: searchResults[index]["expDate"],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
