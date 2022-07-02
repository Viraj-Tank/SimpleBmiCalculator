import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:simple_bmi_calculator/constants/app_constants.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({Key? key,required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: barWidth,
          height: 25,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight:  Radius.circular(25),
                bottomRight: Radius.circular(25)
              ),
              color: accentHexColor
          ),
        )
      ],
    );
  }
}