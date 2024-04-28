import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/widget/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../authentication/screens/register/view/create_your_profile_screen.dart';
import '../../../../authentication/screens/login/view/login_your_account.dart';
import '../../../../commons/common_widgets.dart';
import '../../../../commons/routes/routes_name.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/loader/pagination_loader.dart';
import '../../../controller/bottomnavbar_controller.dart';
import '../widgets/home_screen_widgets.dart';

class Homescreen extends StatefulWidget {
  final Rx<bool> islogin;

  const Homescreen({
    super.key,
    required this.islogin,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final BottomNavigationController _controllerBase =
      Get.find<BottomNavigationController>();

  TextEditingController searchjobcontroller = TextEditingController();
  int currentIndex = 0;
  int activeIndex = 0;
  int imageindex = 0;




  Future<void> _refresh() async {
    _controllerBase.fetchHomeScreen();

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
          child: Scaffold(
              backgroundColor: const Color(0xFFFFFFFF),
              body: RefreshIndicator(
                onRefresh: _refresh,
                child: Obx(()=>
                  Loader.screenLoader(
                    loading: _controllerBase.screenLoader.value,
                    myWidget: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        //toppart
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/icons/edutop.png',
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  if (widget.islogin.value) {
                                    Get.toNamed(RoutesName.notificationScreen);
                                  } else {
                                    FlutterToast.show(
                                        context, 'Please Login first');
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Colors.grey.shade300,
                                  child: const CircleAvatar(
                                    radius: 16,
                                    backgroundColor: whitecolor,
                                    child: Icon(Icons.notifications_none),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {

                            if (widget.islogin.value) {
                              Get.toNamed(RoutesName.searchCategoryScreen);
                            } else {
                              FlutterToast.show(
                                  context, 'Please Login first');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: SearchCommonFeild(
                              controller: searchjobcontroller,
                              maxLines: 1,
                              minLines: 1,
                              hintText: 'Search job by Skill,Institute',
                              isPassword: false,
                              isSuffixPressed: () {},
                              isObscureText: false,
                              typeOfRed: <TextInputFormatter>[
                                // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-z,A-Z,0-9,@,.,#,]')),
                                LengthLimitingTextInputFormatter(50),
                              ],
                              isErrorText: false,
                              isErrorTextString:
                                  'please enter Search job by Skill,Institute',
                              keyboardPopType: TextInputType.text,
                              icontap: () {},
                              isicon: false,
                              passwordicon: Icons.visibility,
                              iconspic: Icons.email_outlined,
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please Enter Search job by Skill,Institute';
                                } else {
                                  return null;
                                }
                              },
                              // labelname: 'Search job by Skill,Institute',
                              suffexiconcolor: Colors.grey.shade400,
                              // preitem: false,

                              enabled: false,
                              onChangeVal: (value) {},
                              preitem: false,
                              prefiximage: 'assets/icons/Search.svg',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => widget.islogin.value
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      child: HomeTopWidget(
                                        nametitle:
                                            _controllerBase.homeSkipData?.value.name ?? '',
                                        profilepercent:
                                            '${_controllerBase.homeSkipData?.value.profileCompletionPercentage ?? 0}',
                                        profileimage:
                                            '${_controllerBase.homeSkipData?.value.profilePicture}',
                                        togglechange: (value) {
                                          if (value) {
                                            _controllerBase.changeJobStatusApi(
                                                status: '1');
                                          } else {
                                            _controllerBase.changeJobStatusApi(
                                                status: '0');
                                          }
                                        },
                                        jobStatus: _controllerBase.homeSkipData?.value.isLookingForJob == 1 ? true : false,
                                      ),
                                    ),
                                    //toppart views
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          HomeTopoptionCard(
                                            title: 'Profile viewed',
                                            imageicon: 'assets/icons/Profileviewed.svg',
                                            itemcount: '${_controllerBase.homeSkipData?.value.profileViewed ?? 0}',
                                          ),
                                          HomeTopoptionCard(
                                            title: 'Jobs seen',
                                            imageicon:
                                                'assets/icons/Jobsseen.svg',
                                            itemcount:
                                                '${_controllerBase.homeSkipData?.value.jobsSeen ?? 0}',
                                          ),
                                          HomeTopoptionCard(
                                            title: 'Jobs applied',
                                            imageicon:
                                                'assets/icons/Jobsapplied.svg',
                                            itemcount:
                                                '${_controllerBase.homeSkipData?.value.jobsApplied ?? 0}',
                                          ),
                                        ],
                                      ),
                                    ),
                                    //interview part

                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              HomeTopServicesCard(
                                                imageicon:
                                                    'assets/icons/Interviewscheduled.svg',
                                                countlength:
                                                    '${_controllerBase.homeSkipData?.value.interviewScheduled ?? 0}',
                                                worktype: 'Interview scheduled',
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              HomeTopServicesCard(
                                                imageicon:
                                                    'assets/icons/InterviewRejected.svg',
                                                countlength:
                                                    '${_controllerBase.homeSkipData?.value.interviewRejected ?? 0}',
                                                worktype: 'Interview Rejected',
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              HomeTopServicesCard(
                                                imageicon:
                                                    'assets/icons/Shortlistedbyrecruiter.svg',
                                                countlength:
                                                    '${_controllerBase.homeSkipData?.value.interviewShortlisted ?? 0}',
                                                worktype:
                                                    'Shortlisted by recruiter',
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              HomeTopServicesCard(
                                                imageicon:
                                                    'assets/icons/Coursessubscribed.svg',
                                                countlength:
                                                    '${_controllerBase.homeSkipData?.value.interviewShortlisted ?? 0}',
                                                worktype: 'Courses subscribed',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  height: MediaQuery.of(context).size.height * 0.33,
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                      const BoxDecoration(color: Color(0xFFEAF1FF)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.5,
                                          child: LatoCommonTextWidget(
                                              title:
                                                  _controllerBase.topBannerData?.title ?? '',
                                              maxLine: 2,
                                              textColor: appThemecolor,
                                              textSize: 16,
                                              textweight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.5,
                                          child: LatoCommonTextWidget(
                                              title:
                                                  _controllerBase.topBannerData?.description ?? '',
                                              maxLine: 3,
                                              textColor: const Color(0xFF5B5B5B),
                                              textSize: 10,
                                              textweight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, bottom: 10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.to(
                                                        () =>
                                                            const LoginAccountScreen(),
                                                        transition:
                                                            Transition.cupertino);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: appThemecolor,
                                                      borderRadius:
                                                          BorderRadius.circular(20),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Colors.black12,
                                                          blurRadius: 5.0,
                                                          spreadRadius: 0.0,
                                                          offset: Offset(0.0, 2.0),
                                                        ),
                                                      ],
                                                    ),
                                                    child: const Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 30,
                                                          vertical: 7),
                                                      child:
                                                          LatoCenterCommonTextWidget(
                                                        title: 'Sign In',
                                                        textColor: whitecolor,
                                                        textSize: 10,
                                                        textweight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.to(
                                                        () =>
                                                            const CreateYourProfileScreen(),
                                                        transition:
                                                            Transition.leftToRight);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: whitecolor,
                                                      borderRadius:
                                                          BorderRadius.circular(20),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: normalblack),
                                                    ),
                                                    child: const Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 25,
                                                          vertical: 7),
                                                      child:
                                                          LatoCenterCommonTextWidget(
                                                        title: 'Register',
                                                        textColor: normalblack,
                                                        textSize: 10,
                                                        textweight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional.bottomEnd,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '${_controllerBase.topBannerData?.image}',
                                              placeholder: (context, url) =>
                                                  PaginationLoading.loading(),
                                              // Placeholder widget
                                              errorWidget: (context, url, error) =>
                                                  const Icon(Icons.error),
                                              // Error widget
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),
                        //banner 1
                        bannerMiddle(),

                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          child: widget.islogin.value
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const LatoCommonTextWidget(
                                        title: 'Recommended Jobs',
                                        textColor: normalblack,
                                        textSize: 14,
                                        textweight: FontWeight.w700),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                          RoutesName.recommendedJobScreen,
                                        );
                                      },
                                      child: const LatoCommonTextWidget(
                                          title: 'View All',
                                          textColor: appThemecolor,
                                          textSize: 11,
                                          textweight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const LatoCommonTextWidget(
                                        title: 'Trending Jobs',
                                        textColor: normalblack,
                                        textSize: 14,
                                        textweight: FontWeight.w700),
                                    GestureDetector(
                                      onTap: () {
                                        if (widget.islogin.value) {
                                          Get.toNamed(
                                            RoutesName.recommendedJobScreen,
                                          );
                                        } else {
                                          FlutterToast.show(
                                              context, 'Please Login first');
                                        }
                                      },
                                      child: const LatoCommonTextWidget(
                                          title: 'View All',
                                          textColor: appThemecolor,
                                          textSize: 11,
                                          textweight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.198,
                              child: ListView.builder(
                                  itemCount: _controllerBase.trendingJobList.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const ScrollPhysics(),
                                  itemBuilder: (_, i) {
                                    return Obx(
                                      () =>  AnimationConfiguration.staggeredList(
                                        position: i,
                                        child: SlideAnimation(
                                          duration: const Duration(milliseconds: 675),
                                           horizontalOffset: 150.0,
                                          child: RecommendedJobsCard(
                                            imagelogo: _controllerBase
                                                .trendingJobList[i].instituteLogo
                                                .toString(),
                                            companyname: _controllerBase
                                                .trendingJobList[i].instituteName
                                                .toString(),
                                            daysstatus: _controllerBase
                                                .trendingJobList[i].postedOn
                                                .toString(),
                                            title: _controllerBase
                                                .trendingJobList[i].jobTitle
                                                .toString(),
                                            location: _controllerBase
                                                .trendingJobList[i].location
                                                .toString(),
                                            timestatus: _controllerBase
                                                .trendingJobList[i].jobType
                                                .toString(),
                                            applytap: () {
                                              if (widget.islogin.value) {
                                                Get.toNamed(RoutesName.jobDetailsScreen,
                                                    arguments: {
                                                      'jobId': _controllerBase
                                                          .trendingJobList[i].id
                                                          .toString()
                                                    });
                                              } else {
                                                FlutterToast.show(
                                                    context, 'Please Login first');
                                              }
                                            },
                                            expstatus:
                                                '${_controllerBase.trendingJobList[i].minExperience}-${_controllerBase.trendingJobList[i].maxExperience} Exp',
                                            isexp: true,
                                            tagicontap: () async {
                                              if (widget.islogin.value) {
                                                if (_controllerBase
                                                    .trendingJobList[i].saveStatus!) {
                                                  var apiStatus = await _controllerBase
                                                      .setRemovedItemApi(
                                                          itemId: _controllerBase
                                                              .trendingJobList[i].id
                                                              .toString(),
                                                          itemType: 'job');
                                                  if (apiStatus) {
                                                    _controllerBase.trendingJobList[i]
                                                            .saveStatus =
                                                        !_controllerBase
                                                            .trendingJobList[i]
                                                            .saveStatus!;
                                                    _controllerBase.trendingJobList
                                                        .refresh();
                                                  }
                                                } else {
                                                  var apiStatus = await _controllerBase
                                                      .setSavedItemApi(
                                                          itemId: _controllerBase
                                                              .trendingJobList[i].id
                                                              .toString(),
                                                          itemType: 'job');
                                                  if (apiStatus) {
                                                    _controllerBase.trendingJobList[i]
                                                            .saveStatus =
                                                        !_controllerBase
                                                            .trendingJobList[i]
                                                            .saveStatus!;
                                                    _controllerBase.trendingJobList
                                                        .refresh();
                                                  }
                                                }
                                              }
                                            },
                                            tagicon: widget.islogin.value
                                                ? _controllerBase
                                                        .trendingJobList[i].saveStatus!
                                                    ? 'assets/icons/filltag.svg'
                                                    : 'assets/icons/tagicon.svg'
                                                : '',
                                            bottommargin: 0,
                                            rightmargin: 10,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        widget.islogin.value
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const LatoCommonTextWidget(
                                            title: 'Colleges for You',
                                            textColor: normalblack,
                                            textSize: 14,
                                            textweight: FontWeight.w700),
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                                RoutesName.collegesForuScreen);
                                          },
                                          child: const LatoCommonTextWidget(
                                              title: 'View All',
                                              textColor: appThemecolor,
                                              textSize: 10,
                                              textweight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    child: SizedBox(
                                      height: 140,
                                      child: ListView.builder(
                                          itemCount:
                                              _controllerBase.collegesList.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics: const ScrollPhysics(),
                                          itemBuilder: (_, i) {
                                            return Obx(
                                              () => AnimationConfiguration.staggeredList(
                                                position: i,
                                                child: SlideAnimation(
                                                  duration: const Duration(milliseconds: 675),
                                                  horizontalOffset: 80.0,
                                                  child: FadeInAnimation(
                                                    child: CollegesCard(
                                                      collegelogo: _controllerBase
                                                          .collegesList[i].instituteLogo
                                                          .toString(),
                                                      collegename: _controllerBase
                                                          .collegesList[i].instituteName
                                                          .toString(),
                                                      jobscount:
                                                          '${_controllerBase.collegesList[i].jobsCount} Jobs',
                                                      collegetap: () {
                                                        Get.toNamed(
                                                            RoutesName.collegeViewScreen,
                                                            arguments: {
                                                              'collegeId': _controllerBase
                                                                  .collegesList[i].id
                                                                  .toString()
                                                            });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ), //
                                ],
                              )
                            : const SizedBox(
                                height: 0,
                              ),

                        //topcourses

                        widget.islogin.value
                            ? const SizedBox(
                                height: 10,
                              )
                            : const SizedBox(
                                height: 0,
                              ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const LatoCommonTextWidget(
                                  title: 'Top Courses in Training',
                                  textColor: normalblack,
                                  textSize: 14,
                                  textweight: FontWeight.w700),
                              GestureDetector(
                                onTap: () {
                                  if (widget.islogin.value) {
                                    Get.toNamed(RoutesName.topCoursesScreen);
                                  } else {
                                    FlutterToast.show(
                                        context, 'Please Login first');
                                  }
                                },
                                child: const LatoCommonTextWidget(
                                    title: 'View All',
                                    textColor: appThemecolor,
                                    textSize: 11,
                                    textweight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: SizedBox(
                              height: 260,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const ScrollPhysics(),
                                itemCount: _controllerBase.topCoursesList.length,
                                itemBuilder: (_, i) {
                                  return  AnimationConfiguration.staggeredList(
                                    position: i,
                                    child: SlideAnimation(
                                      duration: const Duration(milliseconds: 675),
                                      horizontalOffset: 180.0,
                                      child: TopCoursesTrainingCard(
                                        trainingimage:
                                            '${_controllerBase.topCoursesList[i].courseImage}',
                                        trainingname:
                                            '${_controllerBase.topCoursesList[i].courseTitle}',
                                        rating:
                                            '${_controllerBase.topCoursesList[i].rating}',
                                        ratingvalue: '',
                                        amount:
                                            '${_controllerBase.topCoursesList[i].sellingPrice}',
                                        ratingamount:
                                            '${_controllerBase.topCoursesList[i].ratingCount}',
                                        starLength: 5,
                                        isseller: false,
                                        trainingtap: () {

                                          if (widget.islogin.value) {
                                            Get.toNamed(RoutesName.coursesDetailScreen,
                                                arguments: {
                                                  'coursesId': _controllerBase
                                                      .topCoursesList[i].id
                                                      .toString()
                                                });
                                          } else {
                                            FlutterToast.show(
                                                context, 'Please Login first');
                                          }
                                        },
                                        trainintype:
                                            '${_controllerBase.topCoursesList[i].tagName}',
                                        tagtap: () async {
                                          if (widget.islogin.value) {
                                            if (_controllerBase
                                                .topCoursesList[i].saveStatus!) {
                                              var apiStatus = await _controllerBase
                                                  .setRemovedItemApi(
                                                      itemId: _controllerBase
                                                          .topCoursesList[i].id
                                                          .toString(),
                                                      itemType: 'course');
                                              if (apiStatus) {
                                                _controllerBase
                                                        .topCoursesList[i].saveStatus =
                                                    !_controllerBase
                                                        .topCoursesList[i].saveStatus!;
                                                _controllerBase.topCoursesList
                                                    .refresh();
                                              }
                                            } else {
                                              var apiStatus =
                                                  await _controllerBase.setSavedItemApi(
                                                      itemId: _controllerBase
                                                          .topCoursesList[i].id
                                                          .toString(),
                                                      itemType: 'course');
                                              if (apiStatus) {
                                                _controllerBase
                                                        .topCoursesList[i].saveStatus =
                                                    !_controllerBase
                                                        .topCoursesList[i].saveStatus!;
                                                _controllerBase.topCoursesList
                                                    .refresh();
                                              }
                                            }
                                          }
                                        },
                                        icontag: widget.islogin.value
                                            ? _controllerBase
                                                    .topCoursesList[i].saveStatus!
                                                ? 'assets/icons/filltag.svg'
                                                : 'assets/icons/tagicon.svg'
                                            : '',
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Padding(
                                            padding: EdgeInsets.only(right: 10)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                            child: plotsCarsoul()),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(child: buildIndicator()),
                        widget.islogin.value
                            ? const SizedBox(
                                height: 15,
                              )
                            : const SizedBox(
                                height: 0,
                              ),
                        widget.islogin.value
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const LatoCommonTextWidget(
                                            title: 'Jobs Based on Your Skills',
                                            textColor: normalblack,
                                            textSize: 14,
                                            textweight: FontWeight.w700),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                RoutesName.jobBasedSkillScreen);
                                            },
                                          child: const LatoCommonTextWidget(
                                              title: 'View All',
                                              textColor: appThemecolor,
                                              textSize: 10,
                                              textweight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 0),
                                      child: ListView.separated(
                                        itemCount: _controllerBase.jobsList.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: const ScrollPhysics(),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        itemBuilder: (_, i) {
                                          return AnimationConfiguration.staggeredList(
                                            position: i,
                                            child: SlideAnimation(
                                              duration: const Duration(milliseconds: 675),
                                              verticalOffset: 250.0,
                                              child: RecommendedJobsCard(
                                                imagelogo: _controllerBase
                                                    .jobsList[i].instituteLogo
                                                    .toString(),
                                                companyname: _controllerBase
                                                    .jobsList[i].instituteName
                                                    .toString(),
                                                daysstatus: _controllerBase
                                                    .jobsList[i].postedOn
                                                    .toString(),
                                                title: _controllerBase
                                                    .jobsList[i].jobTitle
                                                    .toString(),
                                                location: _controllerBase
                                                    .jobsList[i].location
                                                    .toString(),
                                                timestatus: _controllerBase
                                                    .jobsList[i].jobType
                                                    .toString(),
                                                applytap: () {
                                                  Get.toNamed(
                                                      RoutesName.jobDetailsScreen,
                                                      arguments: {
                                                        'jobId': _controllerBase
                                                            .jobsList[i].id
                                                            .toString()
                                                      });
                                                },
                                                expstatus:
                                                    '${_controllerBase.jobsList[i].minExperience}-${_controllerBase.jobsList[i].maxExperience} Exp',
                                                isexp: true,
                                                tagicontap: () async {
                                                  if (_controllerBase
                                                      .jobsList[i].saveStatus!) {
                                                    var apiStatus = await _controllerBase
                                                        .setRemovedItemApi(
                                                            itemId: _controllerBase
                                                                .jobsList[i].id
                                                                .toString(),
                                                            itemType: 'job');
                                                    if (apiStatus) {
                                                      _controllerBase
                                                              .jobsList[i].saveStatus =
                                                          !_controllerBase
                                                              .jobsList[i].saveStatus!;
                                                      _controllerBase.jobsList
                                                          .refresh();
                                                    }
                                                  } else {
                                                    var apiStatus =
                                                        await _controllerBase
                                                            .setSavedItemApi(
                                                                itemId: _controllerBase
                                                                    .jobsList[i].id
                                                                    .toString(),
                                                                itemType: 'job');
                                                    if (apiStatus) {
                                                      _controllerBase
                                                              .jobsList[i].saveStatus =
                                                          !_controllerBase
                                                              .jobsList[i].saveStatus!;
                                                      _controllerBase.jobsList
                                                          .refresh();
                                                    }
                                                  }
                                                },
                                                tagicon: _controllerBase
                                                        .jobsList[i].saveStatus!
                                                    ? 'assets/icons/filltag.svg'
                                                    : 'assets/icons/tagicon.svg',
                                                bottommargin: 0,
                                                rightmargin: 0,
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (BuildContext context,
                                                int index) =>
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 10)),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const LatoCommonTextWidget(
                                            title: 'Top Courses in Training',
                                            textColor: normalblack,
                                            textSize: 14,
                                            textweight: FontWeight.w700),
                                        GestureDetector(
                                          onTap: () {
                                            if (widget.islogin.value) {
                                              Get.toNamed(RoutesName.topCoursesScreen);
                                            } else {
                                              FlutterToast.show(
                                                  context, 'Please Login first');
                                            }
                                          },
                                          child: const LatoCommonTextWidget(
                                              title: 'View All',
                                              textColor: appThemecolor,
                                              textSize: 10,
                                              textweight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 0),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: const ScrollPhysics(),
                                        padding: const EdgeInsets.symmetric(vertical: 4),
                                        itemCount:
                                            _controllerBase.topCoursesList.length,
                                        itemBuilder: (_, i) {
                                          return AnimationConfiguration.staggeredList(
                                            position: i,
                                            child: SlideAnimation(
                                              duration: const Duration(milliseconds: 675),
                                              verticalOffset: 250.0,
                                              child: TopCoursesTrainingCard(
                                                trainingimage: _controllerBase
                                                    .topCoursesList[i].courseImage
                                                    .toString(),
                                                trainingname: _controllerBase
                                                    .topCoursesList[i].courseTitle
                                                    .toString(),
                                                rating: _controllerBase
                                                    .topCoursesList[i].rating
                                                    .toString(),
                                                ratingvalue: '5',
                                                amount: _controllerBase
                                                    .topCoursesList[i].sellingPrice
                                                    .toString(),
                                                ratingamount: _controllerBase
                                                    .topCoursesList[i].ratingCount
                                                    .toString(),
                                                starLength: 5,
                                                isseller: true,
                                                trainingtap: () {},
                                                trainintype: _controllerBase
                                                    .topCoursesList[i].tagName
                                                    .toString(),
                                                tagtap: () async {
                                                  if (_controllerBase
                                                      .topCoursesList[i].saveStatus!) {
                                                    var apiStatus = await _controllerBase
                                                        .setRemovedItemApi(
                                                            itemId: _controllerBase
                                                                .topCoursesList[i].id
                                                                .toString(),
                                                            itemType: 'course');
                                                    if (apiStatus) {
                                                      _controllerBase.topCoursesList[i]
                                                              .saveStatus =
                                                          !_controllerBase
                                                              .topCoursesList[i]
                                                              .saveStatus!;
                                                      _controllerBase.topCoursesList
                                                          .refresh();
                                                    }
                                                  } else {
                                                    var apiStatus =
                                                        await _controllerBase
                                                            .setSavedItemApi(
                                                                itemId: _controllerBase
                                                                    .topCoursesList[i]
                                                                    .id
                                                                    .toString(),
                                                                itemType: 'course');
                                                    if (apiStatus) {
                                                      _controllerBase.topCoursesList[i]
                                                              .saveStatus =
                                                          !_controllerBase
                                                              .topCoursesList[i]
                                                              .saveStatus!;
                                                      _controllerBase.topCoursesList
                                                          .refresh();
                                                    }
                                                  }
                                                },
                                                icontag: _controllerBase
                                                        .topCoursesList[i].saveStatus!
                                                    ? 'assets/icons/filltag.svg'
                                                    : 'assets/icons/tagicon.svg',
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (BuildContext context,
                                                int index) =>
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 10)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  //bottom banner
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * 0.33,
                                    width: MediaQuery.of(context).size.width,
                                    decoration:
                                        const BoxDecoration(color: Color(0xFFEAF1FF)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.5,
                                            child: LatoCommonTextWidget(
                                                title:
                                                    '${_controllerBase.bottomBannerData?.title}',
                                                maxLine: 2,
                                                textColor: appThemecolor,
                                                textSize: 16,
                                                textweight: FontWeight.w700),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.5,
                                            child: LatoCommonTextWidget(
                                                title:
                                                    '${_controllerBase.bottomBannerData?.description}',
                                                maxLine: 3,
                                                textColor: const Color(0xFF5B5B5B),
                                                textSize: 10,
                                                textweight: FontWeight.w500),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional.bottomEnd,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                '${_controllerBase.bottomBannerData?.image}',
                                            placeholder: (context, url) =>
                                                PaginationLoading.loading(),
                                            // Placeholder widget
                                            errorWidget: (context, url, error) =>
                                                const Icon(Icons.error),
                                            // Error widget
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.5,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(
                                height: 0,
                              ),
                      ],
                    ),
                  ),
                ),
              )),
        );

  }

  @override
  void dispose() {
    super.dispose();
    print('my back dispose');
  }

  Widget bannerMiddle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      // child: topCarosual(),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
                imageUrl:
                    '${widget.islogin.value ? _controllerBase.topBannerData?.image : _controllerBase.middleBannerData?.image}',
                placeholder: (context, url) => PaginationLoading.loading(),
                // Placeholder widget
                errorWidget: (context, url, error) => const Icon(Icons.error),
                // Error widget
                width: double.infinity,
                height: 140,
                fit: BoxFit.cover),
          ),
          Positioned(
              left: 10,
              top: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.islogin.value ? _controllerBase.topBannerData?.title : _controllerBase.middleBannerData?.title}',
                    style: const TextStyle(
                      color: whitecolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${widget.islogin.value ? _controllerBase.topBannerData?.description : _controllerBase.middleBannerData?.description}',
                    maxLines: 2,
                    style: const TextStyle(
                      color: whitecolor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whitecolor,
                      minimumSize: const Size(40, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Start Now',
                      style: TextStyle(
                        color: normalblack,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget sliderBottomItem(int index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl:
                '${widget.islogin.value ? _controllerBase.bannersList[index].image : _controllerBase.bottomSliderList[index].image}',
            placeholder: (context, url) => PaginationLoading.loading(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 140,
          ),
        ),
        Positioned(
          left: 10,
          top: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  '${widget.islogin.value ? _controllerBase.bannersList[index].title : _controllerBase.bottomSliderList[index].title}',
                  maxLines: 2,
                  style: const TextStyle(
                    color: whitecolor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueBlur,
                  minimumSize: const Size(40, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Know more',
                  style: TextStyle(
                    color: whitecolor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget plotsCarsoul() {
    return CarouselSlider.builder(
      itemCount: widget.islogin.value
          ? _controllerBase.bannersList.length
          : _controllerBase.bottomSliderList.length,
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

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: widget.islogin.value
          ? _controllerBase.bannersList.length
          : _controllerBase.bottomSliderList.length,
      effect: const ExpandingDotsEffect(
          dotHeight: 6,
          dotWidth: 6,
          spacing: 4.5,
          activeDotColor: appThemecolor,
          dotColor: Colors.grey));

  Widget buildImage(String localImage, int index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              localImage,
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        // color: Colors.grey,
        // child: Image.asset(
        //   localImage,
        //   fit: BoxFit.cover,
        // ),
      );



  Widget topbanImage(String localImage, int index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              localImage,
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        // color: Colors.grey,
        // child: Image.asset(
        //   localImage,
        //   fit: BoxFit.cover,
        // ),
      );
}
