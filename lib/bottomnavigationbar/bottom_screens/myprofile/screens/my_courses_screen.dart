import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../controllers/course_controller.dart';
import '../widgets/courses_card.dart';
import 'courses_view_details_screen.dart';

class MyCoursesScreen extends StatelessWidget {
  final CourseControllerLog _courseControllerLog =
      Get.put(CourseControllerLog());
  MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whitecolor,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/arrowback.svg'),
            ),
          ),
          elevation: 0,
          title: const LatoCommonTextWidget(
            title: 'My Courses',
            textColor: normalblack,
            textSize: 16,
            textweight: FontWeight.w600,
          ),
          titleSpacing: -3,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: normalblack,
                  size: 25,
                ),
              ),
            )
          ],
        ),
        body: Obx(
          () => ListView.separated(
            shrinkWrap: true,
            itemCount: _courseControllerLog.mycourselist.length,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, i) {
              return MyCourseCard(
                imagePic: _courseControllerLog.mycourselist[i].imageurl,
                jobTitle: _courseControllerLog.mycourselist[i].toptitle,
                percentage: _courseControllerLog.mycourselist[i].percntagevale,
                minHeightVal: 8,
                indicatorval: _courseControllerLog.mycourselist[i].value,
                courseTap: () {
                  Get.to(() => const CoursesViewDetailsScreen());
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const DividerLine(lineHeight: 1, dividercolor: Color(0xFFCACACA)),
          ),
        ));
  }
}
