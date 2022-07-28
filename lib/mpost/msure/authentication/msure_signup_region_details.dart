import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesCountryModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesRegionModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesStagesModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesSub_CountryModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesWardModel.dart';
import 'package:mpost/mpost/msure/authentication/msure_signup.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:provider/provider.dart';

class MSURESignupRegionDetail extends StatefulWidget {
  const MSURESignupRegionDetail({Key? key}) : super(key: key);

  @override
  State<MSURESignupRegionDetail> createState() =>
      _MSURESignupRegionDetailState();
}

class _MSURESignupRegionDetailState extends State<MSURESignupRegionDetail> {
  FocusNode nameFocusNode = new FocusNode();
  FocusNode surNameFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode confirmPasswordFocusNode = new FocusNode();
  FocusNode idNumberFocusNode = new FocusNode();
  FocusNode ntsaNumberFocusNode = new FocusNode();
  FocusNode phoneFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode locationFocusNode = new FocusNode();
  TextEditingController name = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController ntsNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  File? image;
  bool passwordHide = true, confirmPasswordHide = true;
  String dateOfBirth = "";
  MsurePlacesRegionModel selectedRegion = MsurePlacesRegionModel();
  MsurePlacesSub_CountryModel selectedSubCounty = MsurePlacesSub_CountryModel();
  MsurePlacesWardModel selectedWard = MsurePlacesWardModel();
  MsurePlacesStagesModel selectedStage = MsurePlacesStagesModel();
  MsurePlacesCountryModel selectedCounty = MsurePlacesCountryModel();
  List<MsurePlacesRegionModel> regions = [];
  MsurePlacesCountryModel county = MsurePlacesCountryModel();
  MsurePlacesSub_CountryModel subCounty = MsurePlacesSub_CountryModel();
  MsurePlacesWardModel wards = MsurePlacesWardModel();
  MsurePlacesStagesModel stages = MsurePlacesStagesModel();
  SubCounties subCounties2 = SubCounties();
  Counties county2 = Counties();
  Wards wards2 = Wards();
  Stages stage2 = Stages();

  @override
  void initState() {
    _getRegions();
    super.initState();
  }

