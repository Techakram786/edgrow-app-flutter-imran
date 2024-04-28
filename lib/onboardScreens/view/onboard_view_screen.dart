import 'package:cached_network_image/cached_network_image.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../commons/common_widgets.dart';
import '../../widget/loader/pagination_loader.dart';
import '../models/boarding_data.dart';
import '../view_model/onboardscreen_controller.dart';


class OnboardingScreen extends StatelessWidget {

  final OnboardingController _onboardingController =
  Get.put(OnboardingController());

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Loader.screenLoader(
        loading:_onboardingController.screenLoader.value,
        myWidget:Stack(
          children: [
            Obx(
                  () => _onboardingController.isLastpage
                  ? SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/icons/last3bottom.png',
                    height: 30,
                  ),
                ),
              )
                  : SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset('assets/icons/choosevector.svg'),
                ),
              ),
            ),
            Obx(
                  () => PageView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                controller: _onboardingController.pageController,
                onPageChanged: _onboardingController.selectpageindex,
                itemCount: _onboardingController.boardingData.length,
                itemBuilder: (context, index) {
                  List<BoardingData> dataList =
                      _onboardingController.boardingData;
                  return Column(
                    children: [
                      CachedNetworkImage(
                       imageUrl: dataList[index].image.toString(),
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height/1.8,
                        width: MediaQuery.of(context).size.width,
                        placeholder: (context, url) => PaginationLoading.loading(), // Placeholder widget
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: LatoCenterCommonTextWidget(
                          title: dataList[index].title.toString(),
                          maxLine: 2,
                          textColor: normalblack,
                          textSize: 24,
                          textweight: FontWeight.w700,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: MulishCenterCommonTextWidget(
                          title: dataList[index].description.toString(),
                          textColor: descriptionclr,
                          textSize: 12,
                          textweight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Positioned(
              bottom: 130,
              left: 180,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SmoothPageIndicator(
                        controller: _onboardingController.pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          spacing: 5.0,
                          radius: 8.0,
                          dotWidth: 8.0,
                          dotHeight: 7.0,
                          strokeWidth: 3,
                          dotColor: Colors.grey.shade400,
                          activeDotColor: appThemecolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              left: 20,
              right: 20,
              child: Obx(
                    () => Commonbutton(
                  button: _onboardingController.isLastpage
                      ? 'Get Started'
                      : 'Next',
                  ontapped: _onboardingController.forwardAction,
                  horizontalpadding: 0,
                  verticalPadding: 0,
                  bgcolor: appThemecolor,
                  borderwidth: 0,
                  bordercolor: appThemecolor,
                  textclr: whitecolor,
                  txtweight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Obx(
                  () => _onboardingController.isLastpage
                  ? const SizedBox(
                height: 0,
              )
                  : Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Commonbutton(
                  button: 'Skip',
                  ontapped: () {
                    // Get.to(() => const ChooseLoginRegisterScreen());
                    Get.offAllNamed(RoutesName.chooseLoginScreen);
                  },
                  horizontalpadding: 0,
                  verticalPadding: 0,
                  bgcolor: skipbgcolor,
                  borderwidth: 0,
                  bordercolor: skipbgcolor,
                  textclr: appThemecolor,
                  txtweight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

