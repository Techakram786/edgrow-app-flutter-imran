import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../widget/loader/loader.dart';
import '../../../widgets/home_screen_widgets.dart';
import '../view_model/top_courses_controller.dart';


class TopCourseTrainingViewScreen extends StatefulWidget {
  const TopCourseTrainingViewScreen({super.key});

  @override
  State<TopCourseTrainingViewScreen> createState() =>
      _TopCourseTrainingViewScreenState();
}

class _TopCourseTrainingViewScreenState
    extends State<TopCourseTrainingViewScreen> {

  final TopCoursesController _controller =
  Get.put(TopCoursesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: whitecolor,
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
            title: 'Top Courses in Training',
            textColor: normalblack,
            textSize: 16,
            textweight: FontWeight.w600,
          ),
          titleSpacing: -3,
        ),
        body: Obx(
          () => Loader.screenLoader(
            loading: _controller.screenLoader.value,
            myWidget: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: _controller.topCoursesList.length,
              itemBuilder: (_, i) {
                return AnimationConfiguration.staggeredList(
                  position: i,
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 675),
                    verticalOffset: 150.0,
                    child: TopCoursesTrainingCard(
                      trainingimage: _controller.topCoursesList[i].courseImage ?? '',
                      trainingname: _controller.topCoursesList[i].courseTitle ?? '',
                      rating: _controller.topCoursesList[i].rating ?? '',
                      ratingvalue: '5',
                      amount: _controller.topCoursesList[i].sellingPrice ?? '',
                      ratingamount: _controller.topCoursesList[i].ratingCount ?? '',
                      starLength: 5,
                      isseller: true,
                      trainingtap: () {},
                      trainintype:_controller.topCoursesList[i].tagName ?? '',
                      tagtap: () async{
                        if(_controller.topCoursesList[i].saveStatus!){
                          var apiStatus = await _controller.setRemovedItemApi(itemId: _controller.topCoursesList[i].id.toString(), itemType:'course');
                          if(apiStatus){
                            _controller.topCoursesList[i].saveStatus=!_controller.topCoursesList[i].saveStatus!;
                            _controller.topCoursesList.refresh();
                          }
                        }else{
                          var apiStatus = await _controller.setSavedItemApi(itemId:_controller.topCoursesList[i].id.toString(), itemType:'course');
                          if(apiStatus){
                            _controller.topCoursesList[i].saveStatus=!_controller.topCoursesList[i].saveStatus!;
                            _controller.topCoursesList.refresh();
                          }
                        }
                      },
                      icontag: _controller.topCoursesList[i].saveStatus  == false
                          ? 'assets/icons/tagicon.svg'
                          : 'assets/icons/filltag.svg',
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 10,
              ),
            ),
          ),
        ));
  }
}
