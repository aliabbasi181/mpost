import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/terms_of_service.dart';
import 'package:shimmer/shimmer.dart';

class MenuIcon extends StatefulWidget {
  String title, image;
  VoidCallback onPress;
  MenuIcon(
      {Key? key,
      required this.title,
      required this.image,
      required this.onPress})
      : super(key: key);

  @override
  _MenuIconState createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onPress,
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0XFFFededed)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 5)
                ]),
            padding: const EdgeInsets.all(10),
            child: Image(
              image: AssetImage(widget.image),
              height: 35,
              width: 35,
            ),
          ),
        ),
        Text(
          widget.title,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: 13),
        )
      ],
    );
  }
}

class FadeTiles extends StatefulWidget {
  String title, subTitle;
  IconData icon;
  FadeTiles(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.icon})
      : super(key: key);

  @override
  _FadeTilesState createState() => _FadeTilesState();
}

class _FadeTilesState extends State<FadeTiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.getWidth(context) * 0.41,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0XFFFf4f4f4),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.subTitle,
                style: TextStyle(
                    color: Constants.descriptionColor,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.title,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ],
          ),
          Icon(
            widget.icon,
            color: Colors.black,
            size: 30,
          )
        ],
      ),
    );
  }
}

class CinemaSection extends StatefulWidget {
  String poster, location, movieName;
  CinemaSection(
      {Key? key,
      required this.poster,
      required this.movieName,
      required this.location})
      : super(key: key);

  @override
  _CinemaSectionState createState() => _CinemaSectionState();
}

class _CinemaSectionState extends State<CinemaSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            height: 150,
            width: Constants.getWidth(context) * 0.95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(widget.poster))),
          ),
          Text(
            widget.location,
            style: TextStyle(
                color: Constants.descriptionColor,
                fontFamily: "Montserrat",
                fontSize: 13),
          ),
          const SizedBox(
            height: 0,
          ),
          Text(
            widget.movieName,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class OfferSection extends StatefulWidget {
  String poster, category, title;
  OfferSection(
      {Key? key,
      required this.poster,
      required this.title,
      required this.category})
      : super(key: key);

  @override
  _OfferSectionState createState() => _OfferSectionState();
}

class _OfferSectionState extends State<OfferSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            height: 150,
            width: Constants.getWidth(context) * 0.41,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(widget.poster))),
          ),
          Text(
            widget.category,
            style: TextStyle(
                color: Constants.descriptionColor,
                fontFamily: "Montserrat",
                fontSize: 13),
          ),
          const SizedBox(
            height: 0,
          ),
          Text(
            widget.title,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class SectionLabel extends StatefulWidget {
  String title;
  IconData icon;
  SectionLabel({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  _SectionLabelState createState() => _SectionLabelState();
}

class _SectionLabelState extends State<SectionLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            softWrap: true,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
          Icon(
            widget.icon == CupertinoIcons.arrow_right
                ? CupertinoIcons.arrow_right
                : null,
            size: 22,
          )
        ],
      ),
    );
  }
}

class MoreForYouSection extends StatefulWidget {
  String title, subTitle;
  String icon;
  MoreForYouSection(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.icon})
      : super(key: key);

  @override
  _MoreForYouSectionState createState() => _MoreForYouSectionState();
}

class _MoreForYouSectionState extends State<MoreForYouSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.getWidth(context) * 0.28,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color(0XFFFf4f4f4),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            widget.subTitle,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Constants.descriptionColor,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                image: AssetImage(widget.icon),
                width: 35,
                height: 35,
              )
            ],
          )
        ],
      ),
    );
  }
}

class BestEventsSection extends StatefulWidget {
  String poster, category, title;
  BestEventsSection(
      {Key? key,
      required this.poster,
      required this.title,
      required this.category})
      : super(key: key);

  @override
  _BestEventsSectionState createState() => _BestEventsSectionState();
}

