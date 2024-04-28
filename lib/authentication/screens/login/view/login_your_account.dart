import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../commons/common_colors.dart';
import '../../../../widget/button.dart';

import '../view_model/login_controller.dart';


class LoginAccountScreen extends StatelessWidget {
  const LoginAccountScreen({super.key});



  @override
  Widget build(BuildContext context) {
    TextEditingController emailormobilecontroller = TextEditingController();

    TextEditingController passwordcontroller = TextEditingController();

    RxBool ispass = false.obs;

    GlobalKey<FormState> loginkey = GlobalKey<FormState>();
    final LoginController loginController = Get.put(LoginController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFFFFFFF),
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
        body: Obx(
          () => ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 15,
              ),
              const LatoCenterCommonTextWidget(
                  title: 'Login to Your Account',
                  textColor: normalblack,
                  textSize: 20,
                  textweight: FontWeight.w700),
              const LatoCenterCommonTextWidget(
                  title: 'Searching for Jobs here is your portal!',
                  textColor: normalblack,
                  textSize: 12,
                  textweight: FontWeight.w500),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: loginkey,
                child: Column(
                  children: [
                    Commontextformfeild(
                      controller: emailormobilecontroller,
                      maxLines: 1,
                      minLines: 1,
                      hintText: 'Email ID or Mobile Number',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: false,
                      typeOfRed: <TextInputFormatter>[
                        // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-z,A-Z,0-9,@,.,#,]')),
                        LengthLimitingTextInputFormatter(40),
                      ],
                      isErrorText: false,
                      isErrorTextString:
                          'Please enter Email ID or Mobile Number',
                      keyboardPopType: TextInputType.emailAddress,
                      icontap: () {},
                      isicon: false,
                      passwordicon: Icons.visibility,
                      iconspic: Icons.email_outlined,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email ID or Mobile Number';
                        } else {
                          return null;
                        }
                      },
                      labelname: 'Email ID or Mobile Number',
                      suffexiconcolor: Colors.grey.shade400,
                      // preitem: false,

                      enabled: true,
                      onChangeVal: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Commontextformfeild(
                      controller: passwordcontroller,
                      maxLines: 1,
                      minLines: 1,
                      hintText: 'Enter Password',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: ispass.value,
                      typeOfRed: <TextInputFormatter>[
                        // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9,A-Z,a-z,@,.,#,]')),
                        LengthLimitingTextInputFormatter(20),
                      ],
                      isErrorText: false,
                      isErrorTextString: 'Please enter Password',
                      keyboardPopType: TextInputType.text,
                      icontap: () {
                        ispass.value = !ispass.value;
                      },
                      isicon: true,
                      passwordicon: ispass.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      iconspic: Icons.lock_outline,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        } else {
                          return null;
                        }
                      },
                      labelname: 'Password',
                      suffexiconcolor: hintcolor,
                      enabled: true,
                      onChangeVal: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const LatoCommonTextWidget(
                        title: 'Forgot Password?',
                        textColor: appThemecolor,
                        textSize: 12,
                        textweight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              loginController.buttonLoader.value?
              PlatformButton(
                onPressed: () {},
                buttonText: '',
                loadingButton: true,
                borderRadius: 5,
                height: 50,
                minWidth: double.infinity,
              ):PlatformButton(
                buttonText: 'Submit ',
                onPressed: () async {
                  if (loginkey.currentState!.validate()) {

                        loginController.loginApi(
                            login: emailormobilecontroller.text,
                            password: passwordcontroller.text,
                        );

                  }
                },
                borderRadius: 5,
                height: 50,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                minWidth: double.infinity,)
            ],
          ),
        ),
      ),
    );
  }
}
