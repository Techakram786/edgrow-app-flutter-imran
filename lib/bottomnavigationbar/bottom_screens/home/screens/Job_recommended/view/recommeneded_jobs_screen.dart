import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/routes/routes_name.dart';
import '../../../../../../widget/loader/loader.dart';
import '../../../../../../widget/loader/pagination_loader.dart';
import '../../../widgets/home_screen_widgets.dart';

import '../view_model/recommended_controller.dart';

class RecommendedJobsScreen extends StatelessWidget {


  final RecommendedJobController _controller = Get.put(RecommendedJobController());

   RecommendedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Obx(()=>
       Loader.screenLoader(
         loading: _controller.screenLoader.value,
         myWidget: Scaffold(
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
              title: 'Recommended Jobs',
              textColor: normalblack,
              textSize: 16,
              textweight: FontWeight.w600,
            ),
            titleSpacing: -3,
          ),
          body: Obx(() =>
              ListView.separated(
                controller: _controller.scrollController,
                itemCount: _controller.pageLoader.value?_controller.recommendedJobList.length+1:_controller.recommendedJobList.length+1,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                itemBuilder: (_, i) {
                  if(i<_controller.recommendedJobList.length){
                    return AnimationConfiguration.staggeredList(
                      position: i,
                      child: SlideAnimation(
                        duration: const Duration(milliseconds: 375),
                        verticalOffset: 180.0,
                        child: FadeInAnimation(
                          child: RecommendedJobsCard(
                            imagelogo: _controller.recommendedJobList[i].instituteLogo.toString(),
                            companyname: _controller.recommendedJobList[i].instituteName.toString(),
                            daysstatus: _controller.recommendedJobList[i].postedOn.toString(),
                            title: _controller.recommendedJobList[i].jobTitle.toString(),
                            location: _controller.recommendedJobList[i].location.toString(),
                            timestatus: _controller.recommendedJobList[i].jobType.toString(),
                            applytap: () {
                              Get.toNamed(RoutesName.jobDetailsScreen,arguments: {'jobId':_controller.recommendedJobList[i].id.toString()});
                            },
                            expstatus: '${_controller.recommendedJobList[i].minExperience}-${_controller.recommendedJobList[i].maxExperience} Exp',
                            isexp: true,
                            tagicontap: () async{
                          
                                if(_controller.recommendedJobList[i].saveStatus!){
                                  var apiStatus = await _controller.setRemovedItemApi(itemId: _controller.recommendedJobList[i].id.toString(), itemType:'job');
                                  if(apiStatus){
                                    _controller.recommendedJobList[i].saveStatus=!_controller.recommendedJobList[i].saveStatus!;
                                    _controller.recommendedJobList.refresh();
                                  }
                                }else{
                                  var apiStatus = await _controller.setSavedItemApi(itemId:_controller.recommendedJobList[i].id.toString(), itemType:'job');
                                  if(apiStatus){
                                    _controller.recommendedJobList[i].saveStatus=!_controller.recommendedJobList[i].saveStatus!;
                                    _controller.recommendedJobList.refresh();
                                  }
                                }
                          
                          
                            },
                            tagicon: _controller.recommendedJobList[i].saveStatus!
                                ? 'assets/icons/filltag.svg'
                                :'assets/icons/tagicon.svg',
                            bottommargin: 0,
                            rightmargin: 0,
                          ),
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
                const SizedBox(
                  height: 10,
                ),
              ),
          ),
               ),
       ),
    );
  }
}
