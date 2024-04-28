import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../screens/course_dtl/model/VideoData.dart';

class CurriculumCard extends StatelessWidget {
  final String sectiontitle;
  final List<VideosData> datalist;
  const CurriculumCard({super.key,
    required this.sectiontitle,
    required this.datalist,
  }
     );

  @override
  Widget build(BuildContext context) {
    RxBool isaddtap = false.obs;
    RxBool isvideotap = true.obs;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LatoCommonTextWidget(
                  title: sectiontitle,
                  textColor: normalblack,
                  textSize: 12,
                  textweight: FontWeight.w600),
              IconButton(
                  onPressed: () {
                    isaddtap.value = !isaddtap.value;
                  },
                  icon: isaddtap.value
                      ? const Icon(
                          Icons.minimize_outlined,
                          size: 16,
                          color: appThemecolor,
                        )
                      : const Icon(
                          Icons.add_circle_outline,
                          size: 16,
                          color: appThemecolor,
                        ))
            ],
          ),
          //list
          isaddtap.value
              ? Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          itemCount: datalist.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (_, i) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LatoCommonTextWidget(
                                            title: datalist[i].title.toString(),
                                            textColor: responsetextclr,
                                            textSize: 12,
                                            textweight: FontWeight.w400),
                                        LatoCommonTextWidget(
                                            title:datalist[i].videoLength.toString(),
                                            textColor: normalblack,
                                            textSize: 12,
                                            textweight: FontWeight.w400),
                                      ],
                                    ),
                                    Obx(
                                      () => Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                isvideotap.value =
                                                    !isvideotap.value;
                                              },
                                              icon: isvideotap.value
                                                  ? SvgPicture.asset(
                                                      'assets/icons/videoplaycircle.svg')
                                                  : SvgPicture.asset(
                                                      'assets/icons/lockcircle.svg'))
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          })
                    ],
                  ),
                )
              : const SizedBox(
                  height: 0,
                )
        ],
      ),
    );
  }
}
