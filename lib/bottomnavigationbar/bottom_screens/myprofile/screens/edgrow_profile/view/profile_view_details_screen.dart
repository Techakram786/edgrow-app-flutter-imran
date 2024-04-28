
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../../Utils/image_picker/select_photo_options_screen.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../widgets/profile_edit_card.dart';
import '../view_model/edgrow_profile_controller.dart';

import 'dart:io';
import 'package:dio/dio.dart' as dio;

class ProfileViewScreen extends StatefulWidget {
  const ProfileViewScreen({super.key});

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  var progressValue = 0.7;
  RxBool isEdu = true.obs;
  RxBool isWork = true.obs;
  RxBool isBreif = true.obs;

  int currentIndex = 0;
  int activeIndex = 0;
  final assetsImage = [
    'assets/icons/newbanner_pro.png',
    'assets/icons/newbanner_pro.png',
    'assets/icons/newbanner_pro.png',
  ];

  // final ProgressController controller = Get.put(ProgressController());
  //   final EdgrowController _controller = Get.put(EdgrowController());
    final EdgrowController _controller = Get.put(EdgrowController());
  File? _image;

  Future _pickImage(ImageSource source,BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      File? img = File(image.path);
      // img = await compressImage(   img); // Compress the image

      setState(() async {
        _image = img;
        var pic = await dio.MultipartFile.fromFile(
          _image!.path,
          filename: _image!.path.split('/').last,
        );

        _controller.updateProfilePicApi(profilePic: pic);
        if (context.mounted) Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      if (context.mounted) Navigator.of(context).pop();// Assuming `context` is accessible here
    }
  }


  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Loader.screenLoader(
         loading: _controller.screenLoader.value,
         myWidget: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          appBar: AppBar(
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
            elevation: 0,
          ),
          body:  Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        color: const Color(0xFF1D1D6D),
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      Container(
                        color: whitecolor,
                        height: MediaQuery.of(context).size.height * 0.10,
                      )
                    ],
                  ),
                  Positioned(
                      top:10,
                      left: 10,
                      right: 20,
                      child: (_controller.edgrowProfileModel?.value.profilePicture?.isNotEmpty??false)
                          ? CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                          backgroundImage:NetworkImage('${_controller.edgrowProfileModel?.value.profilePicture}')
                        // child: Image.file(_profile!),
                      )
                          : CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.amber,
                        child: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 48,
                            backgroundColor: Colors.pink.shade300,
                            backgroundImage: const AssetImage(
                              'assets/images/propiclat.jpg',
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(125, 80, 71, 71),
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      left: 20,
                      right: 20,
                      top: 45,
                      child: InkWell(
                        onTap: () {
                          _showSelectPhotoOptions(context);
                        },
                        child: const Center(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      )),
                  Positioned(
                    left: 200,
                    bottom: 80,
                    child: GestureDetector(
                        onTap: () {
         
                        },
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF1D1D6D),
                          radius: 14,
                          child: SvgPicture.asset(
                            'assets/icons/imageedit.svg',
                            height: 40,
                          ),
                        )),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ProfileEditCard(
                          profileName: _controller.edgrowProfileModel?.value.fullName ?? '',
                          jobRole: _controller.edgrowProfileModel?.value.currentPositionName ?? '',
                          phoneNo: _controller.edgrowProfileModel?.value.mobileNumber ?? '',
                          emailId: _controller.edgrowProfileModel?.value.email ?? '',
                          gender: _controller.edgrowProfileModel?.value.gender ?? '',
                          location: _controller.edgrowProfileModel?.value.cityName ?? '',
                          websiteName: _controller.edgrowProfileModel?.value.portfolio?.isNotEmpty == true ? _controller.edgrowProfileModel?.value.portfolio![0] ?? '' : '',
         
         
                          edittap: () {
                            Get.toNamed(RoutesName.editProfileScreen,arguments: {'profile_dtl':_controller.edgrowProfileModel})?.then(
                                    (value) => _controller.getEdgrowProfileApi()
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Text(progressvalue.toString()),
                      //complete profile bar
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const LatoCommonTextWidget(
                                title: 'Complete the Profile',
                                textColor: normalblack,
                                textSize: 14,
                                textweight: FontWeight.w600),
                            LatoCommonTextWidget(
                                title: '${_controller.edgrowProfileModel?.value.profileCompletionPercentage ?? 0}',
                                textColor: appThemecolor,
                                textSize: 14,
                                textweight: FontWeight.w700),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: LinearProgressIndicator(
                                backgroundColor: const Color(0xFFD9D9D9),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF286BFF),
                                ),
                                value: _controller.edgrowProfileModel?.value.profileCompletionPercentage != null
                                    ? _controller.edgrowProfileModel!.value.profileCompletionPercentage!/ 100
                                    : 0,
         
                                minHeight: 9,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Positioned(
                              // top: 0,
                              bottom: -1,
                              child: Image.asset(
                                'assets/icons/progrestick.png',
                                height: 28,
                              ),
                            ),
                            Positioned(
                              left: 50,
                              right: 50,
                              bottom: -1,
                              child: _controller.edgrowProfileModel?.value.profileCompletionPercentage != null
                                  ? _controller.edgrowProfileModel!.value.profileCompletionPercentage!/ 100 < 0.5
                                  ? Image.asset('assets/icons/greyicon.png', height: 28)
                                  : Image.asset('assets/icons/progrestick.png', height: 28)
                                  : const SizedBox.shrink(), // Handle null case, you can replace it with an appropriate widget or logic
                            ),
                            Positioned(
                                right: 2,
                                child: _controller.edgrowProfileModel?.value.profileCompletionPercentage != null
                                    ?  _controller.edgrowProfileModel!.value.profileCompletionPercentage! / 100 < 1.0
                                    ? Image.asset(
                                      'assets/icons/greyicon.png',
                                        height: 28,
                                      )
                                    : Image.asset(
                                        'assets/icons/progrestick.png',
                                        height: 28,
                                      ):
                                const SizedBox.shrink()
                            ),
                          ],
                        ),
                      ),
                      //slider
         
                      plotsCarsoul(),
                      Center(
                        child: buildIndicator(),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
         
                      Obx(
                        () => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const LatoCommonTextWidget(
                                      title: 'Career Brief',
                                      textColor: normalblack,
                                      textSize: 14,
                                      textweight: FontWeight.w600),
                                  InkWell(
                                      onTap: () {
                                        Get.toNamed(RoutesName.carrerBreiefScreen,arguments: {'career_brief':_controller.edgrowProfileModel?.value.careerBrief})?.then((value) =>
                                        _controller.getEdgrowProfileApi());
                                      },
                                    child: _controller.edgrowProfileModel?.value.careerBrief?.isNotEmpty ?? false
                                        ? SvgPicture.asset(
                                      'assets/icons/editprofile.svg',
                                      height: 20,
                                    )
                                        : SvgPicture.asset(
                                      'assets/icons/addicon.svg',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
         
                            const SizedBox(
                              height: 8,
                            ),
                            _controller.edgrowProfileModel?.value.careerBrief?.isNotEmpty ?? false ?
                            Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: textfeildborder),
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: LatoCommonTextWidget(
                                          title:
                                              _controller.edgrowProfileModel?.value.careerBrief ?? '',
                                          textColor: const Color(0xFF586688),
                                          textSize: 11,
                                          textweight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ):const SizedBox.shrink(),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      isWork.value = !isWork.value;
                                    },
                                    child: const LatoCommonTextWidget(
                                        title: 'Work Experience',
                                        textColor: normalblack,
                                        textSize: 14,
                                        textweight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RoutesName.workExperienceScreen,arguments: {'screen_type':'Add'})?.then((value)
                                      => _controller.getWorkExpApi());
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/addicon.svg',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: _controller.workExpList.isNotEmpty?_controller.workExpList.length*83:0,
                              child: ListView.builder(
                                  itemCount: _controller.workExpList.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context,index){
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5, color: textfeildborder),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                   LatoCommonTextWidget(
                                                      title:'${_controller.workExpList[index].title}',
                                                      textColor: normalblack,
                                                      textSize: 14,
                                                      textweight: FontWeight.w600),
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          _controller.deleteWorkExpDtlApi(workExpId: _controller.workExpList[index].id.toString()).then((value) =>
                                                          _controller.getWorkExpApi());
                                                        },
                                                        child: SvgPicture.asset(
                                                          'assets/icons/deleteicon.svg',
                                                          height: 20,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 14,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.toNamed(RoutesName.workExperienceScreen,arguments: {'screen_type':'edit','edit_dtl_id':_controller.workExpList[index].id})?.then(
                                                                  (value) => _controller.getWorkExpApi());
                                                        },
                                                        child: SvgPicture.asset(
                                                          'assets/icons/editprofile.svg',
                                                          height: 20,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                               LatoCommonTextWidget(
                                                  title: '${_controller.workExpList[index].companyName}',
                                                  textColor: edufulltime,
                                                  textSize: 12,
                                                  textweight: FontWeight.w500),
         
                                              LatoCommonTextWidget(
                                                  title: '${_controller.workExpList[index].startYear}-${_controller.workExpList[index].endYear}',
                                                  textColor: edufulltime,
                                                  textSize: 12,
                                                  textweight: FontWeight.w500),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      isEdu.value = !isEdu.value;
                                    },
                                    child: const LatoCommonTextWidget(
                                        title: 'Education',
                                        textColor: normalblack,
                                        textSize: 14,
                                        textweight: FontWeight.w600),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(RoutesName.eduDtlScreen,arguments: {'screen_type':'Add'})?.then(
                                              (value) => _controller.getEduDtlApi());
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/addicon.svg',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: _controller.eduDtlList.isNotEmpty?_controller.eduDtlList.length*100:0,
                              child: ListView.builder(
                                  itemCount: _controller.eduDtlList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context,index){
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5, color: textfeildborder),
                                                borderRadius: BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      LatoCommonTextWidget(
                                                          title:'${_controller.eduDtlList[index].highestQualification}',
                                                          textColor: normalblack,
                                                          textSize: 14,
                                                          textweight: FontWeight.w600),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              _controller.deleteEduDtlApi(eduId: _controller.eduDtlList[index].id.toString()).then((value) =>
                                                              _controller.getEduDtlApi());
                                                            },
                                                            child: SvgPicture.asset(
                                                              'assets/icons/deleteicon.svg',
                                                              height: 20,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 14,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Get.toNamed(RoutesName.eduDtlScreen,arguments: {'screen_type':'edit','edit_dtl_id':_controller.eduDtlList[index].id})?.then(
                                                                      (value) => _controller.getEduDtlApi());
                                                            },
                                                            child: SvgPicture.asset(
                                                              'assets/icons/editprofile.svg',
                                                              height: 20,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  LatoCommonTextWidget(
                                                      title: '${_controller.eduDtlList[index].course}',
                                                      textColor: edufulltime,
                                                      textSize: 12,
                                                      textweight: FontWeight.w500),
                                                  LatoCommonTextWidget(
                                                      title: '${_controller.eduDtlList[index].universityName}',
                                                      textColor: edufulltime,
                                                      textSize: 12,
                                                      textweight: FontWeight.w500),
         
                                                  LatoCommonTextWidget(
                                                      title: '${_controller.eduDtlList[index].startYear}-${_controller.eduDtlList[index].endYear}',
                                                      textColor: edufulltime,
                                                      textSize: 12,
                                                      textweight: FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    );
                                  }),
                            ),
         
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const LatoCommonTextWidget(
                                      title: 'Skills',
                                      textColor: normalblack,
                                      textSize: 14,
                                      textweight: FontWeight.w600),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(RoutesName.keySkillScreen,arguments: {'screen_type':'EdgrowProfile','skill_list':_controller.skillList})?.then((value)
                                      => _controller.getSkillDtlApi());
                                    },
                                    child:_controller.skillList.isEmpty? SvgPicture.asset(
                                      'assets/icons/addicon.svg',
                                      height: 20,
                                    ):SvgPicture.asset(
                                      'assets/icons/editprofile.svg',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisExtent: 45,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                              ),
                              shrinkWrap: true,
                              itemCount: _controller.skillList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (_, i) {
                                return GestureDetector(
                                  onTap: () {
         
                                  },
                                  child:Container(
         
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(18),
                                      color:  whitecolor,
                                      border: Border.all(
                                          color: const Color(0xFFC1C1C1), // Set the border color
                                          width: 0.5 // Set the border width
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: LatoCenterCommonTextWidget(
                                            title: _controller.skillList[i],
                                            textColor:  normalblack,
                                            textSize: 12,
                                            textweight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        const Expanded(
                                          flex: 4,
                                          child: InkWell(
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFFC1C1C1),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const LatoCommonTextWidget(
                                      title: 'Language',
                                      textColor: normalblack,
                                      textSize: 14,
                                      textweight: FontWeight.w600),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(RoutesName.edgrowLanguageScreen,arguments: {'updated_lang':_controller.languageList})?.then((value)
                                      => _controller.getLangDtlApi());
                                    },
                                    child:_controller.languageList.isEmpty? SvgPicture.asset(
                                      'assets/icons/addicon.svg',
                                      height: 20,
                                    ):SvgPicture.asset(
                                      'assets/icons/editprofile.svg',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisExtent: 30,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _controller.languageList.length,
                                itemBuilder: (_, i) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(14),
                                      color:  whitecolor,
                                      border: Border.all(
                                          color: const Color(0xFFC1C1C1), // Set the border color
                                          width: 0.5 // Set the border width
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: LatoCenterCommonTextWidget(
                                            title: _controller.languageList[i],
                                            textColor:  normalblack,
                                            textSize: 12,
                                            textweight: FontWeight.w500,
                                          ),
                                        ),
                                        /*SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: InkWell(
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFFC1C1C1),
                                              size: 15,
                                            ),
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const LatoCommonTextWidget(
                                      title: 'Hobbies',
                                      textColor: normalblack,
                                      textSize: 14,
                                      textweight: FontWeight.w600),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(RoutesName.edgrowHobbyScreen,arguments: {'updated_hobby':_controller.hobbiesList})?.then((value)
                                      => _controller.getHobbiesDtlApi());
                                    },
                                    child: _controller.hobbiesList.isEmpty? SvgPicture.asset(
                                      'assets/icons/addicon.svg',
                                      height: 20,
                                    ):SvgPicture.asset(
                                      'assets/icons/editprofile.svg',
                                      height: 20,
                                    )
                                  ),
         
         
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisExtent: 30,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(
         
                                ),
                                itemCount: _controller.hobbiesList.length,
                                itemBuilder: (_, i) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(14),
                                      color:  whitecolor,
                                      border: Border.all(
                                          color: const Color(0xFFC1C1C1), // Set the border color
                                          width: 0.5 // Set the border width
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: LatoCenterCommonTextWidget(
                                            title: _controller.hobbiesList[i],
                                            textColor:  normalblack,
                                            textSize: 12,
                                            textweight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        /*Expanded(
                                          flex: 4,
                                          child: InkWell(
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFFC1C1C1),
                                              size: 15,
                                            ),
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const LatoCommonTextWidget(
                                      title: 'Job Type',
                                      textColor: normalblack,
                                      textSize: 14,
                                      textweight: FontWeight.w600),
                                  InkWell(
                                      onTap: () {
                                        Get.toNamed(RoutesName.edgrowJobTypeScreen,arguments: {'updated_jobType':_controller.jobTypeList})?.then((value)
                                        => _controller.getJobTypeDtlApi());
                                      },
                                      child: _controller.jobTypeList.isEmpty? SvgPicture.asset(
                                        'assets/icons/addicon.svg',
                                        height: 20,
                                      ):SvgPicture.asset(
                                        'assets/icons/editprofile.svg',
                                        height: 20,
                                      )
                                  ),
         
         
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisExtent: 30,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(
         
                                ),
                                itemCount: _controller.jobTypeList.length,
                                itemBuilder: (_, i) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(14),
                                      color:  whitecolor,
                                      border: Border.all(
                                          color: const Color(0xFFC1C1C1), // Set the border color
                                          width: 0.5 // Set the border width
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: LatoCenterCommonTextWidget(
                                            title: _controller.jobTypeList[i],
                                            textColor:  normalblack,
                                            textSize: 12,
                                            textweight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        /*Expanded(
                                          flex: 4,
                                          child: InkWell(
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFFC1C1C1),
                                              size: 15,
                                            ),
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
              ),
            ],
          ),
         
               ),
       ),
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
                onTap: _pickImage,
              ),
            );
          }),
    );
  }
  Widget plotsCarsoul() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // height: 200,
        // width: 350,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),

        child: CarouselSlider.builder(
          itemCount: _controller.bannerList.length,
          itemBuilder: (context, index, realIndex) {
            // final localImage = assetsImage[index];
            return  _controller.bannerList.isNotEmpty?buildImage(index):const SizedBox.shrink();
          },
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.20,
            aspectRatio: 18 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 1,
            autoPlay: false,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: _controller.bannerList.length,
      effect: const ExpandingDotsEffect(
          dotHeight: 6,
          dotWidth: 6,
          spacing: 4.5,
          activeDotColor: appThemecolor,
          dotColor: Colors.grey));

  Widget buildImage( int index) => Container(
    // height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: NetworkImage(
          '${_controller.bannerList[index].image}',
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


