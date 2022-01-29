import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

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
              height: 55,
              width: 55,
            ),
          ),
        ),
        Text(
          widget.title,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: 16),
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
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0XFFFf4f4f4),
          borderRadius: BorderRadius.circular(15)),
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
                    fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ],
          ),
          Icon(
            widget.icon,
            color: Colors.black,
            size: 40,
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
            margin: const EdgeInsets.only(bottom: 20),
            height: 200,
            width: Constants.getWidth(context) * 0.85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(widget.poster))),
          ),
          Text(
            widget.location,
            style: TextStyle(
                color: Constants.descriptionColor,
                fontFamily: "Montserrat",
                fontSize: 16),
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
                fontSize: 20),
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
  initState() {
    var str = widget.title.split(' ');
    widget.title = "";
    for (int i = 0; i < str.length; i++) {
      if (i < 4) {
        widget.title += str[i] + " ";
      }
    }
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 200,
            width: Constants.getWidth(context) * 0.41,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(widget.poster))),
          ),
          Text(
            widget.category,
            style: TextStyle(
                color: Constants.descriptionColor,
                fontFamily: "Montserrat",
                fontSize: 16),
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
                fontSize: 20),
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
                fontSize: 22),
          ),
          Icon(
            widget.icon == CupertinoIcons.arrow_right
                ? CupertinoIcons.arrow_right
                : null,
            size: 35,
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
      width: Constants.getWidth(context) * 0.29,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color(0XFFFf4f4f4),
          borderRadius: BorderRadius.circular(15)),
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
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          const SizedBox(
            height: 0,
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
                fontSize: 14),
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
                width: 50,
                height: 50,
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
                margin: const EdgeInsets.only(bottom: 20),
                height: 200,
                width: Constants.getWidth(context) * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                    fontWeight: FontWeight.w600,
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
                fontSize: 20),
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
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(15),
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
                      fontSize: 25),
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
                      fontSize: 18),
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
