import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';

import '../widget/fill_details_profile_widget.dart';
import '../../../../widget/loader/loader.dart';
import '../view_model/Fill_Dtl_controller.dart';


class FillDetailsToProfileScreen extends StatelessWidget {
   FillDetailsToProfileScreen({super.key});
  final FillDtlController _controller = Get.put(FillDtlController());
  @override
  Widget build(BuildContext context) {
    _controller.getProfileDtlApi(context);
    return Obx(()=>
        Loader.screenLoader(
          loading: _controller.screenLoader.value,
         myWidget: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xFFFFFFFF),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whitecolor,
            foregroundColor: const Color(0xFFFFFFFF),
            surfaceTintColor: const Color(0xFFFFFFFF),
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
          body: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              physics: const BouncingScrollPhysics(),
              children: [
                const LatoCenterCommonTextWidget(
                    title: 'Please Fill These Details to Complete the Profile',
                    textColor: normalblack,
                    textSize: 20,
                    textweight: FontWeight.w700),
                const SizedBox(
                  height: 20,
                ),
                FillDetailsCard(
                  iconpic: 'assets/icons/contactInfo.svg',
                  titlename: 'Contact Info',
                    status: _controller.profileDtlModel?.contactInfo,
                  detailtap: () {
                    if(_controller.profileDtlModel?.contactInfo==0){
                      Get.toNamed(RoutesName.contactInfoScreen);
                    }else{
                      Get.snackbar(
                          'Contact Info', 'Details Already Filled',
                          backgroundColor: textfeildborder);
                    }

                  },
                ),
                FillDetailsCard(
                  iconpic: 'assets/icons/edudetails.svg',
                  titlename: 'Education Details',
                  status: _controller.profileDtlModel?.educationDetails,
                  detailtap: () {
                    if(_controller.profileDtlModel?.educationDetails==0){
                      Get.toNamed(RoutesName.eduDtlScreen,arguments: {'screen_type':'new'});
                    }else{
                      Get.snackbar(
                          'Education Details', 'Details Already Filled',
                          backgroundColor: textfeildborder);
                    }

                  },
                ),
                FillDetailsCard(
                  iconpic: 'assets/icons/keyskills.svg',
                  titlename: 'Key Skills',
                  status: _controller.profileDtlModel?.keySkills,
                  detailtap: () {
                    if(_controller.profileDtlModel?.keySkills==0){
                      Get.toNamed(RoutesName.keySkillScreen,arguments: {'screen_type':'FillDtl'});
                    }else{
                      Get.snackbar(
                          'Key Skills', 'Details Already Filled',
                          backgroundColor: textfeildborder);
                    }

                  },
                ),
                FillDetailsCard(
                  iconpic: 'assets/icons/jobop.svg',
                  titlename: 'Job opportunity',
                  status: _controller.profileDtlModel?.jobPreferences,
                  detailtap: () {
                    if(_controller.profileDtlModel?.jobPreferences==0){
                      Get.toNamed(RoutesName.jobPrefScreen);
                    }else{
                      Get.snackbar(
                          'Job opportunity', 'Details Already Filled',
                          backgroundColor: textfeildborder);
                    }

                  },
                ),
                FillDetailsCard(
                  iconpic: 'assets/icons/pflocation.svg',
                  titlename: 'Preferred Location',
                  status: _controller.profileDtlModel?.preferredLocation,
                  detailtap: () {
                    if(_controller.profileDtlModel?.preferredLocation==0){
                      Get.toNamed(RoutesName.prefLocScreen);
                    }else{
                      Get.snackbar(
                          'Preferred Location', 'Details Already Filled',
                          backgroundColor: textfeildborder);
                    }

                  },
                ),
                FillDetailsCard(
                  iconpic: 'assets/icons/expsal.svg',
                  titlename: 'Expected salary',
                  status: _controller.profileDtlModel?.expectedSalary,
                  detailtap: () {
                    if(_controller.profileDtlModel?.expectedSalary==0){
                      Get.toNamed(RoutesName.expSalaryScreen);
                    }else{
                      Get.snackbar(
                          'Expected salary', 'Details Already Filled',
                          backgroundColor: textfeildborder);
                    }

                  },
                ),
                FillDetailsCard(
                  iconpic: 'assets/icons/uploadres.svg',
                  titlename: 'Upload CV/Resume',
                  status: _controller.profileDtlModel?.resume,
                  detailtap: () {
                    if(_controller.profileDtlModel?.resume==0){
                      Get.toNamed(RoutesName.uploadCvScreen,arguments: {'screen_type':'new'});
                    }else{
                      Get.snackbar(
                          "'Upload CV/Resume", 'Details Already Filled',
                          backgroundColor: textfeildborder);
                    }
                  },
                ),
              ]),
               ),
       ),
    );
  }
}
