import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../../../home/widgets/responsability_view_widgets.dart';
import '../../../../widgets/curriculum_widget.dart';
import '../../view_model/courses_dtl_controller.dart';

class CategoryDescriptionScreen extends StatelessWidget {
  final CoursesDtlController _controller= Get.find<CoursesDtlController>();

  Rx<bool> isaddval = false.obs;

  CategoryDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          // shrinkWrap: true,
          // scrollDirection: Axis.vertical,
          // physics: ScrollPhysics(),
          children: [
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/descrp.svg'),
                      const SizedBox(
                        width: 6,
                      ),
                      const LatoCommonTextWidget(
                          title: 'Description',
                          textColor: normalblack,
                          textSize: 16,
                          textweight: FontWeight.w700),
                    ],
                  ),
                 /* ListView.separated(
                    shrinkWrap: true,
                    itemCount: 5,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_, i) {
                      return ResponsibilitesWidget(
                        rolestext:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has Ipsum is simply dummy text of the printing and typesetting industry.",
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 6,
                      );
                    },
                  ),*/
                  HtmlWidget(
                    textStyle: const TextStyle(
                        fontSize: 12),
                    '${_controller.coursesDtlModel?.description}',
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const DividerLine(lineHeight: 1, dividercolor: Color(0xFfE9E9E9)),
            const SizedBox(
              height: 6,
            ),
            //this courses includes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/qualify.svg'),
                      const SizedBox(
                        width: 6,
                      ),
                      const LatoCommonTextWidget(
                          title: 'This Courses Includes',
                          textColor: normalblack,
                          textSize: 16,
                          textweight: FontWeight.w700),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: _controller.coursesIncudesList.length,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i) {
                      return ResponsibilitesWidget(
                        rolestext:
                           _controller.coursesIncudesList[i],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 6,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const DividerLine(lineHeight: 1, dividercolor: Color(0xFfE9E9E9)),
            const SizedBox(
              height: 6,
            ),
            //Curriculum
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/qualify.svg'),
                      const SizedBox(
                        width: 6,
                      ),
                      const LatoCommonTextWidget(
                          title: 'Curriculum',
                          textColor: normalblack,
                          textSize: 16,
                          textweight: FontWeight.w700),
                    ],
                  ),
                  //sections

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LatoCommonTextWidget(
                          title: '${_controller.coursesDtlModel?.sectionsCount} Sections',
                          textColor: responsetextclr,
                          textSize: 11,
                          textweight: FontWeight.w400),
                      const SizedBox(
                        width: 3,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.circle,
                          size: 10,
                          color: responsetextclr,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      LatoCommonTextWidget(
                          title: '${_controller.coursesDtlModel?.classesCount} Classes',
                          textColor: responsetextclr,
                          textSize: 11,
                          textweight: FontWeight.w400),
                      const SizedBox(
                        width: 3,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.circle,
                          size: 10,
                          color: responsetextclr,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      LatoCommonTextWidget(
                          title: '${_controller.coursesDtlModel?.classesLength} Hrs Class',
                          textColor: responsetextclr,
                          textSize: 11,
                          textweight: FontWeight.w400),
                    ],
                  ),

                  //listview
                  ListView.builder(
                      itemCount:_controller.cirriculumList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return CurriculumCard(
                          sectiontitle: _controller.cirriculumList[index].curriculum.toString(),
                          datalist: _controller.cirriculumList[index].videos!,
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
