import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../commons/routes/routes_name.dart';
import '../../../../../../widget/loader/loader.dart';
import '../../../../../../widget/loader/pagination_loader.dart';

import '../../../widgets/home_screen_widgets.dart';
import '../view_model/job_skill_controller.dart';



class JobBasedonYourSkillsScreen extends StatelessWidget {

  final SkillJobController _controller = Get.put(SkillJobController());

   JobBasedonYourSkillsScreen({super.key});
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
              title: 'Jobs Based on Your Skills',
              textColor: normalblack,
              textSize: 16,
              textweight: FontWeight.w600,
            ),
            titleSpacing: -3,
          ),
          body: Obx(
            () =>   ListView.separated(
              controller: _controller.scrollController,
              itemCount: _controller.pageLoader.value?_controller.jobSkillList.length+1:_controller.jobSkillList.length+1,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              itemBuilder: (_, i) {
                if(i<_controller.jobSkillList.length){
                  return AnimationConfiguration.staggeredList(
                    position: i,
                    duration: const Duration(milliseconds: 375),
                    child: FlipAnimation(
                      curve: Curves.easeInQuad,
                      child: FadeInAnimation(
                        child: RecommendedJobsCard(
                          imagelogo: _controller.jobSkillList[i].instituteLogo.toString(),
                          companyname: _controller.jobSkillList[i].instituteName.toString(),
                          daysstatus: _controller.jobSkillList[i].postedOn.toString(),
                          title: _controller.jobSkillList[i].jobTitle.toString(),
                          location: _controller.jobSkillList[i].location.toString(),
                          timestatus: _controller.jobSkillList[i].jobType.toString(),
                          applytap: () {
                            Get.toNamed(RoutesName.jobDetailsScreen,arguments: {'jobId':_controller.jobSkillList[i].id.toString()});
                          },
                          expstatus: '${_controller.jobSkillList[i].minExperience}-${_controller.jobSkillList[i].maxExperience} Exp',
                          isexp: true,
                          tagicontap: () async {
                            if (_controller
                                .jobSkillList[i].saveStatus!) {
                              var apiStatus = await _controller
                                  .setRemovedItemApi(
                                  itemId: _controller
                                      .jobSkillList[i].id
                                      .toString(),
                                  itemType: 'job');
                              if (apiStatus) {
                                _controller
                                    .jobSkillList[i].saveStatus =
                                !_controller
                                    .jobSkillList[i].saveStatus!;
                                _controller.jobSkillList
                                    .refresh();
                              }
                            } else {
                              var apiStatus =
                              await _controller
                                  .setSavedItemApi(
                                  itemId: _controller
                                      .jobSkillList[i].id
                                      .toString(),
                                  itemType: 'job');
                              if (apiStatus) {
                                _controller
                                    .jobSkillList[i].saveStatus =
                                !_controller
                                    .jobSkillList[i].saveStatus!;
                                _controller.jobSkillList
                                    .refresh();
                              }
                            }
                          },
                          tagicon: _controller.jobSkillList[i].saveStatus!
                              ? 'assets/icons/filltag.svg':
                                'assets/icons/tagicon.svg',

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
