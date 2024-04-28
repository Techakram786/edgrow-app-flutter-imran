

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../commons/common_colors.dart';
import '../../../../../../../commons/common_widgets.dart';
import '../../../../../home/widgets/responsability_view_widgets.dart';
import '../../view_model/courses_dtl_controller.dart';

class CourseIncludesScreen extends StatelessWidget {
   CourseIncludesScreen({super.key});
  final CoursesDtlController _controller= Get.find<CoursesDtlController>();


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
          ],
        ),
      ),
    );
  }
}
