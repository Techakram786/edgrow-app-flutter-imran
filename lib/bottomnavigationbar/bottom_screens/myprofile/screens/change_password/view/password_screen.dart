
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../widget/button.dart';
import '../view_model/change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({super.key});

  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _updateKey = GlobalKey<FormState>();

  final ChangePasswordController _controller = Get.put(ChangePasswordController());

  RxBool isNewPass = true.obs;
  RxBool isConfirmPass = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: whitecolor,
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
          title: 'Change Password',
          textColor: normalblack,
          textSize: 16,
          textweight: FontWeight.w600,
        ),
        titleSpacing: -3,
      ),
      body: Obx(()=>
         ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          physics: const BouncingScrollPhysics(),
          children: [
            Form(
              key: _updateKey,
              child: Column(
                children: [
                  Commontextformfeild(
                    controller: oldPasswordController,
                    maxLines: 1,
                    minLines: 1,
                    hintText: 'Old Password',
                    isPassword: false,
                    isSuffixPressed: () {},
                    isObscureText: false,
                    typeOfRed: <TextInputFormatter>[
                      // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                      FilteringTextInputFormatter.allow(
                          RegExp('[a-z,A-Z,0-9,@,.,#,]')),
                      LengthLimitingTextInputFormatter(50),
                    ],
                    isErrorText: false,
                    isErrorTextString: 'please enter Old Password',
                    keyboardPopType: TextInputType.emailAddress,
                    icontap: () {},
                    isicon: false,
                    passwordicon: Icons.visibility,
                    iconspic: Icons.email_outlined,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please Enter Old Password';
                      } else {
                        return null;
                      }
                    },
                    labelname: 'Old Password',
                    suffexiconcolor: Colors.grey.shade400,
                    // preitem: false,

                    enabled: true,
                    onChangeVal: (value) {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Commontextformfeild(
                    controller: newPasswordController,
                    maxLines: 1,
                    minLines: 1,
                    hintText: 'New Password',
                    isPassword: false,
                    isSuffixPressed: () {},
                    isObscureText: isNewPass.value,
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
                      isNewPass.value = !isNewPass.value;
                    },
                    isicon: true,
                    passwordicon: isNewPass.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    iconspic: Icons.lock_outline,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please New Password Password';
                      } else {
                        return null;
                      }
                    },
                    labelname: 'New Password',
                    suffexiconcolor: hintcolor,
                    enabled: true,
                    onChangeVal: (value) {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Commontextformfeild(
                    controller: confirmPasswordController,
                    maxLines: 1,
                    minLines: 1,
                    hintText: 'Confirm Password',
                    isPassword: false,
                    isSuffixPressed: () {},
                    isObscureText: isConfirmPass.value,
                    typeOfRed: <TextInputFormatter>[
                      // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                      FilteringTextInputFormatter.allow(
                          RegExp('[0-9,A-Z,a-z,@,.,#,]')),
                      LengthLimitingTextInputFormatter(20),
                    ],
                    isErrorText: false,
                    isErrorTextString: 'Please Confirm  Password',
                    keyboardPopType: TextInputType.text,
                    icontap: () {
                      isConfirmPass.value = !isConfirmPass.value;
                    },
                    isicon: true,
                    passwordicon: isConfirmPass.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    iconspic: Icons.lock_outline,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Confirm Password Password';
                      } else {
                        return null;
                      }
                    },
                    labelname: 'Confirm Password',
                    suffexiconcolor: hintcolor,
                    enabled: true,
                    onChangeVal: (value) {},
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(()=>
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: _controller.buttonLoader.value?
          PlatformButton(
            onPressed: () {},
            buttonText: '',
            loadingButton: true,
            borderRadius: 5,
            height: 50,
            minWidth: double.infinity,
          ):PlatformButton(
            buttonText: 'Submit',
            onPressed: () async {
              if (_updateKey.currentState!.validate()) {
                _controller.changePasswordApi(oldPassword: oldPasswordController.text,
                    newPassword: newPasswordController.text, confirmPassword: confirmPasswordController.text);
              }
            },
            borderRadius: 5,
            height: 50,
            fontSize: 18,

            fontWeight: FontWeight.w500,
            minWidth: double.infinity,),
        ),
      ),
    );
  }
}