class _BestEventsSectionState extends State<BestEventsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 200,
                width: Constants.getWidth(context) * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(widget.poster))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: widget.category == "Best events"
                      ? Colors.white
                      : const Color(0XFFF1b2830),
                ),
                child: Text(
                  widget.category,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: widget.category != "Best events"
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 0,
          ),
          Text(
            widget.title,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class BannerSection extends StatefulWidget {
  String image, title, subTitle, buttonText;
  VoidCallback onPress;
  Color backgroundColor, titleColor, subTitleColor;
  double imageHeight, imageWidth;

  BannerSection(
      {Key? key,
      required this.image,
      required this.imageHeight,
      required this.imageWidth,
      required this.title,
      required this.titleColor,
      required this.subTitle,
      required this.subTitleColor,
      required this.buttonText,
      required this.onPress,
      required this.backgroundColor})
      : super(key: key);

  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: Constants.getWidth(context),
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Constants.getWidth(context) * 0.6,
                child: Text(
                  widget.title,
                  softWrap: true,
                  style: TextStyle(
                      color: widget.titleColor,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: Constants.getWidth(context) * 0.4,
                child: Text(
                  widget.subTitle,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: TextStyle(
                      color: widget.subTitleColor,
                      fontFamily: "Montserrat",
                      fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: widget.onPress,
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white),
                  child: Text(
                    widget.buttonText,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Image(
          image: AssetImage(widget.image),
          width: widget.imageWidth,
          height: widget.imageHeight,
        )
      ],
    );
  }
}

showSnackBar(String title, String message, BuildContext context) async {
  await Flushbar(
    title: title,
    message: message,
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: BorderRadius.circular(10),
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    animationDuration: const Duration(milliseconds: 500),
    icon: const Icon(
      Icons.error_rounded,
      color: Colors.white,
      size: 40,
    ),
    shouldIconPulse: true,
  ).show(context);
}

Widget messageDialog(
    BuildContext context, String title, String msg, buttonText) {
  return AlertDialog(
    title: Text(
      title,
      style: const TextStyle(
          fontFamily: "Montserrat", fontWeight: FontWeight.w700, fontSize: 16),
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 5, 60, 20),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          msg,
          style: TextStyle(
              height: 1.5,
              color: Constants.descriptionColor,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      ],
    ),
    actionsPadding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
    actions: [
      InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3), border: Border.all()),
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
        ),
      ),
    ],
  );
}

Widget wellcomeDialog(BuildContext context) {
  return AlertDialog(
    title: const Text(
      "Mpost is a technological platform that  allows every Kenyan with a mobile phone to have a personal virtual postal address with ease. It does this by converting the client's phone number to their P.O. BOX.",
      style: TextStyle(
          fontFamily: "Montserrat", fontWeight: FontWeight.w500, fontSize: 14),
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 5, 60, 20),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithDesc(
            title: "Beneficial features of MPost\n\nChoose: ",
            description:
                "Choose the most convenient post office where you can receive your letters, documents or parcels.",
            italicTitle: false),
        TitleWithDesc(
            title: "Notify: ",
            description:
                "Get SMS alerts notifying you when you have received a mail or a package at the Post Office.",
            italicTitle: false),
        TitleWithDesc(
            title: "Deliver: ",
            description:
                "Grab your own mail or get it delivered to you. You control how you get your mail.",
            italicTitle: false),
      ],
    ),
    actionsPadding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
    actions: [
      InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3), border: Border.all()),
          child: const Text(
            "OK",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
        ),
      ),
    ],
  );
}

class ShimmerBox extends StatelessWidget {
  double height, width;
  Widget? child;
  ShimmerBox({Key? key, required this.height, required this.width, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[50]!,
        highlightColor: Colors.grey[300]!,
        period: Duration(seconds: 2),
        child: Container(
          child: child,
          width: width,
          height: height,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 20)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(height <= 50 ? 100 : 10)),
        ));
  }
}
