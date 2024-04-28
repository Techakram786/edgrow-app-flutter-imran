import 'package:cached_network_image/cached_network_image.dart';
import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../commons/routes/routes_name.dart';
import '../../../../../../widget/button.dart';
import '../../../../home/widgets/college_view_widgets.dart';
import '../../../../home/widgets/home_screen_widgets.dart';
import '../../../widgets/application_status_widget.dart';
import '../view_model/job_app_dtl_controller.dart';

class JobdetailsViewScreen extends StatelessWidget {
  JobdetailsViewScreen({super.key});
  final JobAppDtlController _controller = Get.put(JobAppDtlController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Loader.screenLoader(
        loading: _controller.screenLoader.value,
        myWidget: Scaffold(
          backgroundColor: whitecolor,
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
            title: LatoCommonTextWidget(
              title: _controller.jobApplDtl?.instituteName ?? '',
              textColor: whitecolor,
              textSize: 16,
              textweight: FontWeight.w600,
            ),
            titleSpacing: -6,
            actions: [
              GestureDetector(
                onTap: () async {
                  if (_controller.jobApplDtl?.saveStatus ?? true) {
                    var apiStatus = await _controller.setRemovedItemApi(
                        itemId:
                            _controller.jobApplDtl!.jobOpportunityId.toString(),
                        itemType: 'job');
                    if (apiStatus) {
                      _controller.jobApplDtl?.saveStatus =
                          !_controller.jobApplDtl!.saveStatus!;
                      // _controller.jobDetailsModel?.refresh();
                    }
                  } else {
                    var apiStatus = await _controller.setSavedItemApi(
                        itemId:
                            _controller.jobApplDtl!.jobOpportunityId.toString(),
                        itemType: 'job');
                    if (apiStatus) {
                      _controller.jobApplDtl?.saveStatus =
                          !_controller.jobApplDtl!.saveStatus!;
                      // _controllerBase.trendingJobList.refresh();
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: (_controller.jobApplDtl?.saveStatus == true)
                      ? SvgPicture.asset('assets/icons/grouptag.svg')
                      : SvgPicture.asset('assets/icons/groupunselecttag.svg'),
                ),
              ),
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            children: [
              Stack(
                children: [
                  SizedBox(
                    height:175,
                    child: Column(
                      children: [
                        Container(
                          color: const Color(0xFF1D1D6D),
                          height: MediaQuery.of(context).size.height * 0.13,
                        ),
                       /* Container(
                          color: whitecolor,
                          height: MediaQuery.of(context).size.height * 0.11,
                        )*/
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 20,
                    left: 20,
                    child: Container(
                      // margin:
                      //     EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(width: 0.5, color: textfeildborder)),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 44),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                LatoCenterCommonTextWidget(
                                    title:
                                        _controller.jobApplDtl?.jobTitle ?? '',
                                    textColor: normalblack,
                                    textSize: 16,
                                    textweight: FontWeight.w600),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 14,
                                      color: appThemecolor,
                                    ),
                                    LatoCenterCommonTextWidget(
                                        title:
                                            _controller.jobApplDtl?.location ??
                                                '',
                                        textColor: appThemecolor,
                                        textSize: 12,
                                        textweight: FontWeight.w600)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisExtent: 30,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 4),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return CollegeCategoryCard(
                                    categoryname:
                                        _controller.jobApplDtl?.industryType ??
                                            '',
                                    categorytap: () {},
                                  );
                                }),
                          ),
                          /*typesofconceptslist.length > 4
                              ? Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 16),
                                        child: LatoCommonTextWidget(
                                            title: "Show More",
                                            textColor: appThemecolor,
                                            textSize: 14,
                                            textweight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: 0,
                                )*/
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    left: 130,
                    right: 130,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(35), // Image radius
                        child: Container(
                          color: Colors.white,
                          child: CachedNetworkImage(
                            imageUrl:
                                _controller.jobApplDtl?.instituteLogo ?? '',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/JobType.svg'),
                          const SizedBox(
                            height: 5,
                          ),
                          const LatoCommonTextWidget(
                              title: 'JobType',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          Text(
                              _controller.jobApplDtl?.jobType ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: normalblack,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )),

                        ],
                      ),
                    ),
                    //salary
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/Salary.svg'),
                          const SizedBox(
                            height: 5,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Salary',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          Text(
                              textAlign: TextAlign.center,
                              "${_controller.jobApplDtl?.minSalary ?? ''}-${_controller.jobApplDtl?.maxSalary ?? ''} ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: normalblack,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ))

                        ],
                      ),
                    ),
                    //experience
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/Experience.svg'),
                          const SizedBox(
                            height: 5,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Experience',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          Text(
                              textAlign: TextAlign.center,
                              "${_controller.jobApplDtl?.minExperience ?? ''}-${_controller.jobApplDtl?.maxExperience ?? ''} Exp",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: normalblack,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )),

                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/Posted.svg'),
                          const SizedBox(
                            height: 5,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Posted',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          Text(
                              textAlign: TextAlign.center,
                              _controller.jobApplDtl?.postedOn ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: normalblack,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ))

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              /*const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LatoCommonTextWidget(
                        title: 'View Description',
                        textColor: normalblack,
                        textSize: 12,
                        textweight: FontWeight.w600),
                  ],
                ),
              ),*/
              const SizedBox(
                height: 8,
              ),
              DividerLine(lineHeight: 1, dividercolor: Colors.grey.shade200),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LatoCommonTextWidget(
                            title: 'Your Application Status',
                            textColor: normalblack,
                            textSize: 14,
                            textweight: FontWeight.w600),
                        const SizedBox(
                          height: 10,
                        ),
                        /*ListView.builder(
                            itemCount: summarylist.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (_, i) {
                              return Obx(
                                () => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: TripSteperCard(
                                    titlename: summarylist[i]["title"],
                                    indexw: i,
                                    itemlength: summarylist.length,
                                    time: summarylist[i]["time"],
                                    checkstatus: summarylist[i]["checkstatus"],
                                    borderline: summarylist[i]["border"],
                                  ),
                                ),
                              );
                            }),*/
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              _controller.timeline?.applied?.time == ''
                                  ? const SizedBox.shrink()
                                  : TripSteperCard(
                                titlename: 'Applied',
                                time:
                                '${_controller.timeline?.applied?.time}',
                                checkstatus: 'sucess',
                                borderline:
                                _controller.timeline?.sent?.time == ''
                                    ? 'no'
                                    : 'yes',
                              ),
                              _controller.timeline?.sent?.time == ''
                                  ? const SizedBox.shrink()
                                  : TripSteperCard(
                                titlename: 'Sent',
                                time:
                                '${_controller.timeline?.sent?.time}',
                                checkstatus: 'sucess',
                                borderline:
                                _controller.timeline?.viewed?.time ==
                                    ''
                                    ? 'no'
                                    : 'yes',
                              ),
                              _controller.timeline?.viewed?.time == ''
                                  ? const SizedBox.shrink()
                                  : TripSteperCard(
                                titlename: 'Viewed',
                                time:
                                '${_controller.timeline?.viewed?.time}',
                                checkstatus: 'sucess',
                                borderline: _controller.timeline
                                    ?.shortlisted?.time ==
                                    ''
                                    ? 'no'
                                    : 'yes',
                              ),
                              _controller.timeline?.shortlisted?.time == ''
                                  ? const SizedBox.shrink()
                                  : TripSteperCard(
                                titlename: 'Shortlisted',
                                time:
                                '${_controller.timeline?.shortlisted?.time}',
                                checkstatus: 'sucess',
                                borderline: _controller.timeline
                                    ?.secondRoundSubmitted?.time ==
                                    ''
                                    ? 'no'
                                    : 'yes',
                              ),
                              _controller.timeline?.secondRoundSubmitted?.time == ''
                                  ? const SizedBox.shrink()
                                  : TripSteperCard(
                                titlename: '2nd Round Submitted Successfully!',
                                time:
                                '${_controller.timeline?.secondRoundSubmitted?.time}',
                                checkstatus: 'sucess',
                                borderline: _controller.timeline
                                    ?.interviewScheduled?.time ==
                                    ''
                                    ? 'no'
                                    : 'yes',
                              ),
                              _controller.timeline?.interviewScheduled?.time ==
                                  ''
                                  ? const SizedBox.shrink()
                                  : TripSteperCard(
                                titlename: 'Interview Scheduled',
                                time:
                                '${_controller.timeline?.interviewScheduled?.time}',
                                checkstatus: 'sucess',
                                borderline: _controller
                                    .timeline?.rejected?.time ==
                                    ''
                                    ? (_controller
                                    .timeline?.hired?.time ==
                                    ''
                                    ? 'no'
                                    : 'yes')
                                    : 'yes',
                              ),
                              _controller.timeline?.rejected?.time == ''
                                  ? const SizedBox.shrink()
                                  : TripSteperCard(
                                titlename: 'Application Rejected',
                                time:
                                '${_controller.timeline?.rejected?.time}',
                                checkstatus: 'reject',
                                borderline: 'no',
                              ),
                              _controller.timeline?.hired?.time == ''
                                  ? const SizedBox.shrink()
                                  : TripSteperCard(
                                titlename: 'Selected for the Role',
                                time:
                                '${_controller.timeline?.hired?.time}',
                                checkstatus: 'placed',
                                borderline: 'no',
                              ),
                            ],
                          )
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        _controller.jobApplDtl?.applicationStatus=='Shortlisted'&&_controller.timeline?.shortlisted?.time != ''? Container(
                          width: MediaQuery.of(context).size.width,
                          height: 85,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                          decoration: BoxDecoration(
                            color: appThemecolor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                            border: RDottedLineBorder.all(
                                width: 0.5, color: appThemecolor),
                          ),
                          child:  Column(
                            children: [
                              const LatoCenterCommonTextWidget(
                                  title: '🎉 Hurray! You have selected to the\nSecond Round of Interview',
                                  textColor: normalblack,
                                  textSize: 12,
                                  textweight: FontWeight.w600),
                              PlatformButton(
                                onPressed: () {
                                  Get.toNamed(RoutesName.secondRoundScreen,arguments: {'jobAppId':_controller.jobAppId})
                                      ?.then((value) => _controller.getJobApplDtlApi(jobApplId: _controller.jobAppId));
                                },
                                buttonText: 'Click Here to Complete 2nd Round',
                                loadingButton: false,
                                borderRadius: 5,
                                height: 26,
                                minWidth: MediaQuery.of(context).size.width /1.5,
                              )

                            ],
                          ),):const SizedBox.shrink(),
                        const SizedBox(
                          height: 10,
                        ),
                        const LatoCommonTextWidget(
                            title: 'Similar Jobs',
                            textColor: normalblack,
                            textSize: 14,
                            textweight: FontWeight.w600),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                              () => SizedBox(
                            height: 160,
                            child: ListView.builder(
                                itemCount: _controller.similarJobList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const ScrollPhysics(),
                                itemBuilder: (_, i) {
                                  return AnimationConfiguration.staggeredList(
                                    position: i,
                                    child: SlideAnimation(
                                      duration: const Duration(milliseconds: 675),
                                      horizontalOffset: 150.0,
                                      child: RecommendedJobsCard(
                                        imagelogo: _controller
                                            .similarJobList[i].instituteLogo
                                            .toString(),
                                        companyname: _controller
                                            .similarJobList[i].instituteName
                                            .toString(),
                                        daysstatus: _controller
                                            .similarJobList[i].postedOn
                                            .toString(),
                                        title: _controller
                                            .similarJobList[i].jobTitle
                                            .toString(),
                                        location: _controller
                                            .similarJobList[i].location
                                            .toString(),
                                        timestatus: _controller
                                            .similarJobList[i].jobType
                                            .toString(),
                                        applytap: () {
                                          Get.toNamed(RoutesName.jobDetailsScreen,
                                              arguments: {
                                                'jobId': _controller
                                                    .similarJobList[i].id
                                                    .toString()
                                              });
                                        },
                                        expstatus:
                                        '${_controller.similarJobList[i].minExperience}-${_controller.similarJobList[i].maxExperience} Exp',
                                        isexp: true,
                                        tagicontap: () async {
                                          if (_controller
                                              .similarJobList[i].saveStatus!) {
                                            var apiStatus =
                                            await _controller.setRemovedItemApi(
                                                itemId: _controller
                                                    .similarJobList[i].id
                                                    .toString(),
                                                itemType: 'job');
                                            if (apiStatus) {
                                              _controller.similarJobList[i]
                                                  .saveStatus =
                                              !_controller.similarJobList[i]
                                                  .saveStatus!;
                                              _controller.similarJobList.refresh();
                                            }
                                          } else {
                                            var apiStatus =
                                            await _controller.setSavedItemApi(
                                                itemId: _controller
                                                    .similarJobList[i].id
                                                    .toString(),
                                                itemType: 'job');
                                            if (apiStatus) {
                                              _controller.similarJobList[i]
                                                  .saveStatus =
                                              !_controller.similarJobList[i]
                                                  .saveStatus!;
                                              _controller.similarJobList.refresh();
                                            }
                                          }
                                        },
                                        tagicon: _controller
                                            .similarJobList[i].saveStatus!
                                            ? 'assets/icons/filltag.svg'
                                            : 'assets/icons/tagicon.svg',
                                        bottommargin: 0,
                                        rightmargin: 10,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
