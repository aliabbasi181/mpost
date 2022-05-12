import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/transport/transport_constants.dart';

class TransportInputField extends StatefulWidget {
  String hintText;
  IconData icon;
  TextEditingController controller;
  bool isLocationPicker;
  TransportInputField(
      {Key? key,
      required this.isLocationPicker,
      required this.hintText,
      required this.icon,
      required this.controller})
      : super(key: key);

  @override
  State<TransportInputField> createState() => _TransportInputFieldState();
}

class _TransportInputFieldState extends State<TransportInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
      margin: const EdgeInsets.only(bottom: 7),
      width: Constants.getWidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              width: 0.8, color: const Color(0xff6A6A6A).withOpacity(0.3))),
      child: Row(
        children: [
          Icon(
            widget.icon,
            size: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                if (widget.isLocationPicker) {
                } else {}
              },
              controller: widget.controller,
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
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: Color(0xff4D5559),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransportInputSelector extends StatefulWidget {
  String hintText;
  IconData prefixIcon;
  IconData sufixIcon;
  VoidCallback onPress;
  TransportInputSelector(
      {Key? key,
      required this.prefixIcon,
      required this.hintText,
      required this.sufixIcon,
      required this.onPress})
      : super(key: key);

  @override
  State<TransportInputSelector> createState() => _TransportInputSelectorState();
}

class _TransportInputSelectorState extends State<TransportInputSelector> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
        margin: const EdgeInsets.only(bottom: 7),
        width: Constants.getWidth(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                width: 0.8, color: const Color(0xff6A6A6A).withOpacity(0.3))),
        child: Row(
          children: [
            Icon(
              widget.prefixIcon,
              size: 20,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                enabled: false,
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
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      color: Color(0xff4D5559),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(
              widget.sufixIcon,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class TransportInputButton extends StatelessWidget {
  String label;
  VoidCallback onPress;
  TransportInputButton({Key? key, required this.label, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: Constants.getWidth(context),
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
            color: Constants.transportColor2,
            borderRadius: BorderRadius.circular(4)),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class TransportLocationCard extends StatefulWidget {
  String image, title, date, passengers;
  TransportLocationCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.date,
      required this.passengers})
      : super(key: key);

  @override
  State<TransportLocationCard> createState() => _TransportLocationCardState();
}

class _TransportLocationCardState extends State<TransportLocationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 254,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            Container(
              height: 115,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(widget.image))),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Constants.transportHeading,
                        fontFamily: "Montserrat",
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.date,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff4D5559).withOpacity(0.6),
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const Divider(
                    height: 10,
                    color: const Color(0xff4D5559),
                  ),
                  Text(
                    "${widget.passengers} passengers",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff4D5559).withOpacity(0.6),
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class BusOperatorsCard extends StatefulWidget {
  String logo;

  BusOperatorsCard({Key? key, required this.logo}) : super(key: key);

  @override
  State<BusOperatorsCard> createState() => _BusOperatorsCardState();
}

class _BusOperatorsCardState extends State<BusOperatorsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 10)
        ], color: Colors.white, borderRadius: BorderRadius.circular(4)),
        alignment: AlignmentDirectional.center,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: NetworkImage(widget.logo))),
        ));
  }
}

class TransportCityCard extends StatefulWidget {
  String name, image, details;
  TransportCityCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.details})
      : super(key: key);

  @override
  State<TransportCityCard> createState() => _TransportCityCardState();
}

