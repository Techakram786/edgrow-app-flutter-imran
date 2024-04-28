

import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../commons/routes/routes_name.dart';
import '../../../../../widget/loader/loader.dart';
import '../../../../controller/bottomnavbar_controller.dart';

import '../../../home/widgets/home_screen_widgets.dart';


import '../../widgets/companies_card.dart';

class AllShortlistItemsScreen extends StatelessWidget {
  AllShortlistItemsScreen({super.key});
  final BottomNavigationController _controllerShortList = Get.find<BottomNavigationController>();



  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Loader.screenLoader(
        loading: _controllerShortList.screenLoader.value,
        myWidget: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            physics: const BouncingScrollPhysics(),
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LatoCommonTextWidget(
                          title: 'Jobs you have Saved',
                          textColor: normalblack,
                          textSize: 14,
                          textweight: FontWeight.w600),
                      LatoCommonTextWidget(
                          title: "${_controllerShortList.savedItemModel?.jobsCount ?? ''} Results",
                          textColor: appThemecolor,
                          textSize: 12,
                          textweight: FontWeight.w600),
                    ],
                  ),
                  const LatoCommonTextWidget(
                      title: '',
                      textColor: appThemecolor,
                      textSize: 12,
                      textweight: FontWeight.w600),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => ListView.builder(
                    itemCount: _controllerShortList.savedJobList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, i) {
                      return AnimationConfiguration.staggeredList(
                        position: i,
                        child: SlideAnimation(
                          duration: const Duration(milliseconds: 675),
                          verticalOffset: 150.0,
                          child: RecommendedJobsCard(
                            imagelogo: _controllerShortList.savedJobList[i].instituteLogo.toString(),
                            companyname: _controllerShortList.savedJobList[i].instituteName.toString(),
                            daysstatus: _controllerShortList.savedJobList[i].postedOn.toString(),
                            title: _controllerShortList.savedJobList[i].jobTitle.toString(),
                            location: _controllerShortList.savedJobList[i].location.toString(),
                            timestatus: _controllerShortList.savedJobList[i].jobType.toString(),
                            applytap: () {
                              Get.toNamed(RoutesName.jobDetailsScreen,arguments: {'jobId':_controllerShortList.trendingJobList[i].id.toString()});
                            },
                            expstatus:'${_controllerShortList.savedJobList[i].minExperience}-${_controllerShortList.savedJobList[i].maxExperience} Exp',
                            isexp: true,
                            tagicontap: () async{
                              var apiStatus = await _controllerShortList.setRemovedItemApi(itemId: _controllerShortList.savedJobList[i].id.toString(), itemType:'job');
                              if(apiStatus){
                                _controllerShortList.savedJobList.clear();
                                _controllerShortList.getSavedItemApi(type: 'all', page: '1', callType: 'scroll');
                              }
                            },
                            tagicon: 'assets/icons/filltag.svg',
                            bottommargin: 10,
                            rightmargin: 0,
                          ),
                        ),
                      );
                    }),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LatoCommonTextWidget(
                          title: 'Companies you have Saved',
                          textColor: normalblack,
                          textSize: 14,
                          textweight: FontWeight.w600),
                      LatoCommonTextWidget(
                          title: "${_controllerShortList.savedItemModel?.companiesCount ?? ''} Results",
                          textColor: appThemecolor,
                          textSize: 12,
                          textweight: FontWeight.w600),
                    ],
                  ),
                  const LatoCommonTextWidget(
                      title: '',
                      textColor: appThemecolor,
                      textSize: 12,
                      textweight: FontWeight.w600),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: _controllerShortList.savedCompanyList.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: (){
                          Get.toNamed(RoutesName.collegeViewScreen,arguments: {'collegeId':_controllerShortList.savedCompanyList[i].id.toString()});
                        },
                        child: ComapnySavedCard(
                          logopic:  _controllerShortList.savedCompanyList[i].instituteLogo.toString(),
                          title:  _controllerShortList.savedCompanyList[i].instituteName.toString(),
                          location:  '${_controllerShortList.savedCompanyList[i].cityName},${_controllerShortList.savedCompanyList[i].countryName}',
                          tagicontap: () async {
                            var apiStatus = await _controllerShortList.setRemovedItemApi(itemId: _controllerShortList.savedCompanyList[i].id.toString(), itemType:'company');
                            if(apiStatus){
                              _controllerShortList.savedCompanyList.clear();
                              _controllerShortList.getSavedItemApi(type: 'all', page: '1', callType: 'scroll');
                            }
                          },
                          tapicon: 'assets/icons/filltag.svg',
                        ),
                      );
                    }),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LatoCommonTextWidget(
                          title: 'Courses you have Saved',
                          textColor: normalblack,
                          textSize: 14,
                          textweight: FontWeight.w600),
                      LatoCommonTextWidget(
                          title: "${_controllerShortList.savedItemModel?.coursesCount ?? ''} Results",
                          textColor: appThemecolor,
                          textSize: 12,
                          textweight: FontWeight.w600),
                    ],
                  ),
                  const LatoCommonTextWidget(
                      title: '',
                      textColor: appThemecolor,
                      textSize: 12,
                      textweight: FontWeight.w600),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  itemCount:_controllerShortList.savedCoursesList.length,
                  itemBuilder: (_, i) {
                    return TopCoursesTrainingCard(
                      trainingimage: _controllerShortList.savedCoursesList[i].courseImage.toString(),
                      trainingname: _controllerShortList.savedCoursesList[i].courseTitle.toString(),
                      rating: _controllerShortList.savedCoursesList[i].rating.toString(),
                      ratingvalue: '5',
                      amount: _controllerShortList.savedCoursesList[i].actualPrice.toString(),
                      ratingamount: _controllerShortList.savedCoursesList[i].ratingCount.toString(),
                      starLength: 5,
                      isseller: true,
                      trainingtap: () {
                        Get.toNamed(RoutesName.coursesDetailScreen,arguments: {'coursesId':_controllerShortList.savedCoursesList[i].id.toString()});
                      },
                      trainintype: _controllerShortList.savedCoursesList[i].tagName.toString(),
                      tagtap: () async{
                        var apiStatus = await _controllerShortList.setRemovedItemApi(itemId: _controllerShortList.savedCoursesList[i].id.toString(), itemType:'course');
                        if(apiStatus){
                          _controllerShortList.savedCoursesList.clear();
                          _controllerShortList.getSavedItemApi(type: 'all', page: '1', callType: 'scroll');
                        }
                      },
                      icontag:'assets/icons/filltag.svg',
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
