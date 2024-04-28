import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../widget/loader/loader.dart';
import '../../../widgets/college_view_widgets.dart';
import '../tabs/jobs/view/college_job_screen.dart';
import '../tabs/overview/view/college_overview_screen.dart';
import '../view_model/coll_view_controller.dart';

class CollegeViewScreen extends StatefulWidget {
  const CollegeViewScreen({super.key});

  @override
  State<CollegeViewScreen> createState() => _CollegeViewScreenState();
}

class _CollegeViewScreenState extends State<CollegeViewScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  late String collegeId;
  final CollegeViewController _controller = Get.put(CollegeViewController());
  @override
  void initState() {
    super.initState();
     collegeId=Get.arguments['collegeId'];
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
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
         myWidget: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF1D1D6D),
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/arrowback.svg'),
              ),
            ),
            title: const LatoCommonTextWidget(
              title: '',
              textColor: whitecolor,
              textSize: 16,
              textweight: FontWeight.w600,
            ),
            titleSpacing: -6,
            actions: [
              GestureDetector(
                onTap: () async{
                  if(_controller.collegeDtlModel?.saveStatus ?? true){
                    var apiStatus = await _controller.setRemovedItemApi(itemId: _controller.collegeDtlModel!.id.toString(), itemType:'company');
                    if(apiStatus){
                      _controller.collegeDtlModel?.saveStatus=!_controller.collegeDtlModel!.saveStatus!;
                      // _controller.jobDetailsModel?.refresh();
                    }
                  }else{
                    var apiStatus = await _controller.setSavedItemApi(itemId: _controller.collegeDtlModel!.id.toString(), itemType:'company');
                    if(apiStatus){
                      _controller.collegeDtlModel?.saveStatus=!_controller.collegeDtlModel!.saveStatus!;
                      // _controllerBase.trendingJobList.refresh();
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: (_controller.collegeDtlModel?.saveStatus == true) ?
                  SvgPicture.asset('assets/icons/grouptag.svg') :
                  SvgPicture.asset('assets/icons/groupunselecttag.svg'),
                ),
              ),
            ],
          ),
          body: Column(
            // shrinkWrap: true,
            // scrollDirection: Axis.vertical,
            // physics: ScrollPhysics(),
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        color: const Color(0xFF1D1D6D),
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      Container(
                        color: const Color(0xFFFFFFFF),
                        height: MediaQuery.of(context).size.height * 0.11,
                      )
                    ],
                  ),
                  Positioned(
                      top: 30,
                      right: 20,
                      left: 20,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 0.5, color: textfeildborder)),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 45,
                            ),
                            LatoCenterCommonTextWidget(
                                title: _controller.collegeDtlModel?.instituteName ?? '',
                                textColor: normalblack,
                                textSize: 16,
                                textweight: FontWeight.w600),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 14,
                                  color: appThemecolor,
                                ),
                                LatoCenterCommonTextWidget(
                                    title: '${_controller.collegeDtlModel?.cityName ?? ''},${_controller.collegeDtlModel?.countryName ?? ''}',
                                    textColor: appThemecolor,
                                    textSize: 12,
                                    textweight: FontWeight.w600)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 6),
                              child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          mainAxisExtent: 30,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 1),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: 1,
                                  itemBuilder: (BuildContext context, int index) {
                                    return CollegeCategoryCard(
                                      categoryname:_controller.collegeDtlModel?.industryType ?? '',
                                      categorytap: () {},
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                          ],
                        ),
                      )),
                  Positioned(
                    top: 0,
                    left: 50,
                    right: 50,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Ellipselogo.png'),
                          ),
                          shape: BoxShape.circle,
                          color: Colors.white),
                    ),
                  )
                ],
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  physics: const ScrollPhysics(),
                  indicatorColor: appThemecolor,

                  unselectedLabelColor: daysagocolor,
                  // indicatorPadding: EdgeInsets.all(8),

                  indicatorWeight: 2,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
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
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  tabs:  [
                    const Tab(
                      text: 'OverView',
                    ),
                    Tab(
                      text: 'Jobs(${_controller.collegeDtlModel?.jobCount ?? ''})',
                    ),
                  ],
                  controller: _tabController,
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
              Expanded(
                child: TabBarView(
                    // physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children:  [
                      CollegeOverviewScreen(collegeId: collegeId,),
                      CollegeJobScreen(),
                    ]),
              )
            ],
          ),
               ),
       ),
    );
  }
}
