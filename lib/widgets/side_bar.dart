import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_bmi_calculator/constants/app_constants.dart';

class SideBar extends StatelessWidget {
  final double barWidth;
  final double barHeight;
  final MainAxisAlignment align;
  double topLeft = 0;
  double topRight = 0;
  double bottomLeft = 0;
  double bottomRight = 0;

  SideBar({Key? key, required this.barHeight, required this.barWidth, required this.align, required this.topLeft, required this.topRight, required this.bottomLeft, required this.bottomRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: align,
      children: [
        Container(
          width: barWidth,
          height: barHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight),
                topRight: Radius.circular(topRight),
              ),
              color: accentHexColor),
        )
      ],
    );
  }
}
