import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class DetailField extends StatelessWidget {
  String label, hint;
  TextEditingController controller;
  DetailField(
      {Key? key,
      required this.label,
      required this.hint,
      required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
              autocorrect: false,
              controller: controller,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
              decoration: InputDecoration(
                  labelText: label,
                  floatingLabelStyle: const TextStyle(
                      color: Color(0XFFFC4C4C4),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  labelStyle: const TextStyle(
                      color: Color(0XFFFC4C4C4),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                  hintText: hint))
        ],
      ),
    );
  }
}

// class PickCity extends StatefulWidget {
//   const PickCity({Key? key}) : super(key: key);

//   @override
//   _PickCityState createState() => _PickCityState();
// }

// class _PickCityState extends State<PickCity> {
//   late List<City> _cities = [];
//   @override
//   void initState() {
//     for (var item in Constants.kenyaCities) {
//       _cities.add(City(item['city'].toString(), item['lat'].toString(),
//           item['lng'].toString()));
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Select city',
//               style: TextStyle(
//                   fontFamily: "Montserrat",
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700),
//             ),
//             Container(
//               height: Constants.getHeight(context) * 0.45,
//               child: ListView.builder(
//                   itemCount: _cities.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         ListTile(
//                           minLeadingWidth: 0,
//                           onTap: () {
//                             Navigator.pop(
//                                 context, _cities[index].name.toString());
//                           },
//                           title: Text(
//                             _cities[index].name,
//                             style: const TextStyle(
//                                 fontFamily: "Montserrat",
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                         const Divider(
//                           color: Color(0XFFFeceef0),
//                           thickness: 1,
//                           height: 0,
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// 