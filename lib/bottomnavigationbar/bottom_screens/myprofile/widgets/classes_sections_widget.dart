import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ClassSectionCard extends StatelessWidget {
  final String sectiontitle, introductiontitle, videotext;

  final int countlist;
  final List datalist;
  final List videolist;
  const ClassSectionCard(
      {super.key,
      required this.sectiontitle,
      required this.countlist,
      required this.introductiontitle,
      required this.videotext,
      required this.datalist,
      required this.videolist});

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
              InkWell(
                onTap: () {},
                child: LatoCommonTextWidget(
                    title: sectiontitle,
                    textColor: normalblack,
                    textSize: 12,
                    textweight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: () {
                    isaddtap.value = !isaddtap.value;
                  },
                  icon: const Icon(
                    Icons.add,
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
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LatoCommonTextWidget(
                                                title: datalist[i].toString(),
                                                textColor: normalblack,
                                                textSize: 12,
                                                textweight: FontWeight.w400),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 6),
                                              child: Icon(
                                                Icons.check_circle,
                                                size: 10,
                                                color: appThemecolor,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: LatoCommonTextWidget(
                                              title:
                                                  'Video-${videolist[i].toString()}',
                                              textColor: normalblack,
                                              textSize: 11,
                                              textweight: FontWeight.w400),
                                        ),
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
