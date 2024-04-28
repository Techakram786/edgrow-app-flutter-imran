import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class MyCourseCard extends StatelessWidget {
  final String imagePic, jobTitle, percentage;
  final double indicatorval, minHeightVal;
  final VoidCallback courseTap;
  const MyCourseCard(
      {super.key,
      required this.imagePic,
      required this.jobTitle,
      required this.indicatorval,
      required this.percentage,
      required this.minHeightVal,
      required this.courseTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: courseTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 95,
                    width: 114,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage(imagePic), fit: BoxFit.cover),
                        color: appThemecolor),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: LatoCommonTextWidget(
                            title: jobTitle,
                            textColor: normalblack,
                            textSize: 16,
                            textweight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        height: 10,
                        // width: MediaQuery.of(context).size.width * 0.58,
                        child: LinearProgressIndicator(
                          backgroundColor: const Color(0xFFD9D9D9),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            appThemecolor,
                          ),
                          value: indicatorval,
                          minHeight: minHeightVal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      LatoCommonTextWidget(
                          title: '$percentage% Complete',
                          textColor: appThemecolor,
                          textSize: 12,
                          textweight: FontWeight.w500)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
