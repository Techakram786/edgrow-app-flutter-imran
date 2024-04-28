import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../widget/loader/loader.dart';
import '../../../../../../widget/loader/pagination_loader.dart';
import '../../../widgets/home_screen_widgets.dart';
import '../view_model/colleges_for_u_controller.dart';

class CollegesForYouScreen extends StatelessWidget {

  final CollegesForUController _controller = Get.put(CollegesForUController());

   CollegesForYouScreen({super.key});
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
              title: 'Colleges for You',
              textColor: normalblack,
              textSize: 16,
              textweight: FontWeight.w600,
            ),
            titleSpacing: -3,
          ),
          body: Obx(()=>
             GridView.builder(
                controller: _controller.scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 150,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: _controller.pageLoader.value?_controller.collegesForUList.length+1:_controller.collegesForUList.length+1,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                if(index<_controller.collegesForUList.length){
                  return CollegesCard(
                    collegelogo: _controller.collegesForUList[index].instituteLogo.toString(),
                    collegename: _controller.collegesForUList[index].instituteName.toString(),
                    jobscount: _controller.collegesForUList[index].jobsCount.toString(),
                    collegetap: () {
                      Get.toNamed(RoutesName.collegeViewScreen,arguments: {'collegeId':_controller.collegesForUList[index].id.toString()});
                    },
                  );
                 }else{
                  if(_controller.currentItem < _controller.totalItem){
                    return PaginationLoading.loading();
                  }else{
                    return const SizedBox.shrink();
                  }
                }
                }),
          ),
               ),
       ),
    );
  }
}
