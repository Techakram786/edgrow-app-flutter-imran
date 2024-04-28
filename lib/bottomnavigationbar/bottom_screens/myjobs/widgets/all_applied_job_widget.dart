// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../../../../widget/loader/pagination_loader.dart';

class AppliedJobCard extends StatelessWidget {
  final String imagelogo,
      companyname,
      daysstatus,
      title,
      location,
      timestatus,
      expstatus;
  final String jobstatus;
  final VoidCallback jobstap;

  final bool isexp;
  const AppliedJobCard(
      {super.key,
      required this.imagelogo,
      required this.companyname,
      required this.daysstatus,
      required this.title,
      required this.location,
      required this.timestatus,
      required this.expstatus,
      required this.isexp,
      required this.jobstatus,
      required this.jobstap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: jobstap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0.3, color: textfeildborder)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [

                      CachedNetworkImage(
                        imageUrl:imagelogo,
                        height: 30,
                        width: 30,
                        placeholder: (context, url) => PaginationLoading.loading(), // Placeholder widget
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.4,
                        child: LatoCommonTextWidget(
                            title: companyname,
                            textColor: normalblack,
                            textSize: 14,
                            maxLine: 1,
                            textweight: FontWeight.w700),
                      ),
                    ],
                  ),

                  //2 days ago
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: LatoCommonTextWidget(
                        title: title,
                        textColor: normalblack,
                        textSize: 14,
                        textweight: FontWeight.w700),
                  ),
                  Transform.translate(
                    offset: const Offset(-2, 0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: appThemecolor,
                          size: 16,
                        ),
                        LatoCommonTextWidget(
                            title: location,
                            textColor: appThemecolor,
                            textSize: 11,
                            textweight: FontWeight.w600),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Card(
                    color: const Color.fromARGB(156, 235, 235, 229),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: LatoCenterCommonTextWidget(
                        title: timestatus,
                        textColor: normalblack,
                        textSize: 10,
                        textweight: FontWeight.w500,
                      ),
                    ),
                  ),
                  isexp
                      ? Card(
                          color: const Color.fromARGB(156, 235, 235, 229),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: LatoCenterCommonTextWidget(
                              title: expstatus,
                              textColor: normalblack,
                              textSize: 10,
                              textweight: FontWeight.w500,
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  const Spacer(),
                  jobstatus == 'Shortlisted'
                      ? Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: SvgPicture.asset(
                              'assets/icons/Shortlisted.svg'),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const LatoCommonTextWidget(
                            title: 'Shortlisted',
                            textColor: Color(0xFFC728FF),
                            textSize: 11,
                            textweight: FontWeight.w600),
                      ],
                    ),
                  )
                      : jobstatus == 'Applicationsent'
                      ? Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: SvgPicture.asset(
                              'assets/icons/applicationSent.svg'),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const LatoCommonTextWidget(
                            title: 'Application Sent',
                            textColor: appThemecolor,
                            textSize: 11,
                            textweight: FontWeight.w600),
                      ],
                    ),
                  )
                      : jobstatus == 'Rejected'
                      ? Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: SvgPicture.asset(
                              'assets/icons/rejected.svg'),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const LatoCommonTextWidget(
                            title: 'Rejected',
                            textColor: Color(0xFFFF1616),
                            textSize: 11,
                            textweight: FontWeight.w600),
                      ],
                    ),
                  )
                      : jobstatus == 'Hired'
                      ?Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 2),
                          child: SvgPicture.asset(
                            'assets/icons/applied.svg',
                            // color: Color(0xFFE9A800),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const LatoCommonTextWidget(
                            title: 'Hired',
                            textColor: Color(0xFF03C95E),
                            textSize: 11,
                            textweight: FontWeight.w600),
                      ],
                    ),
                  )

                      : jobstatus == 'Interview Scheduled'
                      ? Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 2),
                          child: SvgPicture.asset(
                            'assets/icons/scheduled.svg',
                            // color: Color(0xFFE9A800),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const LatoCommonTextWidget(
                            title: 'Interview Scheduled',
                            textColor: Color(0xFFE9A800),
                            textSize: 11,
                            textweight: FontWeight.w600),
                      ],
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 2),
                          child: SvgPicture.asset(
                              'assets/icons/applied.svg'),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const LatoCommonTextWidget(
                            title: 'Applied',
                            textColor: Color(0xFF03C95E),
                            textSize: 11,
                            textweight: FontWeight.w600),
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
