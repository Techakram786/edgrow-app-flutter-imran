import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../../../../widget/loader/pagination_loader.dart';


class HomeTopWidget extends StatelessWidget {
  final String nametitle, profilepercent, profileimage;
  final ValueChanged togglechange;
   final bool jobStatus;

   const HomeTopWidget(
      {super.key,
      required this.nametitle,
      required this.profilepercent,
      required this.profileimage,
      required this.togglechange,  required this.jobStatus});

  @override
  Widget build(BuildContext context) {
    print('Job status $jobStatus');
    return Container(
      decoration: BoxDecoration(
          color: whitecolor,
          border: Border.all(width: 0.3, color: textfeildborder),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage:  CachedNetworkImageProvider(
                        profileimage
                    ),
                  ),
                ),
                Positioned(
                  // left: 30,
                  right: 0,
                  top: 0,
                  left: 55,
                  bottom: 50,

                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: const Color(0xFFFFFFFF),
                    child: Image.asset(
                      'assets/icons/suitcase.png',
                      height: 70,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nametitle,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          height: 0.5,
                          color: normalblack,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                Row(
                  children: [
                    const LatoCommonTextWidget(
                        title: 'Are You Looking for job',
                        textColor: lookingtext,
                        textSize: 12,
                        textweight: FontWeight.w600),
                    const SizedBox(
                      width: 4,
                    ),

                    Transform.scale(
                      scale: 0.7,
                      child: GFToggle(
                        enabledTrackColor: const Color(0xFF179901),
                        onChanged: togglechange,
                        value: jobStatus,
                        type: GFToggleType.ios,
                      ),
                    ),
                    // CustomIOSToggleButton()
                  ],
                ),
                LatoCommonTextWidget(
                    title: '$profilepercent% Profile Completed',
                    textColor: completeprofile,
                    textSize: 10,
                    textweight: FontWeight.w700),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HomeTopoptionCard extends StatelessWidget {
  final String title,imageicon, itemcount;
  const HomeTopoptionCard(
      {super.key,required this.title, required this.imageicon, required this.itemcount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      decoration: BoxDecoration(
          border: Border.all(width: 0.3, color: textfeildborder),
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFFFFFFF)),
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(imageicon),
                const SizedBox(
                  width: 5,
                ),
                LatoCommonTextWidget(
                    title: itemcount,
                    textColor: normalblack,
                    textSize: 20,
                    textweight: FontWeight.w700)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            LatoCenterCommonTextWidget(
                title: title,
                textColor: unslectedclr,
                textSize: 10,
                textweight: FontWeight.w600)
          ],
        ),
      ),
    );
  }
}

class HomeTopServicesCard extends StatelessWidget {
  final String imageicon, countlength, worktype;
  const HomeTopServicesCard(
      {super.key,
      required this.imageicon,
      required this.countlength,
      required this.worktype});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2.2,
      decoration: BoxDecoration(
          border: Border.all(width: 0.3, color: textfeildborder),
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFFFFFFF)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(imageicon,
                height: 35,
                width: 35,),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LatoCommonTextWidget(
                        title: countlength,
                        textColor: normalblack,
                        textSize: 18,
                        textweight: FontWeight.w700),
                    LatoCommonTextWidget(
                        title: worktype,
                        textColor: unslectedclr,
                        textSize: 8,
                        textweight: FontWeight.w600),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RecommendedJobsCard extends StatelessWidget {
  final String imagelogo,
      tagicon,
      companyname,
      daysstatus,
      title,
      location,
      timestatus,
      expstatus;
  final VoidCallback applytap, tagicontap;
  final bool isexp;
  final double bottommargin, rightmargin;
  const RecommendedJobsCard(
      {super.key,
      required this.imagelogo,
      required this.companyname,
      required this.daysstatus,
      required this.title,
      required this.location,
      required this.timestatus,
      required this.applytap,
      required this.expstatus,
      required this.isexp,
      required this.tagicontap,
      required this.tagicon,
      required this.bottommargin,
      required this.rightmargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.71,
      margin: EdgeInsets.only(right: rightmargin, bottom: bottommargin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(width: 0.3, color: textfeildborder)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: imagelogo,
                      placeholder: (context, url) => PaginationLoading.loading(), // Placeholder widget
                      errorWidget: (context, url, error) => const Icon(Icons.error), // Error widget
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    SizedBox(
                      width:  MediaQuery.of(context).size.width * 0.38,
                      child: LatoCommonTextWidget(
                          title: companyname,
                          textColor: normalblack,
                          maxLine: 1,
                          textSize: 13,

                          textweight: FontWeight.w700),
                    ),
                  ],
                ),

                //2 days ago
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform.translate(
                      offset: const Offset(15, 0),
                      child: InkWell(
                        onTap: tagicontap,
                        child: SvgPicture.asset(
                          tagicon,
                          height: 20,
                        ),
                      ),
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
              height: 8,
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
              height: 6,
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
                        horizontal: 8, vertical: 6),
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
                              horizontal: 8, vertical: 6),
                          child: LatoCenterCommonTextWidget(
                            title: expstatus,
                            textColor: normalblack,
                            textSize: 10,
                            textweight: FontWeight.w500,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                const Spacer(),
                GestureDetector(
                  onTap: applytap,
                  child: const Padding(
                    padding: EdgeInsets.all(5),
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
            ),
          ],
        ),
      ),
    );
  }
}