class _TransportCityCardState extends State<TransportCityCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 199,
      margin: const EdgeInsets.only(bottom: 14),
      child: Stack(
        children: [
          Container(
            height: 199,
            padding: const EdgeInsets.all(20),
            width: Constants.getWidth(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(widget.image))),
          ),
          Container(
            width: Constants.getWidth(context),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.5)
                    ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.name,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 19,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  widget.details,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TransportAdvantageCard extends StatefulWidget {
  String title, image, subtitle;
  Widget? child;
  TransportAdvantageCard(
      {Key? key,
      required this.title,
      required this.image,
      required this.subtitle,
      this.child})
      : super(key: key);

  @override
  State<TransportAdvantageCard> createState() => _TransportAdvantageCardState();
}

class _TransportAdvantageCardState extends State<TransportAdvantageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.card_giftcard_rounded,
            size: 60,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Constants.transportHeading,
                      fontFamily: "Montserrat",
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                      color: Constants.transportHeading,
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                widget.child != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Divider(), widget.child!],
                      )
                    : const SizedBox(
                        height: 0,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TransportResultBusCard extends StatefulWidget {
  VoidCallback onPress;
  TransportResultBusCard({Key? key, required this.onPress}) : super(key: key);

  @override
  State<TransportResultBusCard> createState() => _TransportResultBusCardState();
}

class _TransportResultBusCardState extends State<TransportResultBusCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 3, right: 3),
      width: Constants.getWidth(context),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5)
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                decoration: BoxDecoration(
                    color: const Color(0xff38B87C),
                    borderRadius: BorderRadius.circular(2)),
                child: Row(
                  children: [
                    Icon(
                      Icons.shield,
                      size: 10,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "4.6",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "316 reviews",
                style: TextStyle(
                    color: const Color(0xff38B87C),
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "http://eya-kenya.org/wp-content/uploads/2018/09/Easycoach.jpg"))),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Easy Coach bus",
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Constants.transportHeading,
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "2 seat remaining",
                      style: TextStyle(
                          color: const Color(0xffFF3232),
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nairobi",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff4D5559).withOpacity(0.7),
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "8:30 am",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                "---   6h 10m   ---",
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff4D5559).withOpacity(0.7),
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kisumu",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff4D5559).withOpacity(0.7),
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "2:40 pm",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          Divider(
            height: 30,
            color: Colors.black.withOpacity(0.4),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Starts from",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff4D5559).withOpacity(0.7),
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "KSH 1500",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              InkWell(
                onTap: widget.onPress,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  decoration: BoxDecoration(
                      color: Constants.transportColor2,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    "Select Seat",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TransportSeatSelectorSeatRow extends StatefulWidget {
  List<bool> occupiedSeats = [];
  List<String> seatTags = [];
  TransportSeatSelectorSeatRow(
      {Key? key, required this.occupiedSeats, required this.seatTags})
      : super(key: key);

  @override
  State<TransportSeatSelectorSeatRow> createState() =>
      _TransportSeatSelectorSeatRowState();
}

class _TransportSeatSelectorSeatRowState
    extends State<TransportSeatSelectorSeatRow> {
  List<Color> seatColors = [];
  @override
  void initState() {
    for (int i = 0; i < 4; i++) {
      if (widget.occupiedSeats[i]) {
        seatColors.add(Constants.transportHeading);
      } else {
        seatColors.add(Colors.transparent);
      }
    }
    setState(() {});
    super.initState();
  }

  _selectSeat(int index, String seatTag) {
    if (!widget.occupiedSeats[index]) {
      setState(() {
        if (seatColors[index] != const Color(0xff38B87C)) {
          seatColors[index] = const Color(0xff38B87C);
          TransportConstants.selectedSeats.add(seatTag);
        } else {
          seatColors[index] = Colors.transparent;
          TransportConstants.selectedSeats
              .removeWhere((element) => element == seatTag);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                _selectSeat(0, widget.seatTags[0]);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(vertical: 6),
                width: 42,
                decoration: BoxDecoration(
                    color: seatColors[0],
                    border: Border.all(
                        color: Constants.transportHeading.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  widget.seatTags[0],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: (widget.occupiedSeats[0] ||
                              seatColors[0] == const Color(0xff38B87C)
                          ? Colors.white
                          : Constants.transportHeading),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _selectSeat(1, widget.seatTags[1]);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                width: 42,
                decoration: BoxDecoration(
                    color: seatColors[1],
                    border: Border.all(
                        color: Constants.transportHeading.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  widget.seatTags[1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: (widget.occupiedSeats[1] ||
                              seatColors[1] == const Color(0xff38B87C)
                          ? Colors.white
                          : Constants.transportHeading),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                _selectSeat(2, widget.seatTags[2]);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(vertical: 6),
                width: 42,
                decoration: BoxDecoration(
                    color: seatColors[2],
                    border: Border.all(
                        color: Constants.transportHeading.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  widget.seatTags[2],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: (widget.occupiedSeats[2] ||
                              seatColors[2] == const Color(0xff38B87C)
                          ? Colors.white
                          : Constants.transportHeading),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _selectSeat(3, widget.seatTags[3]);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                width: 42,
                decoration: BoxDecoration(
                    color: seatColors[3],
                    border: Border.all(
                        color: Constants.transportHeading.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  widget.seatTags[3],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: (widget.occupiedSeats[3] ||
                              seatColors[3] == const Color(0xff38B87C)
                          ? Colors.white
                          : Constants.transportHeading),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
            ),
          ],
        ));
  }
}

class AddPessangerDetailsCard extends StatefulWidget {
  String seatTag;
  VoidCallback onPress;
  AddPessangerDetailsCard(
      {Key? key, required this.seatTag, required this.onPress})
      : super(key: key);

  @override
  State<AddPessangerDetailsCard> createState() =>
      _AddPessangerDetailsCardState();
}

class _AddPessangerDetailsCardState extends State<AddPessangerDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(
              color: Constants.transportHeading.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
              ),
              width: 40,
              decoration: BoxDecoration(
                  color: const Color(0xff38B87C),
                  border: Border.all(
                      color: Constants.transportHeading.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                widget.seatTag,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(Icons.person),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Pessager details",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Personal details will appear on ticket",
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontFamily: "Montserrat",
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
