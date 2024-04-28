import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../commons/common_colors.dart';

class TripSteperCard extends StatelessWidget {
  final String titlename, time;
  final String checkstatus;
  final String borderline;
  const TripSteperCard(
      {super.key,
      required this.titlename,
      required this.time,
      required this.checkstatus,
      required this.borderline});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            checkstatus == 'placed'
                    ? const Icon(
                        Icons.check_circle,
                        color: green,
                        size: 20,
                      )
                    :checkstatus == 'reject'?
                     SvgPicture.asset(
                        'assets/icons/rejectclr.svg',
                        height: 18,
                      ):const Icon(
              Icons.check_circle,
              color: appThemecolor,
              size: 20,
            ),
            borderline == 'yes'
                ? const DottedDashedLine(
                    height: 50,
                    width: 2,
                    axis: Axis.vertical,
                    dashColor: appThemecolor,
                  )
                // DottedDashedLine(
                //     height: 30,
                //     width: indexw == itemlength - 1 ? 0 : 2,
                //     axis: Axis.vertical,
                //     dashColor: const Color(0xFFB3B3B3),
                //   )
                : const SizedBox(
                    height: 0,
                  ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LatoCommonTextWidget(
                title: titlename,
                textColor: normalblack,
                textSize: 13,
                textweight: FontWeight.w600),
            LatoCommonTextWidget(
                title: time,
                textColor: normalblack,
                textSize: 10,
                textweight: FontWeight.w400),
          ],
        )

        // Expanded(
        //   child: Container(
        //     // height: 25,
        //     color: Colors.blue,
        //     width: indexw == itemlength - 1 ? 0 : 2,
        //   ),
        // ),
      ],
    );
  }
}