class CollegesCard extends StatelessWidget {
  final String collegelogo, collegename, jobscount;

  final VoidCallback collegetap;
  const CollegesCard(
      {super.key,
      required this.collegelogo,
      required this.collegename,
      required this.jobscount,
      required this.collegetap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: collegetap,
      child: Container(
        height: 150,
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100, // Adjust color as needed
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(0, 0), // Changes position of shadow
              ),
            ]),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                  imageUrl: collegelogo,
                  placeholder: (context, url) => PaginationLoading.loading(), // Placeholder widget
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,// Error widget
                  height: 30,
                  width: 30,

              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 40,
                child: LatoCenterCommonTextWidget(
                    title: collegename,
                    textColor: normalblack,
                    maxLine: 1,
                    textSize: 14,
                    textweight: FontWeight.w700),
              ),
              LatoCenterCommonTextWidget(
                  title: jobscount,
                  textColor: appThemecolor,
                  textSize: 10,
                  textweight: FontWeight.w500)
            ],
          ),
        ),
      ),
    );
  }
}

//topcourses
class TopCoursesTrainingCard extends StatelessWidget {
  final String trainingimage,
      trainingname,
      rating,
      ratingvalue,
      amount,
      ratingamount,
      icontag;
  final VoidCallback trainingtap;
  final bool isseller;
  final int starLength;
  final String trainintype;
  final VoidCallback tagtap;
  const TopCoursesTrainingCard(
      {super.key,
      required this.trainingimage,
      required this.trainingname,
      required this.rating,
      required this.ratingvalue,
      required this.amount,
      required this.ratingamount,
      required this.trainingtap,
      required this.isseller,
      required this.starLength,
      required this.trainintype,
      required this.tagtap,
      required this.icontag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: trainingtap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.5, color: textfeildborder),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    trainingimage,
                  ),
                  fit: BoxFit.cover, // Adjust this based on your needs
                ),
              )
              ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  isseller
                      ? const SizedBox(
                          height: 0,
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: trainintype == 'best seller'
                              ? Card(
                                  elevation: 0,
                                  color: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 3),
                                    child: LatoCommonTextWidget(
                                        title: 'BEST SELLER',
                                        textColor: whitecolor,
                                        textSize: 8,
                                        textweight: FontWeight.w600),
                                  ),
                                )
                              : Card(
                                  elevation: 0,
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 3),
                                    child: LatoCommonTextWidget(
                                        title: 'POPULAR',
                                        textColor: whitecolor,
                                        textSize: 8,
                                        textweight: FontWeight.w600),
                                  ),
                                ))
                ],
              ),
            ),
            Container(
              // height: 85,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                // border: Border.all(width: 0.5, color: textfeildborder)
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: LatoCommonTextWidget(
                              title: trainingname,
                              textColor: normalblack,
                              textSize: 12,
                              textweight: FontWeight.w600),
                        ),
                        InkWell(
                            onTap: tagtap,
                            child: SvgPicture.asset(
                              icontag,
                              height: 20,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        LatoCommonTextWidget(
                            title: rating,
                            textColor: starcolor,
                            textSize: 10,
                            textweight: FontWeight.w600),
                        Row(
                          children: [
                            for (var i = 0; i < starLength; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 11,
                              ),
                            for (var i = 0; i < 5 - starLength; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 11,
                              ),
                          ],
                        ),
                        LatoCommonTextWidget(
                            title: '($ratingamount)',
                            textColor: const Color(0xFF696969),
                            textSize: 10,
                            textweight: FontWeight.w600)
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Robotocommontext(
                        title: '₹$amount',
                        textColor: appThemecolor,
                        textSize: 14,
                        textweight: FontWeight.w600)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
