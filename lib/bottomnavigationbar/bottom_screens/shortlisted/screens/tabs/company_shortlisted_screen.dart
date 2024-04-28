import 'package:edgrow_app/Utils/empty_screen.dart';
import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../commons/routes/routes_name.dart';
import '../../../../../widget/loader/pagination_loader.dart';
import '../../../../controller/bottomnavbar_controller.dart';

import '../../widgets/companies_card.dart';

class CompanyShortlistedScreen extends StatelessWidget {
  final BottomNavigationController _controllerShortList = Get.find<BottomNavigationController>();

   CompanyShortlistedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Loader.screenLoader(
         loading: _controllerShortList.screenLoader.value,
         myWidget: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: _controllerShortList.savedPagingItemList.isNotEmpty?ListView.builder(
              controller: _controllerShortList.savedScrollController,
              itemCount: _controllerShortList.pageLoader.value?_controllerShortList.savedPagingItemList.length+1:_controllerShortList.savedPagingItemList.length+1,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
    if(i<_controllerShortList.savedPagingItemList.length){
      return   GestureDetector(
        onTap: (){
          Get.toNamed(RoutesName.collegeViewScreen,arguments: {'collegeId':_controllerShortList.savedPagingItemList[i].id.toString()});
        },
        child: AnimationConfiguration.staggeredList(
          position: i,
          child: SlideAnimation(
            duration: const Duration(milliseconds: 675),
            verticalOffset: 150.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ComapnySavedCard(
                logopic:  _controllerShortList.savedPagingItemList[i].instituteLogo.toString(),
                title:  _controllerShortList.savedPagingItemList[i].instituteName.toString(),
                location:  '${_controllerShortList.savedPagingItemList[i].cityName},${_controllerShortList.savedPagingItemList[i].countryName}',
                tagicontap: () async {
                  var apiStatus = await _controllerShortList.setRemovedItemApi(itemId: _controllerShortList.savedPagingItemList[i].id.toString(), itemType:'company');
                  if(apiStatus){
                    _controllerShortList.savedPagingItemList.clear();
                    _controllerShortList.getSavedItemApi(type: 'company', page: '1', callType: 'scroll');
                  }
                },
                tapicon: 'assets/icons/filltag.svg',
              ),
            ),
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
    );
  }
}
