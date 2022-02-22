import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/activity/activity_deliveries.dart';
import 'package:mpost/mpost/activity/activity_events.dart';
import 'package:mpost/mpost/activity/activity_shopping.dart';
import 'package:mpost/mpost/activity/activity_transport.dart';
import 'package:provider/provider.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  initState() {}
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      backgroundColor: const Color(0XFFFE5E5E5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'My Activity',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 27,
                      width: Constants.getHeight(context),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ActivityCategory.activityTabs.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < ActivityCategory.activityTabs.length;
                                    i++) {
                                  if (ActivityCategory.activityTabs[i].name ==
                                      ActivityCategory
                                          .activityTabs[index].name) {
                                    ActivityCategory
                                        .activityTabs[index].active = true;
                                  } else {
                                    ActivityCategory.activityTabs[i].active =
                                        false;
                                  }
                                }
                                setState(() {});
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 7, 15, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: ActivityCategory
                                              .activityTabs[index].active
                                          ? Constants.primaryColor
                                          : null),
                                  child: Text(
                                    ActivityCategory.activityTabs[index].name,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ActivityCategory
                                                .activityTabs[index].active
                                            ? Colors.white
                                            : const Color(0XFFF808689),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600),
                                  )),
                            );
                          }))),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          setActivity()
        ],
      ),
    );
  }
}

Widget setActivity() {
  ActivityCategory activeTab = ActivityCategory("null", false);
  for (var item in ActivityCategory.activityTabs) {
    if (item.active) {
      activeTab = item;
      break;
    }
  }
  if (activeTab.name != "null") {
    switch (activeTab.name) {
      case "Deliveries":
        return const ActivityDeliveries();
      case "Shopping":
        return const ActivityShopping();
      case "Events":
        return const ActivityEvents();
      case "Transport":
        return const ActivityTransport();
      default:
        return const SizedBox();
    }
  } else {
    return const SizedBox();
  }
}
