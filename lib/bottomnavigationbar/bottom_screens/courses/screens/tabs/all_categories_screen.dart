import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../Utils/empty_screen.dart';
import '../../../../../widget/loader/pagination_loader.dart';
import '../../../../controller/bottomnavbar_controller.dart';
import '../../../home/widgets/home_screen_widgets.dart';

class AllCategoriesCoursesScreen extends StatelessWidget {
  final BottomNavigationController _controllerCourses = Get.find<BottomNavigationController>();

  RxInt keyindex = 5.obs;

  AllCategoriesCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: const Color(0xFFFFFFFF),
      body: Obx(
        () => Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: () {
                            keyindex.value = 0;
                            // Get.to(() => FilterSelectionScreen());
                          },
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    width: 1, color: Colors.grey.shade300)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LatoCenterCommonTextWidget(
                                    title: 'Filter',
                                    textColor: keyindex.value == 0
                                        ? whitecolor
                                        : normalblack,
                                    textSize: 12,
                                    textweight: FontWeight.w500,
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/Filter.svg',
                                    color: keyindex.value== 0
                                        ? whitecolor
                                        : normalblack,
                                    // color: appbarColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),

                    // nearby
                    Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: () {
                            keyindex.value = 1;
                          },
                          child: Card(
                            color: keyindex.value == 1
                                ? appThemecolor
                                : whitecolor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    width: 1, color: Colors.grey.shade300)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              child: LatoCenterCommonTextWidget(
                                title: 'Sort By',
                                textColor: keyindex.value == 1
                                    ? whitecolor
                                    : normalblack,
                                textSize: 12,
                                textweight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),

                    //availble

                    Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: () {
                            keyindex.value = 2;
                          },
                          child: Card(
                            color: keyindex.value == 2
                                ? appThemecolor
                                : whitecolor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    width: 1, color: Colors.grey.shade300)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 07, vertical: 6),
                              child: LatoCenterCommonTextWidget(
                                title: 'Ratings',
                                textColor: keyindex.value == 2
                                    ? whitecolor
                                    : normalblack,
                                textSize: 12,
                                textweight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),

                    Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: () {
                            keyindex.value = 3;
                          },
                          child: Card(
                            semanticContainer: true,
                            color: keyindex.value == 3
                                ? appThemecolor
                                : whitecolor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    width: 1, color: Colors.grey.shade300)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 07, vertical: 6),
                              child: LatoCenterCommonTextWidget(
                                title: 'Low Cost',
                                textColor: keyindex.value == 3
                                    ? whitecolor
                                    : normalblack,
                                textSize: 12,
                                textweight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),
                  ],
                )),
            //list of all categories
            Flexible(
              child: ListView(
                children: [
                  _controllerCourses.coursesList.isNotEmpty?Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      controller: _controllerCourses.savedScrollController,
                      itemCount: _controllerCourses.pageLoader.value?_controllerCourses.coursesList.length+1:_controllerCourses.coursesList.length+1,
                      itemBuilder: (_, i) {
                        if(i<_controllerCourses.coursesList.length){
                          return AnimationConfiguration.staggeredList(
                            position: i,
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 675),
                              verticalOffset: 150.0,
                              child: TopCoursesTrainingCard(
                                  trainingimage: _controllerCourses.coursesList[i].courseImage.toString(),
                                  trainingname: _controllerCourses.coursesList[i].courseTitle.toString(),
                                  rating: _controllerCourses.coursesList[i].rating.toString(),
                                  ratingvalue: '5',
                                  amount: _controllerCourses.coursesList[i].sellingPrice.toString(),
                                  ratingamount: _controllerCourses.coursesList[i].ratingCount.toString(),
                                  starLength: 5,
                                  isseller: true,
                                  trainingtap: () {
                  
                                    Get.toNamed(RoutesName.coursesDetailScreen,arguments: {'coursesId':_controllerCourses.coursesList[i].id.toString()});
                                  },
                                  trainintype: _controllerCourses.coursesList[i].tagName.toString(),
                                  tagtap: () async{
                  
                                    if(_controllerCourses.coursesList[i].saveStatus!){
                                      var apiStatus = await _controllerCourses.setRemovedItemApi(itemId: _controllerCourses.coursesList[i].id.toString(), itemType:'course');
                                      if(apiStatus){
                                        _controllerCourses.coursesList[i].saveStatus=!_controllerCourses.coursesList[i].saveStatus!;
                                        _controllerCourses.coursesList.refresh();
                                      }
                                    }else{
                                      var apiStatus = await _controllerCourses.setSavedItemApi(itemId:_controllerCourses.coursesList[i].id.toString(), itemType:'course');
                                      if(apiStatus){
                                        _controllerCourses.coursesList[i].saveStatus=!_controllerCourses.coursesList[i].saveStatus!;
                                        _controllerCourses.coursesList.refresh();
                                      }
                                    }
                  
                  
                                  },
                                  icontag: _controllerCourses.coursesList[i].saveStatus!
                                      ? 'assets/icons/filltag.svg'
                                      :'assets/icons/tagicon.svg'
                              ),
                            ),
                          );
                        }else{
                          if(_controllerCourses.coursesCurrentItem < _controllerCourses.coursesTotalItem){
                            return PaginationLoading.loading();
                          }else{
                            return const SizedBox.shrink();
                          }
                        }
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                      const Padding(padding: EdgeInsets.only(right: 10,bottom: 10)),
                    ),
                  ):const EmptyScreen(title: 'No Data Found',),
                ]
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
