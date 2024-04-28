
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../myprofile/screens/my_courses_screen.dart';

class PaymentDoneSuccessfulScreen extends StatefulWidget {
  const PaymentDoneSuccessfulScreen({super.key});

  @override
  State<PaymentDoneSuccessfulScreen> createState() =>
      _PaymentDoneSuccessfulScreenState();
}

class _PaymentDoneSuccessfulScreenState
    extends State<PaymentDoneSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(
            height: 180,
          ),
          Center(
            child: Image.asset(
              'assets/images/sucesful.png',
              height: 152,
            ),
          ),
          const LatoCenterCommonTextWidget(
              title: 'Payment Done\nSuccessfully!',
              textColor: normalblack,
              textSize: 24,
              textweight: FontWeight.w600),
          const SizedBox(
            width: 200,
            child: MulishCenterCommonTextWidget(
                title:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has ',
                textColor: normalblack,
                textSize: 14,
                textweight: FontWeight.w500),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.11,
        color: whitecolor,
        child: Column(
          children: [
            DividerLine(lineHeight: 1, dividercolor: Colors.grey.shade300),
            Commonbutton(
                button: 'Go to My Courses',
                ontapped: () {
                  Get.to(() => MyCoursesScreen(),
                      transition: Transition.cupertino);
                },
                horizontalpadding: 15,
                verticalPadding: 10,
                bgcolor: appThemecolor,
                borderwidth: 0,
                bordercolor: appThemecolor,
                textclr: whitecolor,
                txtweight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
