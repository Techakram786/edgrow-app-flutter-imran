

import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../../commons/common_colors.dart';
import '../../../../../../../../commons/common_widgets.dart';
import '../../../../../../../../widget/loader/loader.dart';
import '../../../../../../../../widget/loader/pagination_loader.dart';
import '../../../../../widgets/college_view_widgets.dart';

import '../view_model/colle_job_controller.dart';

// ignore: must_be_immutable
class CollegeJobScreen extends StatelessWidget {
   CollegeJobScreen({super.key});

  final CollegeJobController _controller = Get.put(CollegeJobController());

  ValueNotifier<List<int>> valueListenable = ValueNotifier<List<int>>([]);


  RxInt jobindex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Loader.screenLoader(
          loading: _controller.screenLoader.value,
         myWidget: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          jobindex.value = 0;
                        },
                        child: Card(
                          color: jobindex.value == 0 ? appThemecolor : whitecolor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                  width: 1, color: Colors.grey.shade300)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LatoCenterCommonTextWidget(
                                  title: 'Filter',
                                  textColor: jobindex.value == 0
                                      ? whitecolor
                                      : normalblack,
                                  textSize: 12,
                                  textweight: FontWeight.w500,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/Filter.svg',
                                  // ignore: deprecated_member_use
                                  color: jobindex.value == 0
                                      ? whitecolor
                                      : normalblack,
                                  // color: appbarColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 100,
                      //   child: ListView.builder(
                      //       shrinkWrap: true,
                      //       scrollDirection: Axis.horizontal,
                      //       physics: const ScrollPhysics(),
                      //       itemBuilder: (_, i) {
                      //         return Expanded(
                      //             flex: 5,
                      //             child: GestureDetector(
                      //               onTap: () {
                      //                 jobindex.value = 0;
                      //               },
                      //               child: Card(
                      //                 color: jobindex.value == 0
                      //                     ? appThemecolor
                      //                     : whitecolor,
                      //                 elevation: 0,
                      //                 shape: RoundedRectangleBorder(
                      //                     borderRadius: BorderRadius.circular(5),
                      //                     side: BorderSide(
                      //                         width: 1,
                      //                         color: Colors.grey.shade300)),
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.symmetric(
                      //                       horizontal: 12, vertical: 6),
                      //                   child: LatoCenterCommonTextWidget(
                      //                     title: "Sort By",
                      //                     textColor: jobindex.value == 0
                      //                         ? whitecolor
                      //                         : normalblack,
                      //                     textSize: 12,
                      //                     textweight: FontWeight.w500,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ));
                      //       }),
                      // ),

                      // nearby
                      GestureDetector(
                        onTap: () {
                          jobindex.value = 1;
                        },
                        child: Card(
                          color: jobindex.value == 1 ? appThemecolor : whitecolor,
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
                              textColor: jobindex.value == 1
                                  ? whitecolor
                                  : normalblack,
                              textSize: 12,
                              textweight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      //availble

                      Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () {
                              jobindex.value = 2;
                            },
                            child: Card(
                              color:
                                  jobindex.value == 2? appThemecolor : whitecolor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                      width: 1, color: Colors.grey.shade300)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 07, vertical: 6),
                                child: LatoCenterCommonTextWidget(
                                  title: 'Location',
                                  textColor: jobindex.value == 2
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
                              jobindex.value = 3;
                            },
                            child: Card(
                              semanticContainer: true,
                              color:
                                  jobindex.value == 3 ? appThemecolor : whitecolor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                      width: 1, color: Colors.grey.shade300)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 07, vertical: 6),
                                child: LatoCenterCommonTextWidget(
                                  title: 'Job Type',
                                  textColor: jobindex.value == 3
                                      ? whitecolor
                                      : normalblack,
                                  textSize: 12,
                                  textweight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )

                          //  SizedBox(
                          //   height: 30,
                          //   child: OutlinedButton(
                          //     onPressed: () {
                          //       currentindex.value = 2;
                          //     },
                          //     style: OutlinedButton.styleFrom(
                          //         backgroundColor: currentindex.value == 2
                          //             ? appThemecolor
                          //             : appbarColor),
                          //     child: PopinsFontCenterCommonTextWidget(
                          //       title: "Ratings",
                          //       textColor: currentindex.value == 2
                          //           ? appbarColor
                          //           : normalblack,
                          //       textSize: 9,
                          //       textweight: FontWeight.w500,
                          //     ),
                          //   ),
                          // ),
                          ),
                    ],
                  ),

                  // //list of filters
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        itemCount: _controller.pageLoader.value?_controller.jobList.length+1:_controller.jobList.length+1,
                        controller: _controller.scrollController,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemBuilder: (_, i) {
                          if(i<_controller.jobList.length){
                            return  AnimationConfiguration.staggeredList(
                              position: i,
                              child: SlideAnimation(
                                duration: const Duration(milliseconds: 375),
                                verticalOffset: 150.0,
                                child: JobSortCard(
                                  imagelogo: _controller.jobList[i].instituteLogo.toString(),
                                  daysstatus: _controller.jobList[i].postedOn.toString(),
                                  title:_controller.jobList[i].jobTitle.toString(),
                                  location: _controller.jobList[i].location.toString(),
                                  timestatus: _controller.jobList[i].jobType.toString(),
                                  applytap: () {
                                   /* Get.to(() =>  ApplyingJobScreen(),
                                        transition: Transition.cupertino);*/
                                    Get.toNamed(RoutesName.jobDetailsScreen,arguments: {'jobId':_controller.jobList[i].id.toString()});
                                  },
                                  expstatus: '${_controller.jobList[i].minExperience}-${_controller.jobList[i].maxExperience} Exp',
                                  isexp: true,
                                  tagtap: () async{

                                      if(_controller.jobList[i].saveStatus!){
                                        var apiStatus = await _controller.setRemovedItemApi(itemId:_controller.jobList[i].id.toString(), itemType:'job');
                                        if(apiStatus){
                                          _controller.jobList[i].saveStatus=!_controller.jobList[i].saveStatus!;
                                          _controller.jobList.refresh();
                                        }
                                      }else{
                                        var apiStatus = await _controller.setSavedItemApi(itemId:_controller.jobList[i].id.toString(), itemType:'job');
                                        if(apiStatus){
                                          _controller.jobList[i].saveStatus=!_controller.jobList[i].saveStatus!;
                                          _controller.jobList.refresh();
                                        }
                                      }


                                  },
                                  tagicon:_controller.jobList[i].saveStatus!
                                      ? 'assets/icons/filltag.svg'
                                      :'assets/icons/tagicon.svg',
                                ),
                              ),
                            );
                          }else{
                            if(_controller.currentItem < _controller.totalItem){
                              return PaginationLoading.loading();
                            }else{
                              return const SizedBox.shrink();
                            }
                          }

                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Padding(padding: EdgeInsets.only(bottom: 10)),
                      ),
                    ),
                  ),

                  // Expanded(
                  //   child: ListView.separated(
                  //     itemCount: _iconController.jobsfilterlist.length,
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.vertical,
                  //     physics: ScrollPhysics(),
                  //     padding: EdgeInsets.symmetric(vertical: 10),
                  //     itemBuilder: (_, i) {
                  //       return GetX<TagIconControllerLogic>(
                  //         builder: (iconController) {
                  //           return ValueListenableBuilder(
                  //               valueListenable: valueNotifier,
                  //               builder: (builder, value, child) {
                  //                 return JobSortCard(
                  //                   imagelogo:
                  //                       iconController.jobsfilterlist[i].imageurl,
                  //                   daysstatus:
                  //                       iconController.jobsfilterlist[i].dayaago,
                  //                   title: iconController
                  //                       .jobsfilterlist[i].trainngname,
                  //                   location:
                  //                       iconController.jobsfilterlist[i].location,
                  //                   timestatus:
                  //                       iconController.jobsfilterlist[i].timestatus,
                  //                   applytap: () {},
                  //                   expstatus: '02-03 Exp',
                  //                   isexp: true,
                  //                   tagtap: () {
                  //                     // iconController.changeValue.value =
                  //                     //     iconController.jobsfilterlist[i].tagselect =
                  //                     //         !iconController.jobsfilterlist[i].tagselect;
                  //                     if (valueNotifier.value.contains(i)) {
                  //                       valueNotifier.value.remove(i);
                  //                     } else {
                  //                       valueNotifier.value.add(i);
                  //                     }
                  //                     log(iconController.changeValue.toString());

                  //                     // setState(() {
                  //                     //   jobsfilterlist[i].tagselect =
                  //                     //       !job
                  // sfilterlist[i].tagselect;
                  //                     // });
                  //                   },
                  //                   tagicon: valueNotifier.value.contains(i)
                  //                       ? "assets/icons/tagicon.svg"
                  //                       : "assets/icons/filltag.svg",
                  //                   // tagcolor:
                  //                   //     jobsfilterlist[i].tagselect ? appThemecolor : whitecolor,
                  //                 );
                  //               });
                  //         },
                  //       );
                  //     },
                  //     separatorBuilder: (BuildContext context, int index) =>
                  //         Padding(padding: EdgeInsets.only(bottom: 10)),
                  //   ),
                  // ),

                  //sample
                  // Expanded(
                  //   child: ListView.separated(
                  //     itemCount: _iconController.jobsfilterlist.length,
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.vertical,
                  //     physics: ScrollPhysics(),
                  //     padding: EdgeInsets.symmetric(vertical: 10),
                  //     itemBuilder: (_, i) {
                  //       return GetX<TagIconControllerLogic>(
                  //         builder: (iconController) {
                  //           return Obx(
                  //             () => ValueListenableBuilder(
                  //               valueListenable: valueListenable,
                  //               builder: (context, List<int> value, child) {
                  //                 log('message');
                  //                 return

                  //                 Checkbox(
                  //                   value: value.contains(i),
                  //                   onChanged: (newValue) {
                  //                     if (value.contains(i)) {
                  //                       log(value.toString());
                  //                       value.remove(i);
                  //                       valueListenable.value = List.from(value);
                  //                     } else {
                  //                       valueListenable.value = List.from(value)
                  //                         ..add(i);
                  //                     }
                  //                   },
                  //                 );
                  //               },
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     },
                  //     separatorBuilder: (BuildContext context, int index) =>
                  //         Padding(padding: EdgeInsets.only(bottom: 10)),
                  //   ),
                  // ),
                ],
              ),
            ),

               ),
       ),
    );
  }
}
