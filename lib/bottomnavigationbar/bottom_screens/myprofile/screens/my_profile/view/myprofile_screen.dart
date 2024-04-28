// ignore_for_file: deprecated_member_use




import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:edgrow_app/commons/local_storage/SecureStorage.dart';

import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../controller/bottomnavbar_controller.dart';
import '../../../widgets/profile_screen_widget.dart';
import '../../about_us/view/about_us_screen.dart';
import '../../account_settings_screen.dart';
import '../../my_courses_screen.dart';


class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});
  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final BottomNavigationController _controller =Get.find<BottomNavigationController>();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Loader.screenLoader(
         loading: _controller.screenLoader.value,
         myWidget: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // padding: EdgeInsets.symmetric(horizontal: 15),
            physics: const ScrollPhysics(),
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        color: const Color(0xFF1D1D6D),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.16,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 90,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: textfeildborder),
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          LatoCenterCommonTextWidget(
                              title: _controller.myProfileModel?.name ?? '',
                              textColor: normalblack,
                              textSize: 16,
                              textweight: FontWeight.w600),
                          LatoCenterCommonTextWidget(
                              title: _controller.myProfileModel?.currentPosition ?? '',
                              textColor: mathscolor,
                              textSize: 14,
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
                                  title: "${_controller.myProfileModel?.city ?? ''},${_controller.myProfileModel?.country ?? ''}",
                                  textColor: appThemecolor,
                                  textSize: 14,
                                  textweight: FontWeight.w500),
                            ],
                          ),
                          LatoCenterCommonTextWidget(
                              title: '${_controller.myProfileModel?.profileCompletionPercentage ?? 0}% Profile Completed',
                              textColor: getTextColor(_controller.myProfileModel?.profileCompletionPercentage ?? 0),
                              textSize: 11,
                              textweight: FontWeight.w700),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      left: 20,
                      right: 20,
                      child: (_controller.myProfileModel?.profilePicture?.isNotEmpty ?? false)
                          ? CircleAvatar(
                              radius: 45,
                              backgroundColor: const Color(0xFFFFFFFF),
                              backgroundImage: NetworkImage('${_controller.myProfileModel!.profilePicture}')
                              // child: Image.file(_profile!),
                              )
                          : CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.amber,
                              child: GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.pink.shade300,
                                  backgroundImage:
                                      const AssetImage('assets/images/propiclat.jpg'),
                                ),
                              ),
                            )),
                  Positioned(
                    top: 50,
                    left: 80,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFF1D1D6D),
                      radius: 14,
                      child: SvgPicture.asset(
                        'assets/icons/imageedit.svg',
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              //options of profile feilds
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        _controller.myJobTabController.index=0;
                        _controller.jobType.value='applied';
                        _controller.changeIndex(1);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/jobstypeicon.png',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Jobs applied',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          LatoCommonTextWidget(
                              title: '${_controller.myProfileModel?.jobsApplied ?? 0}',
                              textColor: normalblack,
                              textSize: 16,
                              textweight: FontWeight.w600),
                        ],
                      ),
                    ),
                    //salary
                    GestureDetector(
                      onTap: (){
                        _controller.myJobTabController.index=2;
                        _controller.jobType.value='shortlisted';
                        _controller.changeIndex(1);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/shortcutlist.png',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Shortlisted by recruiter',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          LatoCommonTextWidget(
                              title: '${_controller.myProfileModel?.interviewShortlisted ?? 0}',
                              textColor: normalblack,
                              textSize: 16,
                              textweight: FontWeight.w600),
                        ],
                      ),
                    ),
                    //experience
                    GestureDetector(
                      onTap: (){
                        Get.to(() => MyCoursesScreen(),
                            duration: const Duration(milliseconds: 380),transition: Transition.rightToLeftWithFade);
                        // Get.toNamed(RoutesName.myCourseViewScreen);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/coursesubscribe.png',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const LatoCommonTextWidget(
                              title: 'Courses Subscribed',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          LatoCommonTextWidget(
                              title: '${_controller.myProfileModel?.coursesSubscribed ?? 0}',
                              textColor: normalblack,
                              textSize: 16,
                              textweight: FontWeight.w600),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LatoCommonTextWidget(
                        title: 'General Information',
                        textColor: normalblack,
                        textSize: 14,
                        textweight: FontWeight.w700),
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileWidget(
                      imageHeight: 20,
                      imageWidth: 20,
                      leadingImage: 'assets/icons/mygroweditprofile.svg',
                      onTapFun: () {
                        /*Get.to(() => const ProfileViewScreen(),
                            transition: Transition.cupertino);*/
                        Get.toNamed(RoutesName.edgrowProfileScreen)?.then((value) =>
                        _controller.getMyProfile());
                      },
                      title: 'My Edgrow Profile',
                    ),
                    const DividerLine(
                        lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
                    ProfileWidget(
                      imageHeight: 20,
                      imageWidth: 20,
                      leadingImage: 'assets/icons/myCourses.svg',
                      onTapFun: () {
                        Get.to(() => MyCoursesScreen(),
                            transition: Transition.cupertino);
                      },
                      title: 'My Courses',
                    ),
                    const DividerLine(
                        lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
                    ProfileWidget(
                      imageHeight: 20,
                      imageWidth: 20,
                      leadingImage: 'assets/icons/resume.svg',
                      onTapFun: () {
                        Get.toNamed(RoutesName.uploadCvScreen,arguments: {'screen_type':'existing'});
                      },
                      title: 'Manage CV/Resume',
                    ),
                    const DividerLine(
                        lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
                    ProfileWidget(
                      imageHeight: 20,
                      imageWidth: 20,
                      leadingImage: 'assets/icons/jobcrteria.svg',
                      onTapFun: () {
                        Get.toNamed(RoutesName.jobCriteriaScreen);
                      },
                      title: 'Your Job Criteria',
                    ),
                    const DividerLine(
                        lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
                    ProfileWidget(
                      imageHeight: 20,
                      imageWidth: 20,
                      leadingImage: 'assets/icons/shareApp.svg',
                      onTapFun: () {
                        // Get.to(() => const SupportScreen(),
                        //     transition: Transition.cupertino);
                        shareWithWhatsApp('Stracons - Edgrow');
                      },
                      title: 'Share App',
                    ),
                    const DividerLine(
                        lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
                    ProfileWidget(
                      imageHeight: 20,
                      imageWidth: 20,
                      leadingImage: 'assets/icons/accountSettings.svg',
                      onTapFun: () {
                        Get.to(() => const AccountSettingsScreen(),
                            transition: Transition.cupertino);
                      },
                      title: 'Account Settings',
                    ),
                    const DividerLine(
                        lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
                    ProfileWidget(
                      imageHeight: 20,
                      imageWidth: 20,
                      leadingImage: 'assets/icons/aboutEdgrow.svg',
                      onTapFun: () {
                        Get.to(() =>  AboutEdgrowScreen(),
                            transition: Transition.cupertino);
                      },
                      title: 'About Edgrow',
                    ),
                    const DividerLine(
                        lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
                    ProfileWidget(
                      imageHeight: 20,
                      imageWidth: 20,
                      leadingImage: 'assets/icons/logedu.svg',
                      onTapFun: () {
                        logoutDilog(context);
                      },
                      title: 'Logout',
                    ),
                  ],
                ),
              ),
            ],
          ),
               ),
       ),
    );
  }

  Future logoutDilog(context) => showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) =>
          StatefulBuilder(builder: (BuildContext context, StateSetter myState) {
            return AlertDialog(
                title: const Text(
                  'Do You Want To Logout?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                actions: [
                  TextButton(
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                          color: appThemecolor,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () async {
                        SecureStorage.deleteAll();
                        Get.offAllNamed(RoutesName.chooseLoginScreen);
                      }),
                  TextButton(
                    child: const Text(
                      'No',
                      style: TextStyle(
                        color: appThemecolor,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ]);
          }));
}

void shareWithWhatsApp(String text) {
  Share.share(
    text,
    subject: 'Sharing with WhatsApp',
  );
}
Color getTextColor(int percentage) {
  if (percentage < 30) {
    return const Color(0xFFFF0000); // Red color
  } else if (percentage < 70) {
    return const Color(0xFFFF7528); // Orange color
  } else {
    return const Color(0xFF00FF00); // Green color
  }
}
