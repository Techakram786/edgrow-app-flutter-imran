import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OpeningsJobViewScreen extends StatelessWidget {
  final String? opening;
  const OpeningsJobViewScreen({super.key, required this.opening});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/Openings.svg',
                height: 13,
              ),
              const SizedBox(
                width: 8,
              ),
              const LatoCommonTextWidget(
                  title: 'Openings',
                  textColor: normalblack,
                  textSize: 12,
                  textweight: FontWeight.w700),
            ],
          ),
          LatoCommonTextWidget(
              title: '$opening Openings',
              textColor: responsetextclr,
              textSize: 10,
              textweight: FontWeight.w400),
        ],
      ),
    );
  }
}
