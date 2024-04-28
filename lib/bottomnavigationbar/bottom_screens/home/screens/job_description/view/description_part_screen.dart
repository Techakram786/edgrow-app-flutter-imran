import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../widget/loader/pagination_loader.dart';
import '../../../widgets/home_screen_widgets.dart';
import '../../../widgets/responsability_view_widgets.dart';
import '../../job_dtl/model/job_detail_model.dart';
import '../../job_dtl/view/applying_job_screen.dart';
import '../view_model/job_des_controller.dart';

class DescriptionViewScreen extends StatelessWidget with MyTabCallback {
  JobDetailsModel? jobDetailsModel;

   DescriptionViewScreen({super.key,required this.jobDetailsModel});

  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  final DesJobController _controller = Get.put(DesJobController());

  RxBool isshowmore = true.obs;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Obx(
        () => ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/resonspiblity.svg',
                  height: 13,
                ),
                const SizedBox(
                  width: 8,
                ),
                const LatoCommonTextWidget(
                    title: 'Roles & Responsibilites',
                    textColor: normalblack,
                    textSize: 12,
                    textweight: FontWeight.w700),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 1,
              padding: const EdgeInsets.symmetric(vertical: 8),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, i) {
                return ResponsibilitesWidget(
                  rolestext:
                      jobDetailsModel?.responsibilities ?? '',
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 6,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //qualification

            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/qualification.svg',
                  height: 13,
                ),
                const SizedBox(
                  width: 8,
                ),
                const LatoCommonTextWidget(
                    title: 'Qualifications',
                    textColor: normalblack,
                    textSize: 12,
                    textweight: FontWeight.w700),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 1,
              padding: const EdgeInsets.symmetric(vertical: 8),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, i) {
                return  ResponsibilitesWidget(
                  rolestext:
                      jobDetailsModel?.qualifications ?? '',
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 6,
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            isshowmore.value
                ? Column(
                    children: [
                      SizedBox(
                        width: 120,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: whitecolor,
                                side:
                                    const BorderSide(color: normalblack, width: 0.8)),
                            onPressed: () {
                              _controller.getSimilarJobApi(page: '1', jobId: jobDetailsModel?.id.toString());
                              isshowmore.value = !isshowmore.value;
                            },
                            child: const LatoCenterCommonTextWidget(
                              title: 'See More',
                              textColor: normalblack,
                              textSize: 13,
                              textweight: FontWeight.w500,
                            )),
                      ),
                    ],
                  )
                :
                //Benfits
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Benefits.svg',
                            height: 13,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Benfits',
                              textColor: normalblack,
                              textSize: 12,
                              textweight: FontWeight.w700),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, i) {
                          return  ResponsibilitesWidget(
                            rolestext: jobDetailsModel?.benefits ?? '',
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 6,
                          );
                        },
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      //key skills
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/keyskilljob.svg',
                            height: 13,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const LatoCommonTextWidget(
                              title: 'key skills',
                              textColor: normalblack,
                              textSize: 12,
                              textweight: FontWeight.w700),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: jobDetailsModel!.keySkills!.length,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, i) {
                          return  ResponsibilitesWidget(
                            rolestext:
                               '${jobDetailsModel?.keySkills?[i]}'
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 6,
                          );
                        },
                      ),
                      //openings
                      // SizedBox(
                      //   height: 10,
                      // ),
                      //key skills
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Openings.svg',
                            height: 13,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Openings',
                              textColor: normalblack,
                              textSize: 12,
                              textweight: FontWeight.w700),
                        ],
                      ),
                      LatoCommonTextWidget(
                          title: '${jobDetailsModel?.noOfOpenings} Openings',
                          textColor: responsetextclr,
                          textSize: 10,
                          textweight: FontWeight.w400),

                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/recruiterdetails.svg',
                            height: 13,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Recruiter Details',
                              textColor: normalblack,
                              textSize: 12,
                              textweight: FontWeight.w700),
                        ],
                      ),
                      LatoCommonTextWidget(
                          title: '${jobDetailsModel?.recruiterDetails?.recruiterName}',
                          textColor: responsetextclr,
                          textSize: 12,
                          textweight: FontWeight.w600),
                      LatoCommonTextWidget(
                          title: '${jobDetailsModel?.recruiterDetails?.recruiterPosition}',
                          textColor: const Color(0xFF26282F),
                          textSize: 10,
                          textweight: FontWeight.w400),

                      //industry type
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/industrytype.svg',
                            height: 13,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Industry Type',
                              textColor: normalblack,
                              textSize: 12,
                              textweight: FontWeight.w700),
                        ],
                      ),
                      LatoCommonTextWidget(
                          title: '${jobDetailsModel?.industryType}',
                          textColor: const Color(0xFF586688),
                          textSize: 10,
                          textweight: FontWeight.w600),

                      //education
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Education.svg',
                            height: 13,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Education',
                              textColor: normalblack,
                              textSize: 12,
                              textweight: FontWeight.w700),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: jobDetailsModel!.educationQualification!.length,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, i) {
                          return  ResponsibilitesWidget(
                              rolestext:
                              '${jobDetailsModel?.educationQualification?[i]}'
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 6,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const LatoCommonTextWidget(
                          title: 'Match Score',
                          textColor: normalblack,
                          textSize: 12,
                          textweight: FontWeight.w700),

                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: DashedCircularProgressBar.aspectRatio(
                              aspectRatio: 0.8, // width ÷ height
                              valueNotifier: _valueNotifier,
                              progress: jobDetailsModel!.overallPercentage!.toDouble(),
                              maxProgress: 100,
                              corners: StrokeCap.butt,
                              foregroundColor: appThemecolor,
                              backgroundColor: const Color(0xFFC6C6C6),
                              foregroundStrokeWidth: 6,
                              backgroundStrokeWidth: 6,
                              animation: true,
                              child: Center(
                                child: ValueListenableBuilder(
                                  valueListenable: _valueNotifier,
                                  builder: (_, double value, __) => Text(
                                    '${value.toDouble()}%',
                                    style: const TextStyle(
                                        fontSize: 18, color: appThemecolor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const LatoCommonTextWidget(
                                        title: 'Skills',
                                        textColor: normalblack,
                                        textSize: 12,
                                        textweight: FontWeight.w600),
                                    LatoCommonTextWidget(
                                        title: '${jobDetailsModel?.skillsPercentage}%',
                                        textColor: normalblack,
                                        textSize: 12,
                                        textweight: FontWeight.w600),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                LinearProgressIndicator(
                                  backgroundColor: const Color(0xFFD9D9D9),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color(0xFFA471FC),
                                  ),
                                  value:  (jobDetailsModel?.skillsPercentage != null) ? (jobDetailsModel!.skillsPercentage! / 100) : null,
                                  minHeight: 8,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                //experinece
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const LatoCommonTextWidget(
                                        title: 'Experience',
                                        textColor: normalblack,
                                        textSize: 12,
                                        textweight: FontWeight.w600),
                                    LatoCommonTextWidget(
                                        title: '${jobDetailsModel?.experiencePercentage}%',
                                        textColor: normalblack,
                                        textSize: 12,
                                        textweight: FontWeight.w600),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                LinearProgressIndicator(
                                  backgroundColor: const Color(0xFFD9D9D9),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color(0xFF4FBDE3),
                                  ),
                                  value:  (jobDetailsModel?.experiencePercentage != null) ? (jobDetailsModel!.experiencePercentage!.toDouble() / 100) : null,
                                  minHeight: 8,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                //experinece
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const LatoCommonTextWidget(
                                        title: 'Salary Package',
                                        textColor: normalblack,
                                        textSize: 12,
                                        textweight: FontWeight.w600),
                                    LatoCommonTextWidget(
                                        title: '${jobDetailsModel?.salaryPercentage}%',
                                        textColor: normalblack,
                                        textSize: 12,
                                        textweight: FontWeight.w600),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                LinearProgressIndicator(
                                  backgroundColor: const Color(0xFFD9D9D9),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color(0xFFEAB35E),
                                  ),
                                  value:  (jobDetailsModel?.salaryPercentage != null) ? (jobDetailsModel!.salaryPercentage!.toDouble() / 100) : null,
                                  minHeight: 8,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      const LatoCommonTextWidget(
                          title: 'Similar Jobs',
                          textColor: normalblack,
                          textSize: 12,
                          textweight: FontWeight.w700),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                            itemCount: _controller.pageLoader.value?_controller.jobSimilarList.length+1:_controller.jobSimilarList.length+1,
                            controller: _controller.scrollController,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            itemBuilder: (_, i) {
                              if(i<_controller.jobSimilarList.length){
                                return AnimationConfiguration.staggeredList(
                                  position: i,
                                  child: SlideAnimation(
                                    duration: const Duration(milliseconds: 675),
                                    horizontalOffset: 150.0,
                                    child: RecommendedJobsCard(
                                      imagelogo: _controller.jobSimilarList[i].instituteLogo.toString(),
                                      companyname: _controller.jobSimilarList[i].instituteName.toString(),
                                      daysstatus:_controller.jobSimilarList[i].postedOn.toString(),
                                      title: _controller.jobSimilarList[i].jobTitle.toString(),
                                      location: _controller.jobSimilarList[i].location.toString(),
                                      timestatus: _controller.jobSimilarList[i].jobType.toString(),
                                      applytap: () {
                                        callback(_controller.jobSimilarList[i].id.toString());
                                      },
                                      expstatus: '${_controller.jobSimilarList[i].minExperience.toString()}-${_controller.jobSimilarList[i].maxExperience.toString()}',
                                      isexp: false,
                                      tagicontap: () async{
                                        if(_controller.jobSimilarList[i].saveStatus!){
                                          var apiStatus = await _controller.setRemovedItemApi(itemId:_controller.jobSimilarList[i].id.toString(), itemType:'job');
                                          if(apiStatus){
                                            _controller.jobSimilarList[i].saveStatus=!_controller.jobSimilarList[i].saveStatus!;
                                            _controller.jobSimilarList.refresh();
                                          }
                                        }else{
                                          var apiStatus = await _controller.setSavedItemApi(itemId:_controller.jobSimilarList[i].id.toString(), itemType:'job');
                                          if(apiStatus){
                                            _controller.jobSimilarList[i].saveStatus=!_controller.jobSimilarList[i].saveStatus!;
                                            _controller.jobSimilarList.refresh();
                                          }
                                        }
                                      },
                                      tagicon: _controller.jobSimilarList[i].saveStatus!
                                          ? 'assets/icons/filltag.svg'
                                          :'assets/icons/tagicon.svg',
                                      bottommargin: 0,
                                      rightmargin: 10,
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
                            }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
