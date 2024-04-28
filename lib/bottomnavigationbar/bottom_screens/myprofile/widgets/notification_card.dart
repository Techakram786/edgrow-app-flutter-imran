import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationCard extends StatelessWidget {
  final String maintitle, subtext, showtime;
  const NotificationCard(
      {super.key,
      required this.maintitle,
      required this.subtext,
      required this.showtime});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: textfeildborder),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/Notifications.svg',
              height: 38,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LatoCommonTextWidget(
                    title: maintitle,
                    textColor: normalblack,
                    textSize: 14,
                    textweight: FontWeight.w600),
                SizedBox(
                  width: 200,
                  child: LatoCommonTextWidget(
                      title: subtext,
                      textColor: hintcolor,
                      textSize: 8,
                      textweight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: LatoCommonTextWidget(
                    title: showtime,
                    textColor: normalblack,
                    textSize: 8,
                    textweight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
