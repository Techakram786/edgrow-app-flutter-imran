import 'package:edgrow_app/authentication/controllers/chooseLoginController.dart';

import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Service/Notification/DeviceToken.dart';
import '../../commons/common_colors.dart';
import '../../commons/common_widgets.dart';


class ChooseLoginRegisterScreen extends StatefulWidget {
  const ChooseLoginRegisterScreen({super.key});

  @override
  State<ChooseLoginRegisterScreen> createState() =>
      _ChooseLoginRegisterScreenState();
}

class _ChooseLoginRegisterScreenState extends State<ChooseLoginRegisterScreen> {
  final ChooseController _chooseController = Get.put(ChooseController());
  @override
  Widget build(BuildContext context) {
    NotificationDeviceToken.deviceTokenRefresh();
    NotificationDeviceToken.notificationDeviceToken();
    return Scaffold(
      backgroundColor: whitecolor,
      body: Obx(
        () => Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(
                    'assets/icons/choosevector.svg',
                    height: 36,
                  )),
            ),
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.60,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/signuplogo.png'),
                          fit: BoxFit.cover)),
                  // child: Image.asset(
                  //   "assets/icons/signuplogo.png",
                  //   fit: BoxFit.cover,
                  // ),
                ),
                // Image.asset(
                //   "assets/icons/signuplogo.png",
                //   fit: BoxFit.cover,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      const LatoCenterCommonTextWidget(
                        title:
                            'Nearest Step to Get your Dream Job at your Hands!',
                        maxLine: 2,
                        textColor: appThemecolor,
                        textSize: 24,
                        textweight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Commonbutton(
                        button: 'Sign In',
                        ontapped: () {
                          _chooseController.chooseindex.value = 0;

                          Get.toNamed(RoutesName.loginScreen);
                        },
                        horizontalpadding: 0,
                        verticalPadding: 0,
                        bgcolor: _chooseController.chooseindex.value == 0
                            ? appThemecolor
                            : whitecolor,
                        borderwidth: 0,
                        bordercolor: appThemecolor,
                        textclr: _chooseController.chooseindex.value == 0
                            ? whitecolor
                            : appThemecolor,
                        txtweight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Commonbutton(
                        button: 'Register Now',
                        ontapped: () {
                          _chooseController.chooseindex.value = 1;
                         /* Get.to(() => const CreateYourProfileScreen(),
                              transition: Transition.leftToRight);*/
                          Get.toNamed(RoutesName.registerScreen);
                        },
                        horizontalpadding: 0,
                        verticalPadding: 0,
                        bgcolor: _chooseController.chooseindex.value == 1
                            ? appThemecolor
                            : whitecolor,
                        borderwidth: 0,
                        bordercolor: appThemecolor,
                        textclr: _chooseController.chooseindex.value == 1
                            ? whitecolor
                            : appThemecolor,
                        txtweight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.offAllNamed(RoutesName.homeScreen,arguments:{'currentindex': 0,'isChoiseScreen':false,'islog':false} );
                          },
                          child: const LatoCenterCommonTextWidget(
                              title: 'Skip for Now',
                              textColor: normalblack,
                              textSize: 14,
                              textweight: FontWeight.w500))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
