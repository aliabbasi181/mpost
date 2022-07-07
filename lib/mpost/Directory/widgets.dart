import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/widgets.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerBox(height: 180, width: Constants.getWidth(context) * 0.43),
        SizedBox(
          height: 10,
        ),
        ShimmerBox(height: 10, width: Constants.getWidth(context) * 0.2),
        SizedBox(
          height: 5,
        ),
        ShimmerBox(height: 10, width: Constants.getWidth(context) * 0.3),
        SizedBox(
          height: 15,
        ),
        ShimmerBox(height: 15, width: Constants.getWidth(context) * 0.35),
      ],
    );
  }
}
