// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../Utils/empty_screen.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../commons/routes/routes_name.dart';
import '../../../../../../widget/loader/loader.dart';
import '../../../../../../widget/loader/pagination_loader.dart';
import '../../../../filters/screens/filter_screen.dart';
import '../../../../shortlisted/widgets/companies_card.dart';
import '../../view_model/search_controller.dart';

class CompanySearchJobsScreen extends StatelessWidget {

  final SearchHomeController _controller= Get.find<SearchHomeController>();

  RxInt keyindex = 5.obs;

  CompanySearchJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Loader.screenLoader(
        loading: _controller.screenLoader.value,
        myWidget: Scaffold(
          backgroundColor: whitecolor,
          body:  Padding(
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
                                    horizontal: 8 , vertical: 4),
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
                              color: keyindex.value == 1 ? appThemecolor : whitecolor,
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
                                  textColor:
                                      keyindex.value == 1 ? whitecolor : normalblack,
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
                              color: keyindex.value == 2 ? appThemecolor : whitecolor,
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
                                  textColor:
                                      keyindex.value == 2 ? whitecolor : normalblack,
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
                              color: keyindex.value == 3 ? appThemecolor : whitecolor,
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
                                  textColor:
                                      keyindex.value == 3 ? whitecolor : normalblack,
                                  textSize: 12,
                                  textweight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                  _controller.companiesList.isNotEmpty?ListView.builder(
                      shrinkWrap: true,
                      controller: _controller.companyScrollController,
                      itemCount: _controller.pageLoader.value?_controller.companiesList.length+1:_controller.companiesList.length+1,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, i) {
                        if(i<_controller.companiesList.length){
                          return GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutesName.collegeViewScreen,arguments: {'collegeId':_controller.companiesList[i].id.toString()});
                            },
                            child: AnimationConfiguration.staggeredList(
                              position: i,
                              child: SlideAnimation(
                                duration: const Duration(milliseconds: 675),
                                verticalOffset: 70.0,
                                child: ComapnySavedCard(
                                  logopic: _controller.companiesList[i].instituteLogo.toString(),
                                  title: _controller.companiesList[i].instituteName.toString(),
                                  location: '${_controller.companiesList[i].cityname},${_controller.companiesList[i].countryname}',
                                  tagicontap: () async{
                                    if(_controller.companiesList[i].saveStatus!){
                                      var apiStatus = await _controller.setRemovedItemApi(itemId:_controller.companiesList[i].id.toString(), itemType:'company');
                                      if(apiStatus){
                                        _controller.companiesList[i].saveStatus=!_controller.companiesList[i].saveStatus!;
                                        _controller.companiesList.refresh();
                                      }
                                    }else{
                                      var apiStatus = await _controller.setSavedItemApi(itemId: _controller.companiesList[i].id.toString(), itemType:'company');
                                      if(apiStatus){
                                        _controller.companiesList[i].saveStatus=!_controller.companiesList[i].saveStatus!;
                                        _controller.companiesList.refresh();
                                      }
                                    }
                                  },
                                  tapicon: _controller.companiesList[i].saveStatus!
                                      ? 'assets/icons/filltag.svg'
                                      :'assets/icons/tagicon.svg',
                                ),
                              ),
                            ),
                          );
                        }else{
                          if(_controller.companyCurrentItem < _controller.companyTotalItem){
                            return PaginationLoading.loading();
                          }else{
                            return const SizedBox.shrink();
                          }
                        }

                      }):const EmptyScreen(title: 'No Data Found'),
                ],
              ),
          ),

        ),
      ),
    );
  }
}
