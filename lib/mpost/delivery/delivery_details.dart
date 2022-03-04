import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({Key? key}) : super(key: key);

  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  String countryCode = "254";
  TextEditingController name = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController instructions = TextEditingController();
  TextEditingController phone = TextEditingController();
  String pickCategory = "";
  late DeliveryDetail deliveryDetail;
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      backgroundColor: const Color(0XFFFf8f9ff),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Constants.getHeight(context) * 0.83,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.white,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Expanded(
                              child: Text(
                                'Your Order',
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            onTap: () {},
                            minLeadingWidth: 0,
                            leading: const Icon(
                              CupertinoIcons.smallcircle_fill_circle_fill,
                              color: Color(0XFFF39bacd),
                              size: 30,
                            ),
                            title: const Text(
                              "Sender",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            Constants.user.fullName.toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            Constants.user.mobile.toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500),
                          ),
                          // Text(
                          //   Constants.user.addresses.toString(),
                          //   style: const TextStyle(
                          //       fontSize: 14,
                          //       fontFamily: "Montserrat",
                          //       fontWeight: FontWeight.w500),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListTile(
                            minLeadingWidth: 0,
                            contentPadding: const EdgeInsets.all(0),
                            onTap: () {},
                            leading: const Icon(
                              Icons.location_on_rounded,
                              color: Color(0XFFFbf157a),
                              size: 30,
                            ),
                            title: const Text(
                              "Recipient",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(color: Color(0XFFFeceef0)),
                              ),
                            ),
                            child: TextField(
                              controller: name,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat"),
                              decoration: const InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none,
                                  hintText: "Name*",
                                  hintStyle: TextStyle(
                                      color: Color(0XFFFbdbfc1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat")),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 6, top: 20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(color: Color(0XFFFeceef0)),
                              ),
                            ),
                            child: TextField(
                              controller: phone,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat"),
                              decoration: const InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none,
                                  hintText: "Phone Number*",
                                  hintStyle: TextStyle(
                                      color: Color(0XFFFbdbfc1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat")),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Order details",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Color(0XFFFeceef0),
                            thickness: 1,
                            height: 0,
                          ),
                          ListTile(
                            onTap: () async {
                              try {
                                pickCategory = await showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return SafeArea(
                                        bottom: false,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top:
                                                  Constants.getHeight(context) *
                                                      0.5),
                                          width: Constants.getWidth(context),
                                          height: Constants.getHeight(context),
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                          child: const PickCategory(),
                                        ),
                                      );
                                    });
                                setState(() {});
                              } catch (ex) {}
                            },
                            minLeadingWidth: 0,
                            leading: const Icon(
                              CupertinoIcons.cube_box_fill,
                              size: 20,
                            ),
                            title: Text(
                              pickCategory.isEmpty
                                  ? "Type of item"
                                  : pickCategory,
                              style: TextStyle(
                                  color: pickCategory.isEmpty
                                      ? Color(0XFFFbdbfc1)
                                      : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat"),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Color(0XFFFc1c1c1),
                              size: 25,
                            ),
                          ),
                          const Divider(
                            color: Color(0XFFFeceef0),
                            thickness: 1,
                            height: 0,
                          ),
                          TextField(
                            controller: note,
                            autocorrect: false,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat"),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Add a note to driver",
                                prefixIcon: Icon(
                                  CupertinoIcons.text_alignleft,
                                  size: 20,
                                ),
                                hintStyle: TextStyle(
                                    color: Color(0XFFFbdbfc1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat")),
                          ),
                          const Divider(
                            color: Color(0XFFFeceef0),
                            thickness: 1,
                            height: 0,
                          ),
                          TextField(
                            controller: instructions,
                            autocorrect: false,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat"),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Add a delivery instructions",
                                prefixIcon: Icon(
                                  Icons.mode_edit_outlined,
                                  size: 20,
                                ),
                                hintStyle: TextStyle(
                                    color: Color(0XFFFbdbfc1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat")),
                          ),
                          const Divider(
                            color: Color(0XFFFeceef0),
                            thickness: 1,
                            height: 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
                width: Constants.getWidth(context),
                decoration: const BoxDecoration(),
                child: InputButton(
                    label: "SAVE",
                    onPress: () {
                      if (name.text.isEmpty) {
                        showSnackBar("Validation error",
                            "Recipient name is required", context);
                        return;
                      } else if (phone.text.isEmpty) {
                        showSnackBar("Validation error",
                            "Recipient phone number is required", context);
                        return;
                      } else if (phone.text.length < 9) {
                        showSnackBar(
                            "Validation error",
                            "Phone number can not be less then 9 digits",
                            context);
                        return;
                      } else if (phone.text.length > 9) {
                        showSnackBar("Validation error",
                            "Phone number can not be up to 9 digits", context);
                        return;
                      } else if (pickCategory == "") {
                        showSnackBar("Validation error",
                            "Item type is required", context);
                        return;
                      }
                      deliveryDetail = DeliveryDetail(name.text, phone.text,
                          pickCategory, note.text, instructions.text);
                      Navigator.pop(context, deliveryDetail);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PickCategory extends StatefulWidget {
  const PickCategory({Key? key}) : super(key: key);

  @override
  _PickCategoryState createState() => _PickCategoryState();
}

class Category {
  String title, image;
  Category(this.image, this.title);
}

class _PickCategoryState extends State<PickCategory> {
  Color optionColor = Color(0XFFFbdbfc1);
  bool today = true, tomorrow = false;
  String selection = "";
  List<Category> categories = [];
  @override
  initState() {
    categories.add(Category("asset/images/document_icon.png", "Document"));
    categories.add(Category("asset/images/food_icon.png", "Food"));
    categories.add(Category("asset/images/clothing__icon.png", "Clothing"));
    categories
        .add(Category("asset/images/electronics_icon.png", "Electronics"));
    categories.add(Category("asset/images/fragile_icon.png", "Fragile"));
    categories.add(Category("asset/images/more-icon.png", "Other"));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        height: Constants.getHeight(context) * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Type of item',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              height: Constants.getHeight(context) * 0.4,
              child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          minLeadingWidth: 0,
                          onTap: () {
                            Navigator.pop(
                                context, categories[index].title.toString());
                          },
                          leading: Image(
                            image: AssetImage(categories[index].image),
                            width: 20,
                            height: 20,
                          ),
                          title: Text(
                            categories[index].title,
                            style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Divider(
                          color: Color(0XFFFeceef0),
                          thickness: 1,
                          height: 0,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
