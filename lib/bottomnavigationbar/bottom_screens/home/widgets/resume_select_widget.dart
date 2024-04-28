import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ResumeSelectWidget extends StatelessWidget {
  final String resumename;
  final Color radiobgcolor, resumecolor;
  final VoidCallback radiotap, deletetap;
  const ResumeSelectWidget(
      {super.key,
      required this.resumename,
      required this.radiobgcolor,
      required this.resumecolor,
      required this.radiotap,
      required this.deletetap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: radiotap,
          child: Row(
            children: [
              CircleAvatar(
                radius: 11,
                backgroundColor: normalblack,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: radiobgcolor,
                  child: const Icon(
                    Icons.circle,
                    color: whitecolor,
                    size: 13,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              LatoCommonTextWidget(
                  title: resumename,
                  textColor: resumecolor,
                  textSize: 12,
                  textweight: FontWeight.w600),
            ],
          ),
        ),
        InkWell(
          onTap: deletetap,
          child: SvgPicture.asset(
            'assets/icons/deleteresume.svg',
            height: 10,
          ),
        )
      ],
    );
  }
}
