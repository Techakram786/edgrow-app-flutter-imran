


import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../widget/loader/loader.dart';
import '../view_model/courses_dtl_controller.dart';
import 'tabs/category_description_screen.dart';
import 'tabs/cirriculum_categoriy_screen.dart';
import 'tabs/courses_include_screen.dart';


class CourseCategoryViewScreen extends StatefulWidget {
  const CourseCategoryViewScreen({super.key});

  @override
  State<CourseCategoryViewScreen> createState() =>
      _CourseCategoryViewScreenState();
}

class _CourseCategoryViewScreenState extends State<CourseCategoryViewScreen>
    with TickerProviderStateMixin  {
  int starLength = 5;
  late TabController _tabController;
  final CoursesDtlController _controller= Get.put(CoursesDtlController());
  int activeIndex = 0;
  final topAssetImage = [
    'assets/icons/homeban.png',
    'assets/images/tarineban.png',
    'assets/icons/homeban.png',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    )
    ;
    // Change the length as per your needs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
     Loader.screenLoader(
       loading: _controller.screenLoader.value,
       myWidget: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.3),
              child: AppBar(
                automaticallyImplyLeading: false,
                flexibleSpace:  Container(

                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider('${_controller.coursesDtlModel?.courseImage}'),
                          fit: BoxFit.cover)
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      Row(
                        children: [

                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset('assets/icons/arrowback.svg'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(

                children: [

                  const SizedBox(
                    height: 10,
                  ),
                  //title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 220,
                              child: LatoCommonTextWidget(
                                  title:_controller.coursesDtlModel?.courseTitle ?? '',
                                  textColor: normalblack,
                                  maxLine: 2,
                                  textSize: 16,
                                  textweight: FontWeight.w600),
                            ),
                            SvgPicture.asset(
                              'assets/icons/tagicon.svg',
                              height: 22,
                            )
                          ],
                        ),
                        Card(
                          elevation: 0,
                          color: const Color(0xFF2C8800),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6,),
                            child: LatoCenterCommonTextWidget(
                                title: _controller.coursesDtlModel?.tagName?.toUpperCase() ?? '',
                                textColor: whitecolor,
                                textSize: 12,
                                textweight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: LatoCommonTextWidget(
                                  title: _controller.coursesDtlModel?.rating ?? '',
                                  textColor: starcolor,
                                  textSize: 12,
                                  textweight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                              width: 80,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (var i = 0; i < starLength; i++)
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                  for (var i = 0; i < 5 - starLength; i++)
                                    const Icon(
                                      Icons.star,
                                      color: Colors.grey,
                                      size: 16,
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: LatoCommonTextWidget(
                                  title: '(${_controller.coursesDtlModel?.ratingCount ?? ''})',
                                  textColor: const Color(0xFF696969),
                                  textSize: 14,
                                  textweight: FontWeight.w600),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal:15, vertical: 0),
                                child: plotsCarsoul()),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(child: buildIndicator()),
                  const SizedBox(
                    width: 5,
                  ),
                  TabBar(
                    physics: const ScrollPhysics(),
                    indicatorColor: appThemecolor,

                    unselectedLabelColor: daysagocolor,
                    indicatorPadding: const EdgeInsets.all(8),

                    indicatorWeight: 4,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 3.5,
                        color: appThemecolor,
                      ),
                    ),
                    // isScrollable: true,
                    // controller: DefaultTabController.of(context),
                    // controller: _booktabController,
                    labelColor: normalblack,
                    labelStyle: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: normalblack,
                            fontSize: 12.3,
                            fontWeight: FontWeight.w500)),
                    tabs: const [
                      Tab(
                        text: 'Description',
                      ),
                      Tab(
                        text: 'Course Includes',
                      ),
                      Tab(
                        text: 'Curriculum',
                      ),
                    ],
                    controller: _tabController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          buildAnimatedPage(CategoryDescriptionScreen()),
                          buildAnimatedPage(CourseIncludesScreen()),
                          buildAnimatedPage(CirrculamCategoryScreen()),
                        ],
                      ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: const Color(0xFFFFFFFF),
              child: Column(
                children: [
                  DividerLine(lineHeight: 1, dividercolor: Colors.grey.shade300),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Robotocommontext(
                                title: '${_controller.coursesDtlModel?.sellingPrice}',
                                textColor: appThemecolor,
                                textSize: 24,
                                textweight: FontWeight.w700),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '${_controller.coursesDtlModel?.actualPrice}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: normalblack,
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 0,
                                  backgroundColor: appThemecolor),
                              onPressed: () {
                                Get.toNamed(RoutesName.reviewOrderScreen,arguments:{'course_Id':_controller.coursesDtlModel?.id.toString()});
                              },
                              child: const LatoCenterCommonTextWidget(
                                title: 'Buy Now',
                                textColor: whitecolor,
                                textSize: 16,
                                textweight: FontWeight.w600,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
     ),
    );
  }
  Widget plotsCarsoul() {
    return CarouselSlider.builder(
      itemCount: topAssetImage.length,
      itemBuilder: (context, index, realIndex) {
        return sliderBottomItem(index);
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.20,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1,
        autoPlay: false,
        onPageChanged: (index, reason) => setState(() => activeIndex = index),
      ),
    );
  }
  Widget sliderBottomItem(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
          topAssetImage[index] // Adjust the BoxFit as needed
      ),
      /*child: CachedNetworkImage(
        imageUrl:
        '${_controllerBase.bannersList[index].image }',
        placeholder: (context, url) => PaginationLoading.loading(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: 140,
      ),*/
    );
  }
  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: topAssetImage.length,
      effect: const ExpandingDotsEffect(
          dotHeight: 6,
          dotWidth: 6,
          spacing: 4.5,
          activeDotColor: appThemecolor,
          dotColor: Colors.grey));

  Widget buildAnimatedPage(Widget child) {
    return RotationTransition(
      turns: Tween(begin: 1.0, end: 0.0).animate(
        _tabController.animation!,
      ),
      child: child,

    );
  }


}

