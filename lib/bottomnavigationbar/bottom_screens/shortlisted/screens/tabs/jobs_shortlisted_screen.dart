
import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../../../Utils/empty_screen.dart';
import '../../../../../commons/routes/routes_name.dart';
import '../../../../../widget/loader/pagination_loader.dart';
import '../../../../controller/bottomnavbar_controller.dart';
import '../../../home/widgets/home_screen_widgets.dart';


class JobsShortlistedScreen extends StatelessWidget {
  final BottomNavigationController _controllerShortList = Get.find<BottomNavigationController>();

   JobsShortlistedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Loader.screenLoader(
         loading: _controllerShortList.screenLoader.value,
         myWidget: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
            child:_controllerShortList.savedPagingItemList.isNotEmpty? ListView.builder(
                controller: _controllerShortList.savedScrollController,
                itemCount: _controllerShortList.pageLoader.value?_controllerShortList.savedPagingItemList.length+1:_controllerShortList.savedPagingItemList.length+1,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, i) {
               if(i<_controllerShortList.savedPagingItemList.length){
                 return AnimationConfiguration.staggeredList(
                   position: i,
                   child: SlideAnimation(
                     duration: const Duration(milliseconds: 675),
                     verticalOffset: 150.0,
                     child: RecommendedJobsCard(
                       imagelogo: _controllerShortList.savedPagingItemList[i].instituteLogo.toString(),
                       companyname: _controllerShortList.savedPagingItemList[i].instituteName.toString(),
                       daysstatus: _controllerShortList.savedPagingItemList[i].postedOn.toString(),
                       title: _controllerShortList.savedPagingItemList[i].jobTitle.toString(),
                       location: _controllerShortList.savedPagingItemList[i].location.toString(),
                       timestatus: _controllerShortList.savedPagingItemList[i].jobType.toString(),
                       applytap: () {
                         Get.toNamed(RoutesName.jobDetailsScreen,arguments: {'jobId':_controllerShortList.savedPagingItemList[i].id.toString()});
                       },
                       expstatus:'${_controllerShortList.savedPagingItemList[i].minExperience}-${_controllerShortList.savedPagingItemList[i].maxExperience} Exp',
                       isexp: true,
                       tagicontap: () async{
                         var apiStatus = await _controllerShortList.setRemovedItemApi(itemId: _controllerShortList.savedPagingItemList[i].id.toString(), itemType:'job');
                         if(apiStatus){
                           _controllerShortList.savedPagingItemList.clear();
                           _controllerShortList.getSavedItemApi(type: 'jobs', page: _controllerShortList.savedPage.toString(), callType: 'scroll');
                         }
                       },
                       tagicon: 'assets/icons/filltag.svg',
                       bottommargin: 10,
                       rightmargin: 0,
                     ),
                   ),
                 );
               }else{
                 if(_controllerShortList.savedcCurrentItem < _controllerShortList.savedTotalItem){
                   return PaginationLoading.loading();
                 }else{
                   return const SizedBox.shrink();
                 }
               }
                  }):const EmptyScreen(title: 'No Data'),
          ),
               ),
       ),
    );
  }
}
