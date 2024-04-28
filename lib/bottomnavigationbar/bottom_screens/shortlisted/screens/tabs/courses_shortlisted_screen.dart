import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../../../Utils/empty_screen.dart';
import '../../../../../commons/routes/routes_name.dart';
import '../../../../../widget/loader/pagination_loader.dart';
import '../../../../controller/bottomnavbar_controller.dart';
import '../../../home/widgets/home_screen_widgets.dart';

class CoursesShortlistScreen extends StatelessWidget {
  final BottomNavigationController _controllerShortList =
      Get.find<BottomNavigationController>();

   CoursesShortlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Loader.screenLoader(
        loading: _controllerShortList.screenLoader.value,
        myWidget: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _controllerShortList.savedPagingItemList.isNotEmpty?ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 4),
              controller: _controllerShortList.savedScrollController,
              itemCount: _controllerShortList.pageLoader.value
                  ? _controllerShortList.savedPagingItemList.length + 1
                  : _controllerShortList.savedPagingItemList.length + 1,
              itemBuilder: (_, i) {
                if (i < _controllerShortList.savedPagingItemList.length) {
                  return AnimationConfiguration.staggeredList(
                    position: i,
                    child: SlideAnimation(
                      duration: const Duration(milliseconds: 675),
                      verticalOffset: 150.0,
                      child: TopCoursesTrainingCard(
                        trainingimage: _controllerShortList
                            .savedPagingItemList[i].courseImage

                            .toString(),
                        trainingname: _controllerShortList
                            .savedPagingItemList[i].courseTitle
                            .toString(),
                        rating: _controllerShortList.savedPagingItemList[i].rating
                            .toString(),
                        ratingvalue: '5',
                        amount: _controllerShortList
                            .savedPagingItemList[i].actualPrice
                            .toString(),
                        ratingamount: _controllerShortList
                            .savedPagingItemList[i].ratingCount
                            .toString(),
                        starLength: 5,
                        isseller: true,
                        trainingtap: () {
                          Get.toNamed(RoutesName.coursesDetailScreen,arguments: {'coursesId':_controllerShortList.savedPagingItemList[i].id.toString()});
                        },
                        trainintype: _controllerShortList
                            .savedPagingItemList[i].tagName
                            .toString(),
                        tagtap: () async {
                          var apiStatus =
                              await _controllerShortList.setRemovedItemApi(
                                  itemId: _controllerShortList
                                      .savedCoursesList[i].id
                                      .toString(),
                                  itemType: 'course');
                          if (apiStatus) {
                            _controllerShortList.savedPagingItemList.clear();
                            _controllerShortList.getSavedItemApi(
                                type: 'courses', page: '1', callType: 'scroll');
                          }
                        },
                        icontag: 'assets/icons/filltag.svg',
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
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
            ):const EmptyScreen(title: 'No Data'),
          ),
        ),
      ),
    );
  }
}
