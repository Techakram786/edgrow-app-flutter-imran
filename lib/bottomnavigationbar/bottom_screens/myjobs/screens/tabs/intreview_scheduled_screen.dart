import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../Utils/empty_screen.dart';
import '../../../../../commons/routes/routes_name.dart';
import '../../../../../widget/loader/pagination_loader.dart';
import '../../../../controller/bottomnavbar_controller.dart';

import '../../widgets/all_applied_job_widget.dart';


class InterviewScheduledScreen extends StatelessWidget {
   InterviewScheduledScreen({super.key});
   final BottomNavigationController _controllerMyjob = Get.find<BottomNavigationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: _controllerMyjob.myJobList.isNotEmpty?
        ListView.separated(
          controller: _controllerMyjob.myJobsScrollController,
          itemCount: _controllerMyjob.pageLoader.value?_controllerMyjob.myJobList.length+1:_controllerMyjob.myJobList.length+1,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          itemBuilder: (_, i) {
            if(i<_controllerMyjob.myJobList.length){
              return AnimationConfiguration.staggeredList(
                position: i,
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 675),
                  verticalOffset: 150.0,
                  child: AppliedJobCard(
                    imagelogo: _controllerMyjob.myJobList[i].instituteLogo.toString(),
                    companyname: _controllerMyjob.myJobList[i].instituteName.toString(),
                    daysstatus: '',
                    title:_controllerMyjob.myJobList[i].jobTitle.toString(),
                    location:_controllerMyjob.myJobList[i].location.toString(),
                    timestatus: _controllerMyjob.myJobList[i].jobType.toString(),
                    expstatus: '${_controllerMyjob.myJobList[i].minExperience}-${_controllerMyjob.myJobList[i].maxExperience} Exp',
                    isexp: true,
                    jobstatus: _controllerMyjob.myJobList[i].applicationStatus.toString(),
                    jobstap: () {
                      Get.toNamed(RoutesName.jobApplDetailsScreen,arguments: {'jobAppId':_controllerMyjob.myJobList[i].id.toString()});
                    },
                  ),
                ),
              );
            }else{
              if(_controllerMyjob.myJobsCurrentItem < _controllerMyjob.myJobsTotalItem){
                return PaginationLoading.loading();
              }else{
                return const SizedBox.shrink();
              }
            }

          },
          separatorBuilder: (BuildContext context, int index) =>
              const Padding(padding: EdgeInsets.only(bottom: 10)),
        ):const EmptyScreen(title: 'No Data Found',),
      ),
    );
  }
}
