// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../widget/loader/loader.dart';
import '../../../../../../../../widget/loader/pagination_loader.dart';
import '../../../../../widgets/college_view_widgets.dart';
import '../view_model/overview_controller.dart';

class CollegeOverviewScreen extends StatelessWidget {
  CollegeOverviewScreen({super.key, required this.collegeId});
  final String collegeId;
  final OverviewController _controller = Get.put(OverviewController());
  List collegepics = [
    'assets/images/campus1.jpg',
    'assets/images/campus2.jpg',
    'assets/images/campus3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Loader.screenLoader(
          loading: _controller.screenLoader.value,
        myWidget: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            physics: const BouncingScrollPhysics(),
            children: [
              OverViewRowCard(
                iconpic: 'assets/icons/globe.svg',
                detailstitle: 'Website',
                detailsdata: '${_controller.overviewModel?.website}',
              ),
              const SizedBox(
                height: 12,
              ),
              OverViewRowCard(
                iconpic: 'assets/icons/Industry.svg',
                detailstitle: 'Industry',
                detailsdata: '${_controller.overviewModel?.industryType}',
              ),
              const SizedBox(
                height: 12,
              ),
              OverViewRowCard(
                iconpic: 'assets/icons/People_.svg',
                detailstitle: 'People',
                detailsdata: '${_controller.overviewModel?.people}',
              ),
              const SizedBox(
                height: 12,
              ),
              OverViewRowCard(
                iconpic: 'assets/icons/People_.svg',
                detailstitle: 'Location',
                detailsdata: ',${_controller.overviewModel?.cityName},${_controller.overviewModel?.countryName}',
              ),
              const SizedBox(
                height: 12,
              ),
              OverViewRowCard(
                iconpic: 'assets/icons/About Us_.svg',
                detailstitle: 'About Us',
                detailsdata:
                    '${_controller.overviewModel?.instituteDescription}',
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: LatoCommonTextWidget(
                        title: '${_controller.overviewModel?.instituteName}',
                        textColor: normalblack,
                        textSize: 14,
                        textweight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                    /*  Get.to(() =>  ViewAllImagesOverviewScreen(allCollegeImages: _controller.overviewModel?.allCollegeImages!,),
                          transition: Transition.cupertino);*/
                      Get.toNamed(RoutesName.collegeViewAllImgsScreen,arguments: {'colgAllImgs':_controller.overviewModel?.allCollegeImages!});
                    },
                    child: const LatoCommonTextWidget(
                        title: 'View All Images',
                        textColor: appThemecolor,
                        textSize: 14,
                        textweight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const ScrollPhysics(),
                    itemCount: _controller.collegeImageList.length,
                    itemBuilder: (_, i) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          child: CachedNetworkImage(
                            height: 100,
                            width: 250,
                            imageUrl: _controller.collegeImageList[i],
                            placeholder: (context, url) => PaginationLoading.loading(), // Placeholder widget
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                              fit: BoxFit.cover,
                          
                          ),
                        ),
                      );
                    }
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
