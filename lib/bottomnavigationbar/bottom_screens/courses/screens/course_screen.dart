
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../../../../widget/loader/loader.dart';
import '../../../controller/bottomnavbar_controller.dart';
import 'tabs/all_categories_screen.dart';


class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> with SingleTickerProviderStateMixin {
  TextEditingController searchwordcontroller = TextEditingController();
  final BottomNavigationController _controllerCourses = Get.find<BottomNavigationController>();

  RxString coursesCatId='0'.obs;
  int activeIndex = 0;
  final topAssetImage = [
    'assets/icons/homeban.png',
    'assets/images/tarineban.png',
    'assets/icons/homeban.png',
  ];


  @override
  void initState() {
    super.initState();
    searchwordcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Loader.screenLoader(
          loading: _controllerCourses.screenLoader.value,
          myWidget: DefaultTabController(
          length: _controllerCourses.coursesCatList.length,
          child: Scaffold(
              backgroundColor: whitecolor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: whitecolor,
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SearchCommonFeild(
                          controller: searchwordcontroller,
                          maxLines: 1,
                          minLines: 1,
                          hintText: 'Search by Keywords,Courses',
                          isPassword: false,
                          isSuffixPressed: () {},
                          isObscureText: false,
                          typeOfRed: <TextInputFormatter>[
                            // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z,A-Z,0-9,@,.,#, ]')),
                            LengthLimitingTextInputFormatter(50),
                          ],
                          isErrorText: false,
                          isErrorTextString: 'please enter Search by Keywords,Courses',
                          keyboardPopType: TextInputType.text,
                          icontap: () {},
                          isicon: false,
                          passwordicon: Icons.visibility,
                          iconspic: Icons.email_outlined,
                          validation: (value) {
                            return null;

                          },
                          // labelname: 'Search job by Skill,Institute',
                          suffexiconcolor: Colors.grey.shade400,
                          // preitem: false,
                          enabled: true,
                          onChangeVal: (value) {
                         if(value.length>1){
                           _controllerCourses.coursesList.clear();
                           _controllerCourses.getSearchCoursesApi(page: '1', categoryId: coursesCatId.value, searchWord: value);
                          }else{
                           _controllerCourses.coursesList.clear();
                           _controllerCourses. getCoursesApi(page: '1',categoryId: coursesCatId.value, callType: 'tab');
                         }
                          }, preitem: false,
                          prefiximage: 'assets/icons/Search.svg',
                        ),
                      ),

                      // Transform.translate(
                      //   offset: const Offset(0, -8),
                      //   child: Container(
                      //     width: Get.width,
                      //     height: 0.5,
                      //     color: Colors.grey.shade300,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal:15, vertical: 0),
                      child: plotsCarsoul()),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(child: buildIndicator()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: TabBar(
                      physics: const ScrollPhysics(),
                      indicatorColor: appThemecolor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: daysagocolor,
                      indicatorPadding: const EdgeInsets.all(8),
                      indicatorWeight: 4,
                      isScrollable: true,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 3.5,
                          color: appThemecolor,
                        ),
                      ),
                      // controller: DefaultTabController.of(context),
                      // controller: _booktabController,
                      labelColor: normalblack,
                      labelStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: normalblack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      tabs: List<Widget>.generate(
                        _controllerCourses.coursesCatList.length,
                            (int index) => Tab(
                          text:  _controllerCourses.coursesCatList[index].categoryName,
                        ),
                      ),
                      onTap: (index) {
                        coursesCatId.value=_controllerCourses.coursesCatList[index].id.toString();
                        _controllerCourses.coursesList.clear();
                        searchwordcontroller.clear();
                        _controllerCourses.getCoursesApi(page: '1', categoryId:_controllerCourses.coursesCatList[index].id.toString(), callType: 'tab');
                      },

                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        // controller: _booktabController,

                      children: _buildTabContents(),
                    ),
                  )
                ],
              )
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
  List<Widget> _buildTabContents() {
    return _controllerCourses.coursesCatList.map((content) => Center(child:  AllCategoriesCoursesScreen())).toList();
  }

}
