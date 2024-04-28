
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../widgets/profile_screen_widget.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whitecolor,
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
        title: const LatoCommonTextWidget(
          title: 'Account Settings',
          textColor: normalblack,
          textSize: 16,
          textweight: FontWeight.w600,
        ),
        titleSpacing: -3,
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imageHeight: 30,
            imageWidth: 30,
            leadingImage: 'assets/icons/Notifications.svg',
            onTapFun: () {

              Get.toNamed(RoutesName.notificationScreen);
            },
            title: 'Notifications',
          ),
          const DividerLine(lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
          ProfileWidget(
            imageHeight: 30,
            imageWidth: 30,
            leadingImage: 'assets/icons/Passwords.svg',
            onTapFun: () {
              Get.toNamed(RoutesName.changePasswordScreen);
            },
            title: 'Passwords',
          ),
          const DividerLine(lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
          ProfileWidget(
            imageHeight: 30,
            imageWidth: 30,
            leadingImage: 'assets/icons/termsandconditions.svg',
            onTapFun: () {
              Get.toNamed(RoutesName.termConditionScreen);
            },
            title: 'Terms and Conditions',
          ),
          const DividerLine(lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
          ProfileWidget(
            imageHeight: 30,
            imageWidth: 30,
            leadingImage: 'assets/icons/privacypolicy.svg',
            onTapFun: () {
              Get.toNamed(RoutesName.privacyPolicyScreen);
            },
            title: 'Privacy Policy',
          ),
          const DividerLine(lineHeight: 0.5, dividercolor: Color(0xFFE0E0E0)),
        ],
      ),
    );
  }
}
