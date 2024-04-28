import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:google_fonts/google_fonts.dart';

import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../Utils/image_picker/select_photo_options_screen.dart';
import '../../../../../../authentication/controllers/pdf_upload_controller.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../widget/button.dart';
import '../../../../../../widget/loader/loader.dart';
import '../../../widgets/college_view_widgets.dart';
import '../../../widgets/resume_select_widget.dart';
import '../../benfits_screen.dart';
import '../../job_description/view/description_part_screen.dart';
import '../../keyskills_view_screen.dart';
import '../../opening_skill_screen.dart';
import '../../qualification_view_screen.dart';
import '../model/question_ans_model.dart';
import '../view_model/job_dtl_controller.dart';

class ApplyingJobScreen extends StatefulWidget {
  const ApplyingJobScreen({super.key});

  @override
  State<ApplyingJobScreen> createState() => _ApplyingJobScreenState();
}

class _ApplyingJobScreenState extends State<ApplyingJobScreen>
    with SingleTickerProviderStateMixin {
  final JobDtlController _controller = Get.put(JobDtlController());
  final PdfUploadController _pdfController = Get.put(PdfUploadController());
  RxInt radioindex = 50.obs;
  RxString resumeId = ''.obs;
  late TabController tabviewController;
  TextEditingController covercontroller = TextEditingController();
  ValueNotifier valueNotifierVideo = ValueNotifier(0);
  Rx<VideoPlayerController> _controllerVideoPlayer =
      Rx<VideoPlayerController>(VideoPlayerController.networkUrl(
    Uri.parse(
        'https://pagalstatus.com/wp-content/uploads/2022/07/Lord-Rama-2022-Whatsapp-Status-Video.mp4?_=2'),
  )..initialize());

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabviewController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Rx<File>? myVideo;

  Future _pickVideo(ImageSource source, BuildContext context) async {
    try {
      final video = await ImagePicker().pickVideo(source: source);
      if (video == null) return;
      myVideo = File(video.path).obs;
      _controllerVideoPlayer =
          Rx<VideoPlayerController>(VideoPlayerController.file(myVideo!.value)
            ..initialize().then((value) {
              Navigator.of(context).pop();
              var maxDuration = const Duration(minutes: 1);
              var duration = _controllerVideoPlayer.value.value.duration;
              if (maxDuration.compareTo(duration) > 0) {
                valueNotifierVideo.value++;
              } else {
                Get.snackbar('Video', 'Please Upload video less than 1 min',
                    backgroundColor: textfeildborder);
              }
            }));
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Navigator.of(context).pop(); // Assuming `context` is accessible here
    }
  }

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
              title: _controller.jobDetailsModel?.instituteName ?? '',
              textColor: whitecolor,
              textSize: 16,
              textweight: FontWeight.w600,
            ),
            titleSpacing: -6,
            actions: [
              GestureDetector(
                onTap: () async {
                  if (_controller.jobDetailsModel?.saveStatus ?? true) {
                    var apiStatus = await _controller.setRemovedItemApi(
                        itemId: _controller.jobDetailsModel!.id.toString(),
                        itemType: 'job');
                    if (apiStatus) {
                      _controller.jobDetailsModel?.saveStatus =
                          !_controller.jobDetailsModel!.saveStatus!;
                      // _controller.jobDetailsModel?.refresh();
                    }
                  } else {
                    var apiStatus = await _controller.setSavedItemApi(
                        itemId: _controller.jobDetailsModel!.id.toString(),
                        itemType: 'job');
                    if (apiStatus) {
                      _controller.jobDetailsModel?.saveStatus =
                          !_controller.jobDetailsModel!.saveStatus!;
                      // _controllerBase.trendingJobList.refresh();
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: (_controller.jobDetailsModel?.saveStatus == true)
                      ? SvgPicture.asset('assets/icons/grouptag.svg')
                      : SvgPicture.asset('assets/icons/groupunselecttag.svg'),
                ),
              ),
            ],
          ),
          body: Column(
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
                                    _controller.jobDetailsModel?.jobTitle ?? '',
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
                                        _controller.jobDetailsModel?.location ??
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
                                    _controller.jobDetailsModel?.industryType ??
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
                            _controller.jobDetailsModel?.instituteLogo ?? '',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //jobtype
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/JobType.svg'),
                          const SizedBox(height: 5,),
                          const LatoCommonTextWidget(
                              title: 'JobType',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          Text(
                              textAlign: TextAlign.center,
                              _controller.jobDetailsModel?.jobType ?? '',
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
                    //salary
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/Salary.svg'),
                          const SizedBox(height: 5,),
                          const LatoCommonTextWidget(
                              title: 'Salary',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          Text(
                              textAlign: TextAlign.center,
                              "${_controller.jobDetailsModel?.minSalary ?? ''}-${_controller.jobDetailsModel?.maxSalary ?? ''} ${_controller.jobDetailsModel?.salaryType ?? ''}",
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
                          const SizedBox(height: 5,),
                          const LatoCommonTextWidget(
                              title: 'Experience',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          Text(
                              textAlign: TextAlign.center,
                              "${_controller.jobDetailsModel?.minExperience ?? ''}-${_controller.jobDetailsModel?.maxExperience ?? ''} Exp",
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
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/Posted.svg'),
                          const SizedBox(height: 5,),
                          const LatoCommonTextWidget(
                              title: 'Posted',
                              textColor: Color(0xFF6C6C6C),
                              textSize: 10,
                              textweight: FontWeight.w500),
                          Text(
                              textAlign: TextAlign.center,
                              _controller.jobDetailsModel?.postedOn ?? '',
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
              Transform.translate(
                offset: const Offset(-40, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    physics: const ScrollPhysics(),
                    indicatorColor: appThemecolor,

                    unselectedLabelColor: daysagocolor,
                    indicatorPadding: const EdgeInsets.all(8),

                    indicatorWeight: 4,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 3.5,
                        color: appThemecolor,
                      ),
                    ),
                    isScrollable: true,
                    // controller: DefaultTabController.of(context),
                    // controller: _booktabController,
                    labelColor: appThemecolor,
                    labelStyle: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: normalblack,
                            fontSize: 12,
                            fontWeight: FontWeight.w600)),
                    tabs: const [
                      Tab(
                        text: 'Description',
                      ),
                      Tab(
                        text: 'Qualifications',
                      ),
                      Tab(
                        text: 'Benfits',
                      ),
                      Tab(
                        text: 'Key Skills',
                      ),
                      Tab(
                        text: 'Openings',
                      ),
                    ],
                    controller: tabviewController,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                    physics: const ScrollPhysics(),
                    controller: tabviewController,
                    children: [
                      buildAnimatedPage(DescriptionViewScreen(
                        jobDetailsModel: _controller.jobDetailsModel,
                      )),
                      buildAnimatedPage(QualificationScreen(
                        qualification:
                            _controller.jobDetailsModel?.qualifications,
                      )),
                      buildAnimatedPage(BenfitsViewScreen(
                        benfits: _controller.jobDetailsModel?.benefits,
                      )),
                      buildAnimatedPage(KeyskillsViewScreen(
                        keyskill: _controller.jobDetailsModel?.keySkills,
                      )),
                      buildAnimatedPage(OpeningsJobViewScreen(
                        opening: _controller.jobDetailsModel?.noOfOpenings,
                      ))
                    ]),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.122,
            child: Column(
              children: [
                DividerLine(lineHeight: 1, dividercolor: Colors.grey.shade300),
                Commonbutton(
                    button: 'Apply Now',
                    ontapped: () {
                      _controller.getResumeApi();
                      if (_controller.questionList.isNotEmpty) {
                        Get.back();

                        beforeApply(context);
                      } else {
                        Get.back();
                        uploadResume(context);
                      }
                    },
                    horizontalpadding: 15,
                    verticalPadding: 15,
                    bgcolor: appThemecolor,
                    borderwidth: 0,
                    bordercolor: appThemecolor,
                    textclr: whitecolor,
                    txtweight: FontWeight.w500),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAnimatedPage(Widget child) {
    return RotationTransition(
      turns: Tween(begin: 1.0, end: 0.0).animate(
        tabviewController.animation!,
      ),
      child: child,
    );
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.24,
          maxChildSize: 0.26,
          minChildSize: 0.24,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickVideo,
              ),
            );
          }),
    );
  }

  Future beforeApply(BuildContext context) {
    List<TextEditingController> ansController = List.generate(
      _controller.questionList
          .length, // Replace with the number of controllers you want
      (index) => TextEditingController(),
    );

    final GlobalKey<FormState> applykey = GlobalKey<FormState>();
    return showModalBottomSheet(
        // clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(17))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: false,
        builder: (BuildContext context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter myState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //main part start

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Form(
                          key: applykey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/bottomtop.svg')),
                              const SizedBox(
                                height: 8,
                              ),
                              const Center(
                                child: LatoCenterCommonTextWidget(
                                    title: 'Few Questions to Before Apply',
                                    textColor: normalblack,
                                    textSize: 16,
                                    textweight: FontWeight.w600),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: _controller.questionList.length,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (_, i) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LatoCommonTextWidget(
                                          title:
                                              '${_controller.questionList[i].question}',
                                          textColor: normalblack,
                                          textSize: 14,
                                          textweight: FontWeight.w600),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Commontextformfeild(
                                        controller: ansController[i],
                                        maxLines: 1,
                                        minLines: 1,
                                        hintText: 'Enter Ans',
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
                                        isErrorTextString:
                                            'please enter Job Name',
                                        keyboardPopType: TextInputType.text,
                                        icontap: () {},
                                        isicon: false,
                                        passwordicon: Icons.visibility,
                                        iconspic: Icons.email_outlined,
                                        validation: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'please Enter Ans';
                                          } else {
                                            return null;
                                          }
                                        },
                                        labelname: 'Enter Ans',
                                        suffexiconcolor: Colors.grey.shade400,
                                        // preitem: false,

                                        enabled: true,
                                        onChangeVal: (value) {},
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 6,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Obx(
                                () => _controller.buttonLoader.value
                                    ? PlatformButton(
                                        onPressed: () {},
                                        buttonText: '',
                                        loadingButton: true,
                                        borderRadius: 5,
                                        height: 50,
                                        minWidth: double.infinity,
                                      )
                                    : PlatformButton(
                                        buttonText: 'Continue ',
                                        onPressed: () async {
                                          List<QuestionAnswerData> ansList = [];
                                          if (applykey.currentState!
                                              .validate()) {
                                            for (int i = 0;
                                                i <
                                                    _controller
                                                        .questionList.length;
                                                i++) {
                                              ansList.add(QuestionAnswerData(
                                                  id: _controller
                                                      .questionList[i].id
                                                      .toString(),
                                                  answer:
                                                      ansController[i].text));
                                            }

                                            var isSave =
                                                await _controller.saveQuesApi(
                                                    jobId: _controller
                                                        .jobDetailsModel!.id
                                                        .toString(),
                                                    ans: ansList);
                                            if (isSave) {
                                              Get.back();
                                              uploadResume(context);
                                            }
                                            Get.back();
                                            uploadResume(context);
                                          }
                                        },
                                        borderRadius: 5,
                                        height: 50,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        minWidth: double.infinity,
                                      ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Future uploadResume(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(17))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter myState) {
              return Obx(
                () => SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        //main part start
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/bottomtop.svg')),
                              const SizedBox(
                                height: 8,
                              ),
                              const Center(
                                child: LatoCenterCommonTextWidget(
                                    title:
                                        'Upload Your Resume & 1 Minute Video',
                                    textColor: normalblack,
                                    textSize: 16,
                                    textweight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              LatoCenterCommonTextWidget(
                                  title:
                                      '${_controller.resumeModel?.resumeStaticContent}',
                                  textColor: responsetextclr,
                                  maxLine: 2,
                                  textSize: 10,
                                  textweight: FontWeight.w400),
                              const SizedBox(
                                height: 12,
                              ),
                              GestureDetector(
                                onTap: () => _pdfController.pickAndUploadPdf(),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: RDottedLineBorder.all(
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/pdf_uploadf.svg'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const LatoCenterCommonTextWidget(
                                          title: 'Upload Your File',
                                          textColor: normalblack,
                                          textSize: 15,
                                          textweight: FontWeight.w500),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Obx(
                                () {
                                  if (_pdfController.selectedPdf.value !=
                                      null) {
                                    return SizedBox(
                                      width: 300,
                                      child: Text(
                                        'Selected PDF: ${_pdfController.selectedPdf.value!.files.first.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    );
                                  } else {
                                    return const Text(
                                      '*File should be Less than 2MB',
                                      style: TextStyle(fontSize: 12),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const LatoCommonTextWidget(
                                  title: 'Your Resume/CV List',
                                  textColor: normalblack,
                                  textSize: 12,
                                  textweight: FontWeight.w700),
                              const SizedBox(
                                height: 10,
                              ),
                              ListView.separated(
                                itemCount: _controller.resumeList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const ScrollPhysics(),
                                itemBuilder: (_, i) {
                                  return Obx(
                                    () => ResumeSelectWidget(
                                      resumename:
                                          '${_controller.resumeList[i].title}',
                                      resumecolor: radioindex.value == i
                                          ? appThemecolor
                                          : normalblack,
                                      radiobgcolor: radioindex.value == i
                                          ? appThemecolor
                                          : whitecolor,
                                      radiotap: () {
                                        radioindex.value = i;
                                        resumeId.value = _controller
                                            .resumeList[i].id
                                            .toString();
                                      },
                                      deletetap: () {},
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const LatoCommonTextWidget(
                                  title: 'Upload Video Resume',
                                  textColor: normalblack,
                                  textSize: 12,
                                  textweight: FontWeight.w700),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 101,
                                    height: 91,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.0),
                                      // Adjust the radius as needed
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ValueListenableBuilder(
                                            valueListenable: valueNotifierVideo,
                                            builder: (context, value, child) =>
                                                VideoPlayer(
                                              _controllerVideoPlayer.value,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              videoDialog(context);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/icons/play_button.svg', // Replace with the actual path to your SVG asset
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const LatoCommonTextWidget(
                                          title:
                                              'Make a Perfect Video Resume in 2 mins!',
                                          textColor: normalblack,
                                          textSize: 12,
                                          textweight: FontWeight.w600),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const LatoCommonTextWidget(
                                          title:
                                              'Its Your chance to convince your Recruiters why\nyou are the best candidate to Job',
                                          textColor: mathscolor,
                                          textSize: 10,
                                          textweight: FontWeight.w400),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      PlatformButton(
                                        onPressed: () {
                                          _showSelectPhotoOptions(context);
                                        },
                                        buttonText: 'Upload Your Video',
                                        loadingButton: false,
                                        borderRadius: 8,
                                        height: 35,
                                        minWidth: 130,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const LatoCommonTextWidget(
                                  title: 'Cover Letter',
                                  textColor: normalblack,
                                  textSize: 14,
                                  textweight: FontWeight.w700),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: Commontextformfeild(
                                  controller: covercontroller,
                                  maxLines: 7,
                                  minLines: 5,
                                  hintText: 'You can write here',
                                  isPassword: false,
                                  isSuffixPressed: () {},
                                  isObscureText: false,
                                  typeOfRed: <TextInputFormatter>[
                                    // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                                    // FilteringTextInputFormatter.allow(
                                    //     RegExp('[a-z,A-Z,0-9,@,.,#,]')),
                                    LengthLimitingTextInputFormatter(100),
                                  ],
                                  isErrorText: false,
                                  isErrorTextString: 'please enter coverletter',
                                  keyboardPopType: TextInputType.text,
                                  icontap: () {},
                                  isicon: false,
                                  passwordicon: Icons.visibility,
                                  iconspic: Icons.email_outlined,
                                  validation: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please Enter coverletter';
                                    } else {
                                      return null;
                                    }
                                  },
                                  labelname: 'cover letter',
                                  suffexiconcolor: Colors.grey.shade400,
                                  // preitem: false,

                                  enabled: true,
                                  onChangeVal: (value) {},
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Obx(
                                () => _controller.buttonLoader.value
                                    ? PlatformButton(
                                        onPressed: () {},
                                        buttonText: '',
                                        loadingButton: true,
                                        borderRadius: 5,
                                        height: 50,
                                        minWidth: double.infinity,
                                      )
                                    : PlatformButton(
                                        buttonText: 'Apply Now ',
                                        onPressed: () async {
                                          if(myVideo?.value!=null){
                                            dio.MultipartFile? video;
                                            video = await dio.MultipartFile
                                                .fromFile(
                                                '${myVideo?.value.path}',
                                                filename: myVideo
                                                    ?.value.path
                                                    .split('/')
                                                    .last);
                                            if (_pdfController
                                                .selectedPdf.value !=
                                                null) {
                                              if (covercontroller
                                                  .text.isNotEmpty) {
                                                dio.MultipartFile? doc;

                                                try {
                                                  doc = await dio.MultipartFile
                                                      .fromFile(
                                                    '${_pdfController.selectedPdf.value!.files.single.path}',
                                                    filename: _pdfController
                                                        .selectedPdf
                                                        .value!
                                                        .files
                                                        .first
                                                        .name,
                                                  );

                                                  var isApply = await _controller
                                                      .applyJobApi(
                                                      jobId: _controller
                                                          .jobDetailsModel!.id
                                                          .toString(),
                                                      resumeType: 'new',
                                                      file: doc,
                                                      coverLetter:
                                                      covercontroller
                                                          .text,
                                                      video: video);
                                                  if (isApply) {
                                                    Get.back();
                                                    sucessfullyUpload(context);
                                                  }
                                                } catch (e) {
                                                  if (kDebugMode) {
                                                    print(
                                                        'Error creating MultipartFile: $e');
                                                  }
                                                }
                                              } else {
                                                Get.snackbar('Job Apply',
                                                    'Cover letter is missing',
                                                    backgroundColor:
                                                    textfeildborder);
                                              }
                                            } else {
                                              if (resumeId.isNotEmpty) {
                                                if (covercontroller
                                                    .text.isNotEmpty) {
                                                  var isApply = await _controller
                                                      .applyJobApi(
                                                      jobId: _controller
                                                          .jobDetailsModel!.id
                                                          .toString(),
                                                      resumeType: 'existing',
                                                      resumeId:
                                                      resumeId.value,
                                                      coverLetter:
                                                      covercontroller
                                                          .text,
                                                      video: video);
                                                  if (isApply) {
                                                    Get.back();
                                                    sucessfullyUpload(context);
                                                  }
                                                } else {
                                                  Get.snackbar('Job Apply',
                                                      'Cover letter is missing',
                                                      backgroundColor:
                                                      textfeildborder);
                                                }
                                              } else {
                                                Get.snackbar('Job Apply',
                                                    'Please select resume',
                                                    backgroundColor:
                                                    textfeildborder);
                                              }
                                            }
                                          }else{
                                            Get.snackbar('Job Apply',
                                                'Please Upload video',
                                                backgroundColor:
                                                textfeildborder);
                                          }


                                        },
                                        borderRadius: 5,
                                        height: 50,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        minWidth: double.infinity,
                                      ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Future sucessfullyUpload(BuildContext context) {
    // final ItemController itemController = Get.put(ItemController());
    return showModalBottomSheet(
        // clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(17))),
        backgroundColor: const Color(0xFFFFFFFF),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter myState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //main part start
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/bottomtop.svg')),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/jobdone.svg')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Center(
                                child: LatoCenterCommonTextWidget(
                                    title: 'Job Uploaded Successfully!',
                                    textColor: normalblack,
                                    textSize: 24,
                                    textweight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const MulishCenterCommonTextWidget(
                                  title:
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has ',
                                  textColor: Color(0xFF5B5B5B),
                                  textSize: 14,
                                  textweight: FontWeight.w500),
                              const SizedBox(
                                height: 15,
                              ),
                              Commonbutton(
                                  button: 'Back to Home',
                                  ontapped: () {
                                    Get.offAllNamed(RoutesName.homeScreen,
                                        arguments: {
                                          'currentindex': 0,
                                          'isChoiseScreen': true,
                                          'islog': true
                                        });
                                  },
                                  horizontalpadding: 0,
                                  verticalPadding: 0,
                                  bgcolor: appThemecolor,
                                  borderwidth: 0,
                                  bordercolor: appThemecolor,
                                  textclr: whitecolor,
                                  txtweight: FontWeight.w500),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Future<void> videoDialog(BuildContext context) async {
    RxBool isPlaying = false.obs; // Set initial state to playing

    await showGeneralDialog(
      context: context,
      transitionBuilder: (context, a1, a2, widget) => ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            title: PopScope(
              canPop: true,
              onPopInvoked: (didPop) async {
                await _controllerVideoPlayer.value.pause();
              },
              child: Center(
                child: Obx(
                  () => ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _controllerVideoPlayer.value.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controllerVideoPlayer
                                    .value.value.aspectRatio,
                                child:
                                    VideoPlayer(_controllerVideoPlayer.value),
                              )
                            : Container(),
                        IconButton(
                          icon: Icon(
                            isPlaying.value ? Icons.pause : Icons.play_arrow,
                            size: 50.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (isPlaying.value) {
                              _controllerVideoPlayer.value.pause();
                              isPlaying.value = !isPlaying.value;
                            } else {
                              if (_controllerVideoPlayer
                                  .value.value.isInitialized) {
                                _controllerVideoPlayer.value.play();
                                isPlaying.value = !isPlaying.value;
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Container();
      },
    );
  }
}

mixin MyTabCallback {
  final JobDtlController _controller = Get.find<JobDtlController>();

  void callback(String jobId) {
    _controller.getJobDtlApi(jobId: jobId);
  }
}
