import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/curriculum_widget.dart';
import '../../view_model/courses_dtl_controller.dart';


class CirrculamCategoryScreen extends StatelessWidget {

  final CoursesDtlController _controller= Get.find<CoursesDtlController>();

   CirrculamCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(

          children: [
            ListView.builder(
                itemCount:_controller.cirriculumList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CurriculumCard(
                    sectiontitle: _controller.cirriculumList[index].curriculum.toString(),
                    datalist: _controller.cirriculumList[index].videos!,
                  );
                })
          ],
        ),
      ),
    );
  }
}
