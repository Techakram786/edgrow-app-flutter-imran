import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileEditCard extends StatelessWidget {
  final String profileName,
      jobRole,
      phoneNo,
      emailId,
      gender,
      location,
      websiteName;
  final VoidCallback edittap;
  const ProfileEditCard(
      {super.key,
      required this.profileName,
      required this.jobRole,
      required this.phoneNo,
      required this.emailId,
      required this.gender,
      required this.location,
      required this.websiteName,
      required this.edittap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: textfeildborder),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LatoCommonTextWidget(
                    title: profileName,
                    textColor: normalblack,
                    textSize: 16,
                    textweight: FontWeight.w600),
                InkWell(
                  onTap: edittap,
                  child: SvgPicture.asset(
                    'assets/icons/editprofile.svg',
                    height: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //jobrole
            Row(
              children: [
                SvgPicture.asset('assets/icons/mathsfaculty.svg'),
                const SizedBox(
                  width: 5,
                ),
                LatoCommonTextWidget(
                    title: jobRole,
                    textColor: normalblack,
                    textSize: 14,
                    textweight: FontWeight.w500),
              ],
            ),
            //phonenumber
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/profilecall.svg'),
                const SizedBox(
                  width: 5,
                ),
                LatoCommonTextWidget(
                    title: phoneNo,
                    textColor: normalblack,
                    textSize: 14,
                    textweight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //email
            Row(
              children: [
                SvgPicture.asset('assets/icons/email.svg'),
                const SizedBox(
                  width: 5,
                ),
                LatoCommonTextWidget(
                    title: emailId,
                    textColor: normalblack,
                    textSize: 14,
                    textweight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //male
            Row(
              children: [
                SvgPicture.asset('assets/icons/gender.svg'),
                const SizedBox(
                  width: 5,
                ),
                LatoCommonTextWidget(
                    title: gender,
                    textColor: normalblack,
                    textSize: 14,
                    textweight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //location
            Row(
              children: [
                SvgPicture.asset('assets/icons/location.svg'),
                const SizedBox(
                  width: 5,
                ),
                LatoCommonTextWidget(
                    title: location,
                    textColor: normalblack,
                    textSize: 14,
                    textweight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //website
            Row(
              children: [
                SvgPicture.asset('assets/icons/website.svg'),
                const SizedBox(
                  width: 5,
                ),
                LatoCommonTextWidget(
                    title: websiteName,
                    textColor: normalblack,
                    textSize: 14,
                    textweight: FontWeight.w500),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
