
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:video_player/video_player.dart';

import 'benfits_screen.dart';
import 'classes_screen.dart';
import 'course_certificate_screen.dart';

class CoursesViewDetailsScreen extends StatefulWidget {
  const CoursesViewDetailsScreen({super.key});

  @override
  State<CoursesViewDetailsScreen> createState() =>
      _CoursesViewDetailsScreenState();
}

class _CoursesViewDetailsScreenState extends State<CoursesViewDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  late VideoPlayerController _controller;

  // var isSelected = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://pagalstatus.com/wp-content/uploads/2022/07/Lord-Rama-2022-Whatsapp-Status-Video.mp4?_=2'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whitecolor,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.41,
              color: whitecolor,
              child: Column(
                children: [
                  _controller.value.isInitialized
                      ? Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            ),
                            SizedBox(
                              height: 250,
                              width: 350,
                              child: Align(
                                alignment: Alignment.center,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.red,
                                  onPressed: () {
                                    setState(() {
                                      _controller.value.isPlaying
                                          ? _controller.pause()
                                          : _controller.play();
                                    });
                                  },
                                  child: Icon(
                                    _controller.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                      'assets/icons/arrowback.svg'),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            //top title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 200,
                    child: LatoCommonTextWidget(
                        title: 'Professional Maths class for Beginners',
                        textColor: normalblack,
                        textSize: 16,
                        textweight: FontWeight.w600),
                  ),
                  SvgPicture.asset(
                    'assets/icons/tagicon.svg',
                    height: 25,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TabBar(
              physics: const ScrollPhysics(),
              indicatorColor: appThemecolor,
              // tabAlignment: TabAlignment.center,

              unselectedLabelColor: daysagocolor,
              // indicatorPadding: EdgeInsets.all(8),

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
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              tabs: const [
                Tab(
                  text: 'Classes',
                ),
                Tab(
                  text: 'Benfits',
                ),
                Tab(
                  text: 'Course Certificate',
                ),
              ],
              controller: _tabController,
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
                  children: [
                    const Classesviewpartscreen(),
                    BenfitTabscreen(),
                    const CoursesCertificateScreen()
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
