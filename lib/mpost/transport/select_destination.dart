import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class SelectDestinationTransport extends StatefulWidget {
  const SelectDestinationTransport({Key? key}) : super(key: key);

  @override
  State<SelectDestinationTransport> createState() =>
      _SelectDestinationTransportState();
}

class _SelectDestinationTransportState
    extends State<SelectDestinationTransport> {
  TextEditingController searchController = TextEditingController();
  List<String> destinations = [
    "Ahero",
    "Amagoro",
    "Arusha",
    "Awendo",
    "Bella luna on phillips road",
    "Bishop muge",
    "Bomet",
    "Bondo",
    "Bukembe",
    "Bumala",
    "Bungoma",
    "Burnt Forest",
    "Chavakali",
    "Cheptais",
    "Chesikaki"
  ];
  List<String> searchResults = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff3f5f7),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding:
                const EdgeInsets.only(right: 20, left: 20, bottom: 17, top: 5),
            color: Constants.transportColor1,
            child: SafeArea(
                bottom: false,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_rounded)),
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      "Destinations",
                      style: TextStyle(
                          color: Constants.transportHeading,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                )),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: const Color(0xff6A6A6A).withOpacity(0.3),
                      width: 0.8)),
              child: TextField(
                onChanged: (value) {
                  searchResults = [];
                  setState(() {
                    for (var item in destinations) {
                      if (item.toLowerCase().contains(value.toLowerCase())) {
                        searchResults.add(item);
                      }
                    }
                  });
                },
                controller: searchController,
                style: TextStyle(
                    color: Color(0xff4D5559),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  isCollapsed: true,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                  hintText: "Search destination",
                  hintStyle: TextStyle(
                      color: Color(0xff4D5559).withOpacity(0.6),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ),
          ),
          Visibility(
            visible: searchResults.isEmpty,
            child: Expanded(
                child: SafeArea(
              top: false,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, destinations[index]);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Constants.transportHeading
                                      .withOpacity(0.12),
                                  width: 0.5))),
                      child: Text(
                        destinations[index],
                        style: TextStyle(
                            color: Constants.transportHeading,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            )),
          ),
          Visibility(
            visible: searchResults.isNotEmpty,
            child: Expanded(
                child: SafeArea(
              top: false,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, searchResults[index]);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Constants.transportHeading
                                      .withOpacity(0.12),
                                  width: 0.5))),
                      child: Text(
                        searchResults[index],
                        style: TextStyle(
                            color: Constants.transportHeading,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            )),
          ),
        ]));
  }
}
