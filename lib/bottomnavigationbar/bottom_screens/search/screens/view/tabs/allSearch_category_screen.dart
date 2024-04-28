// ignore_for_file: must_be_immutable

import 'package:edgrow_app/Utils/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';

import '../../../../../../commons/routes/routes_name.dart';
import '../../../../../../widget/loader/loader.dart';
import '../../../../../../widget/loader/pagination_loader.dart';
import '../../../../filters/screens/filter_screen.dart';

import '../../../../home/widgets/home_screen_widgets.dart';

import '../../../../shortlisted/widgets/companies_card.dart';
import '../../view_model/search_controller.dart';

class AllSearchJobsScreen extends StatelessWidget {

  final SearchHomeController _controller = Get.find<SearchHomeController>();

  AllSearchJobsScreen({super.key});

  RxInt keyindex = 5.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Loader.screenLoader(
        loading: _controller.screenLoader.value,
        myWidget: Scaffold(
          backgroundColor: whitecolor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => FilterSelectionScreen());
                            },
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                      width: 1, color: Colors.grey.shade300)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
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
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/Filter.svg',
                                      color: keyindex.value == 0
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
                                  title: 'Location',
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
                                  title: 'Job Type',
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
                  ),
                  //job suitable
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LatoCommonTextWidget(
                              title:
                                  'Jobs Suitable for ${_controller.searchWord}',
                              textColor: normalblack,
                              textSize: 14,
                              textweight: FontWeight.w600),
                          LatoCommonTextWidget(
                              title:
                                  '${_controller.searchModel?.jobsCount} Results',
                              textColor: appThemecolor,
                              textSize: 10,
                              textweight: FontWeight.w600),
                        ],
                      ),
                      const LatoCommonTextWidget(
                          title: '',
                          textColor: appThemecolor,
                          textSize: 14,
                          textweight: FontWeight.w500),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.09,
                    child: _controller.jobList.isNotEmpty
                        ? ListView.separated(
                            controller: _controller.jobsAllScrollController,
                            itemCount: _controller.pageLoader.value
                                ? _controller.jobList.length + 1
                                : _controller.jobList.length + 1,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemBuilder: (_, i) {
                              if (i < _controller.jobList.length) {
                                return AnimationConfiguration.staggeredList(
                                  position: i,
                                  child: SlideAnimation(
                                    duration: const Duration(milliseconds: 675),
                                    verticalOffset: 150.0,
                                    child: RecommendedJobsCard(
                                      imagelogo: _controller
                                          .jobList[i].instituteLogo
                                          .toString(),
                                      companyname: _controller
                                          .jobList[i].instituteName
                                          .toString(),
                                      daysstatus: _controller.jobList[i].postedOn
                                          .toString(),
                                      title: _controller.jobList[i].jobTitle
                                          .toString(),
                                      location: _controller.jobList[i].location
                                          .toString(),
                                      timestatus:
                                          _controller.jobList[i].jobType.toString(),
                                      applytap: () {
                                        Get.toNamed(RoutesName.jobDetailsScreen,
                                            arguments: {
                                              'jobId': _controller.jobList[i].id
                                                  .toString()
                                            });
                                      },
                                      expstatus:
                                          '${_controller.jobList[i].minExperience}-${_controller.jobList[i].maxExperience} Exp',
                                      isexp: true,
                                      tagicontap: () async {
                                        if (_controller.jobList[i].saveStatus!) {
                                          var apiStatus =
                                              await _controller.setRemovedItemApi(
                                                  itemId: _controller.jobList[i].id
                                                      .toString(),
                                                  itemType: 'job');
                                          if (apiStatus) {
                                            _controller.jobList[i].saveStatus =
                                                !_controller.jobList[i].saveStatus!;
                                            _controller.jobList.refresh();
                                          }
                                        } else {
                                          var apiStatus =
                                              await _controller.setSavedItemApi(
                                                  itemId: _controller.jobList[i].id
                                                      .toString(),
                                                  itemType: 'job');
                                          if (apiStatus) {
                                            _controller.jobList[i].saveStatus =
                                                !_controller.jobList[i].saveStatus!;
                                            _controller.jobList.refresh();
                                          }
                                        }
                                      },
                                      tagicon: _controller.jobList[i].saveStatus!
                                          ? 'assets/icons/filltag.svg'
                                          : 'assets/icons/tagicon.svg',
                                      bottommargin: 0,
                                      rightmargin: 0,
                                    ),
                                  ),
                                );
                              } else {
                                if (_controller.pageLoader.value) {
                                  return PaginationLoading.loading();
                                } else {
                                  return const SizedBox.shrink();
                                }
                              }
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 10,
                            ),
                          )
                        : const EmptyScreen(title: 'No Data Found'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LatoCommonTextWidget(
                              title:
                                  'Companys Suitable for ${_controller.searchWord}',
                              textColor: normalblack,
                              textSize: 14,
                              textweight: FontWeight.w600),
                          LatoCommonTextWidget(
                              title:
                                  '${_controller.searchModel?.companiesCount} Results',
                              textColor: appThemecolor,
                              textSize: 10,
                              textweight: FontWeight.w600),
                        ],
                      ),
                      const LatoCommonTextWidget(
                          title: '',
                          textColor: appThemecolor,
                          textSize: 14,
                          textweight: FontWeight.w500),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.09,
                    child: _controller.companiesList.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            controller: _controller.companyAllScrollController,
                            itemCount: _controller.pageLoader.value
                                ? _controller.companiesList.length + 1
                                : _controller.companiesList.length + 1,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            itemBuilder: (_, i) {
                              if (i < _controller.companiesList.length) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RoutesName.collegeViewScreen,
                                        arguments: {
                                          'collegeId': _controller
                                              .companiesList[i].id
                                              .toString()
                                        });
                                  },
                                  child: AnimationConfiguration.staggeredList(
                                    position: i,
                                    child: SlideAnimation(
                                      duration: const Duration(milliseconds: 675),
                                      verticalOffset: 70.0,
                                      child: ComapnySavedCard(
                                        logopic: _controller
                                            .companiesList[i].instituteLogo
                                            .toString(),
                                        title: _controller
                                            .companiesList[i].instituteName
                                            .toString(),
                                        location:
                                            '${_controller.companiesList[i].cityname},${_controller.companiesList[i].countryname}',
                                        tagicontap: () async {
                                          if (_controller
                                              .companiesList[i].saveStatus!) {
                                            var apiStatus =
                                                await _controller.setRemovedItemApi(
                                                    itemId: _controller
                                                        .companiesList[i].id
                                                        .toString(),
                                                    itemType: 'job');
                                            if (apiStatus) {
                                              _controller
                                                      .companiesList[i].saveStatus =
                                                  !_controller
                                                      .companiesList[i].saveStatus!;
                                              _controller.companiesList.refresh();
                                            }
                                          } else {
                                            var apiStatus =
                                                await _controller.setSavedItemApi(
                                                    itemId: _controller
                                                        .companiesList[i].id
                                                        .toString(),
                                                    itemType: 'job');
                                            if (apiStatus) {
                                              _controller
                                                      .companiesList[i].saveStatus =
                                                  !_controller
                                                      .companiesList[i].saveStatus!;
                                              _controller.companiesList.refresh();
                                            }
                                          }
                                        },
                                        tapicon:
                                            _controller.companiesList[i].saveStatus!
                                                ? 'assets/icons/filltag.svg'
                                                : 'assets/icons/tagicon.svg',
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                if (_controller.pageLoader.value) {
                                  return PaginationLoading.loading();
                                } else {
                                  return const SizedBox.shrink();
                                }
                              }
                            })
                        : const EmptyScreen(title: 'No Data Found'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
