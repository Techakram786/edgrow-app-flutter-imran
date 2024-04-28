import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../Utils/empty_screen.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../widget/loader/loader.dart';
import '../../../../../../widget/loader/pagination_loader.dart';
import '../../../widgets/notification_card.dart';
import '../view_model/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController _controller = Get.put(NotificationController());
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: 'Notifications',
          textColor: normalblack,
          textSize: 16,
          textweight: FontWeight.w600,
        ),
        titleSpacing: -3,
      ),
      body: Obx(()=>
          Loader.screenLoader(
            loading: _controller.screenLoader.value,
            myWidget: _controller.notificationList.isNotEmpty?
            ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              ListView.builder(
                  controller: _controller.scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _controller.pageLoader.value?_controller.notificationList.length+1:_controller.notificationList.length+1,
                  itemBuilder: (_, i) {
                    if(i<_controller.notificationList.length){
                      return AnimationConfiguration.staggeredList(
                        position: i,
                        child: SlideAnimation(
                          duration: const Duration(milliseconds: 675),
                          verticalOffset: 150.0,
                          child: NotificationCard(
                            maintitle: _controller.notificationList[i].title ?? '',
                            subtext: _controller.notificationList[i].comment ?? '',
                            showtime:_controller.notificationList[i].time ?? '',
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
                  })
            ],
          ):const EmptyScreen(title: 'No Data Found',),
        ),
      ),
    );
  }
}