  _getRegions() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    Constants.showLoader("Fetching regions...");
    regions = await msureApplicationBloc.getRegions();
    EasyLoading.dismiss();
    county2 = Counties();
    subCounties2 = SubCounties();
    wards2 = Wards();
    stage2 = Stages();
  }

  _getCounty() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    Constants.showLoader("Please wait...");
    county = await msureApplicationBloc.getCounty(selectedRegion.id);
    EasyLoading.dismiss();
    setState(() {
      subCounties2 = SubCounties();
      wards2 = Wards();
      stage2 = Stages();
    });
  }

  _getSubCounty() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    Constants.showLoader("Please wait...");
    subCounty = await msureApplicationBloc.getSubCounty(county2.id);
    EasyLoading.dismiss();
    setState(() {
      wards2 = Wards();
      stage2 = Stages();
    });
  }

  _getWards() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    Constants.showLoader("Please wait...");
    wards = await msureApplicationBloc.getWards(subCounties2.id);
    EasyLoading.dismiss();
    setState(() {
      stage2 = Stages();
    });
  }

  _getStages() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    Constants.showLoader("Please wait...");
    stages = await msureApplicationBloc.getStages(wards2.id);
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        color: Constants.msureRed,
        child: SafeArea(bottom: false, child: Container()),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up: Region Details",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                RichText(
                    text: TextSpan(
                  text:
                      "Thank you for your interest in the MSURE Insurance application! \n\nAs a first step, please enter your stage location information details, below. ",
                  style: TextStyle(
                      height: 1.5,
                      color: Color(0xff808689),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                )),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: selectedRegion.name != null,
                  child: Text(
                    "Region",
                    style: TextStyle(
                        height: 1.5,
                        color: Constants.msureRed,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      selectedRegion = await showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              height: 500,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: SafeArea(
                                top: false,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Select Region",
                                            style: const TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              color: Constants.msureRed,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: regions.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              ListTile(
                                                minLeadingWidth: 0,
                                                onTap: () {
                                                  Navigator.pop(
                                                      context, regions[index]);
                                                },
                                                title: Text(
                                                  regions[index]
                                                      .name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              const Divider(
                                                color: Color(0XFFFeceef0),
                                                thickness: 1,
                                                height: 0,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                      _getCounty();
                      setState(() {
                        county2 = Counties();
                        subCounties2 = SubCounties();
                        wards2 = Wards();
                        stage2 = Stages();
                      });
                    } catch (ex) {}
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffCBCBCB), width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedRegion.name == null
                                ? "Region"
                                : selectedRegion.name.toString(),
                            style: TextStyle(
                                color: selectedRegion.name == null
                                    ? const Color(0xffCBCBCB)
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        selectedRegion.name != null
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedRegion = MsurePlacesRegionModel();
                                    stage2 = Stages();
                                    county2 = Counties();
                                    wards2 = Wards();
                                    subCounties2 = SubCounties();
                                  });
                                },
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Constants.msureRed,
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.grey.withOpacity(0.7),
                              )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: county2.name != null,
                  child: Text(
                    "County",
                    style: TextStyle(
                        height: 1.5,
                        color: Constants.msureRed,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      if (selectedRegion.name == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Constants.msureRed,
                            content: Text(
                              "Please select Region.",
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )));
                        return;
                      }
                      county2 = await showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              height: 500,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: SafeArea(
                                top: false,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Select county",
                                            style: const TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              color: Constants.msureRed,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: county.counties == null
                                            ? 0
                                            : county.counties!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              ListTile(
                                                minLeadingWidth: 0,
                                                onTap: () {
                                                  Navigator.pop(context,
                                                      county.counties![index]);
                                                },
                                                title: Text(
                                                  county.counties![index].name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              const Divider(
                                                color: Color(0XFFFeceef0),
                                                thickness: 1,
                                                height: 0,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                      setState(() {
                        subCounties2 = SubCounties();
                        wards2 = Wards();
                        stage2 = Stages();
                      });
                      _getSubCounty();
                    } catch (ex) {
                      print(ex);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffCBCBCB), width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            county2.name == null
                                ? "County"
                                : county2.name.toString(),
                            style: TextStyle(
                                color: county2.name == null
                                    ? const Color(0xffCBCBCB)
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        county2.name != null
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    stage2 = Stages();
                                    county2 = Counties();
                                    wards2 = Wards();
                                    subCounties2 = SubCounties();
                                  });
                                },
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Constants.msureRed,
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.grey.withOpacity(0.7),
                              )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: subCounties2.name != null,
                  child: Text(
                    "Sub-county",
                    style: TextStyle(
                        height: 1.5,
                        color: Constants.msureRed,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      if (county2.name == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Constants.msureRed,
                            content: Text(
                              "Please select County.",
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )));
                        return;
                      }
                      subCounties2 = await showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              height: 500,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: SafeArea(
                                top: false,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Select sub-county",
                                            style: const TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              color: Constants.msureRed,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: subCounty.subCounties == null
                                            ? 0
                                            : subCounty.subCounties!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              ListTile(
                                                minLeadingWidth: 0,
                                                onTap: () {
                                                  Navigator.pop(
                                                      context,
                                                      subCounty
                                                          .subCounties![index]);
                                                },
                                                title: Text(
                                                  subCounty
                                                      .subCounties![index].name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              const Divider(
                                                color: Color(0XFFFeceef0),
                                                thickness: 1,
                                                height: 0,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                      setState(() {
                        wards2 = Wards();
                        stage2 = Stages();
                      });
                      _getWards();
                    } catch (ex) {
                      print(ex);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffCBCBCB), width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            subCounties2.name == null
                                ? "Subcounty"
                                : subCounties2.name.toString(),
                            style: TextStyle(
                                color: subCounties2.name == null
                                    ? const Color(0xffCBCBCB)
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        subCounties2.name != null
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    stage2 = Stages();
                                    wards2 = Wards();
                                    subCounties2 = SubCounties();
                                  });
                                },
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Constants.msureRed,
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.grey.withOpacity(0.7),
                              )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: wards2.name != null,
                  child: Text(
                    "Ward",
                    style: TextStyle(
                        height: 1.5,
                        color: Constants.msureRed,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      if (subCounties2.name == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Constants.msureRed,
                            content: Text(
                              "Please select Sub-county.",
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )));
                        return;
                      }
                      wards2 = await showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              height: 500,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: SafeArea(
                                top: false,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Select ward",
                                            style: const TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              color: Constants.msureRed,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: wards.wards == null
                                            ? 0
                                            : wards.wards!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              ListTile(
                                                minLeadingWidth: 0,
                                                onTap: () {
                                                  Navigator.pop(context,
                                                      wards.wards![index]);
                                                },
                                                title: Text(
                                                  wards.wards![index].name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              const Divider(
                                                color: Color(0XFFFeceef0),
                                                thickness: 1,
                                                height: 0,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                      setState(() {
                        stage2 = Stages();
                      });
                      _getStages();
                    } catch (ex) {
                      print(ex);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffCBCBCB), width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            wards2.name == null
                                ? "Ward"
                                : wards2.name.toString(),
                            style: TextStyle(
                                color: wards2.name == null
                                    ? const Color(0xffCBCBCB)
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        wards2.name != null
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    stage2 = Stages();
                                    wards2 = Wards();
                                  });
                                },
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Constants.msureRed,
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.grey.withOpacity(0.7),
                              )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: stage2.name != null,
                  child: Text(
                    "Stage",
                    style: TextStyle(
                        height: 1.5,
                        color: Constants.msureRed,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      if (wards2.name == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Constants.msureRed,
                            content: Text(
                              "Please select Ward.",
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )));
                        return;
                      }
                      stage2 = await showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              height: 500,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: SafeArea(
                                top: false,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Select stage",
                                            style: const TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              color: Constants.msureRed,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: stages.stages == null
                                            ? 0
                                            : stages.stages!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              ListTile(
                                                minLeadingWidth: 0,
                                                onTap: () {
                                                  Navigator.pop(context,
                                                      stages.stages![index]);
                                                },
                                                title: Text(
                                                  stages.stages![index].name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              const Divider(
                                                color: Color(0XFFFeceef0),
                                                thickness: 1,
                                                height: 0,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                      setState(() {});
                    } catch (ex) {
                      print(ex);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffCBCBCB), width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            stage2.name == null
                                ? "Stage"
                                : stage2.name.toString(),
                            style: TextStyle(
                                color: stage2.name == null
                                    ? const Color(0xffCBCBCB)
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        stage2.name != null
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    stage2 = Stages();
                                  });
                                },
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Constants.msureRed,
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.grey.withOpacity(0.7),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SafeArea(
          bottom: Platform.isAndroid,
          top: false,
          child: InkWell(
            onTap: () async {
              if (stage2.name != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MSURESignup(
                              stageId: stage2.id,
                            )));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Constants.msureRed,
                    content: Text(
                      "Please select Region Details.",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )));
                return;
              }
              // if (name.text.isEmpty) {
              //   showSnackBar("Validation!", "Name can not be empty.", context);
              //   return;
              // }
              // if (idNumber.text.isEmpty) {
              //   showSnackBar(
              //       "Validation!", "ID Number can not be empty.", context);
              //   return;
              // }
              // if (ntsNumber.text.isEmpty) {
              //   ntsNumber.text = "null";
              // }
              // if (phoneNumber.text.isEmpty) {
              //   showSnackBar(
              //       "Validation!", "Phone number can not be empty.", context);
              //   return;
              // }
              // if (email.text.isEmpty) {
              //   showSnackBar("Validation!", "Email can not be empty.", context);
              //   return;
              // }
              // if (location.text.isEmpty) {
              //   showSnackBar(
              //       "Validation!", "Location can not be empty.", context);
              //   return;
              // }
              // if (password.text.isEmpty) {
              //   showSnackBar(
              //       "Validation!", "Password can not be empty.", context);
              //   return;
              // }
              // if (confirmPassword.text.isEmpty) {
              //   showSnackBar("Validation!",
              //       "Confirm Password can not be empty.", context);
              //   return;
              // }
              // if (password.text != confirmPassword.text) {
              //   showSnackBar("Validation!",
              //       "Password and confirm password are not same.", context);
              //   return;
              // }

              // final msureApplicationBloc =
              //     Provider.of<MSUREApplicationBloc>(context, listen: false);
              // if (await msureApplicationBloc.msureRegister(
              //     name.text,
              //     surName.text,
              //     phoneNumber.text,
              //     email.text,
              //     password.text,
              //     idNumber.text,
              //     dateOfBirth,
              //     location.text,
              //     ntsNumber.text)) {
              //   Navigator.pushNamed(context, '/msure_home');
              // }
            },
            child: Container(
              width: Constants.getWidth(context),
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xff1582BE),
                    const Color(0xff00C0C4),
                  ]),
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                "Next",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}
