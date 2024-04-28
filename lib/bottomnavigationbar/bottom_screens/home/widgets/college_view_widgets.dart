// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../commons/common_colors.dart';
import '../../../../widget/loader/pagination_loader.dart';

class CollegeCategoryCard extends StatelessWidget {
  final String categoryname;
  final VoidCallback categorytap;

  const CollegeCategoryCard({
    super.key,
    required this.categoryname,
    required this.categorytap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: categorytap,
      child: Container(
        decoration: BoxDecoration(
            color: categorybgclr, borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: LatoCenterCommonTextWidget(
            title: categoryname,
            textColor: const Color(0xFF434343),
            textSize: 10,
            textweight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class OverViewRowCard extends StatelessWidget {
  final String iconpic, detailstitle, detailsdata;
  const OverViewRowCard(
      {super.key,
      required this.iconpic,
      required this.detailstitle,
      required this.detailsdata});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0, top: 2),
              child: SvgPicture.asset(
                iconpic,
                height: 15,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            LatoCommonTextWidget(
                title: '$detailstitle:',
                textColor: detailscolor,
                textSize: 12,
                textweight: FontWeight.w500),

          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(detailsdata,
              // maxLines: maxLine,
              // overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: detailscolor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )),
        )
      ],
    );
  }
}

class JobSortCard extends StatelessWidget {
  final String imagelogo,
      // companyname,
      daysstatus,
      title,
      location,
      timestatus,
      expstatus,
      tagicon;
  final VoidCallback applytap, tagtap;
  final bool isexp;
  // final Color tagcolor;
  const JobSortCard({
    super.key,
    required this.imagelogo,
    // required this.companyname,
    required this.daysstatus,
    required this.title,
    required this.location,
    required this.timestatus,
    required this.applytap,
    required this.expstatus,
    required this.isexp,
    required this.tagtap,
    required this.tagicon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 10),
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
                    /*Image.asset(
                      imagelogo,
                      height: 33,
                      width: 33,
                    ),*/
                    CachedNetworkImage(imageUrl: imagelogo,
                     height: 33,
                    width: 33,
                      placeholder: (context, url) => PaginationLoading.loading(), // Placeholder widget
                      errorWidget: (context, url, error) => const Icon(Icons.error),),
                    const SizedBox(
                      width: 6,
                    ),
                    // LatoCommonTextWidget(
                    //     title: companyname,
                    //     textColor: normalblack,
                    //     textSize: 14,
                    //     textweight: FontWeight.w700),
                  ],
                ),

                //2 days ago
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform.translate(
                        offset: const Offset(15, 0),
                        child: InkWell(
                          onTap: tagtap,
                          child: SvgPicture.asset(
                            tagicon,
                            height: 20,
                            // color: tagcolor,
                          ),
                        )),
                    const SizedBox(
                      height: 4,
                    ),
                    LatoCommonTextWidget(
                        title: daysstatus,
                        textColor: daysagocolor,
                        textSize: 10,
                        textweight: FontWeight.w600),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  ],
                ),
                GestureDetector(
                  onTap: applytap,
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LatoCommonTextWidget(
                            title: 'Apply Now',
                            textColor: appThemecolor,
                            textSize: 11,
                            textweight: FontWeight.w600),
                        Icon(
                          Icons.arrow_forward,
                          size: 13,
                          color: appThemecolor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
