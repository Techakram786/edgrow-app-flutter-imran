import 'dart:io';

import 'package:edgrow_app/authentication/screens/register/view_model/register_controller.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../Utils/image_picker/select_photo_options_screen.dart';
import '../../../../commons/routes/routes_name.dart';
import '../../../../widget/button.dart';


class CreateYourProfileScreen extends StatefulWidget {
  const CreateYourProfileScreen({super.key});

  @override
  State<CreateYourProfileScreen> createState() =>
      _CreateYourProfileScreenState();
}

class _CreateYourProfileScreenState extends State<CreateYourProfileScreen> {
  final RegisterController _registerController = Get.put(RegisterController());

  var isChecked = false.obs;
  var password = ''.obs;
  RxBool isshow = false.obs;
  RxBool ispass = false.obs;

  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  final GlobalKey<FormState> profilecreatekey = GlobalKey<FormState>();
  ValueNotifier checkBoxKey = ValueNotifier<bool>(false);

  File? _image;

  Future _pickImage(ImageSource source,BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }
  @override
  Widget build(BuildContext context) {
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
        body: Obx(
          () => ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LatoCommonTextWidget(
                        title: 'Create Your Profile',
                        textColor: normalblack,
                        textSize: 20,
                        textweight: FontWeight.w700),
                    LatoCommonTextWidget(
                        title: 'Searching for jobs here is your portal!',
                        textColor: normalblack,
                        textSize: 12,
                        textweight: FontWeight.w700),
                  ],
                ),
              ),

              Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          color: whitecolor,
                        ),
                        const SizedBox(
                          height: 50,
                          width: double.infinity,
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 50,
                        left: MediaQuery.of(context).size.width / 2 - 80,
                        right: MediaQuery.of(context).size.width / 2 - 80,
                        child:_image == null
                            ? Image.asset(
                                'assets/icons/Group43693two.png',
                                height: 110,
                              )

                            // CircleAvatar(
                            //     radius: 90,
                            //     // backgroundColor: Colors.grey,
                            //     child: CircleAvatar(
                            //         radius: 88,
                            //         // backgroundColor: whitecolor,
                            //         child: ClipOval(
                            //           child: Image.asset(
                            //             "assets/icons/propfile.png",
                            //             fit: BoxFit.cover,
                            //           ),
                            //         )),
                            //   )
                            : CircleAvatar(
                                radius: 70,
                                // backgroundColor: Colors.white,
                                child: CircleAvatar(
                                    radius: 68,
                                    backgroundImage: FileImage(_image!)),
                              )),
                    Positioned(
                        right: 120,
                        bottom: 42,
                        child: InkWell(
                          onTap: () {
                            _showSelectPhotoOptions(context);

                          },
                          child: SvgPicture.asset(
                            'assets/icons/tapimage.svg',
                            height: 33,
                          ),
                        ))
                  ],
                ),

              Form(
                key: profilecreatekey,
                child: Column(
                  children: [
                    Commontextformfeild(
                      controller: fullnamecontroller,
                      maxLines: 1,
                      minLines: 1,
                      hintText: 'Full Name',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: false,
                      inputAction: TextInputAction.next,
                      typeOfRed: <TextInputFormatter>[
                        // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-z,A-Z,0-9,@,.,#, ]')),
                        LengthLimitingTextInputFormatter(50),
                      ],
                      isErrorText: false,
                      isErrorTextString: 'please enter full name',
                      keyboardPopType: TextInputType.emailAddress,
                      icontap: () {},
                      isicon: false,
                      passwordicon: Icons.visibility,
                      iconspic: Icons.email_outlined,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter full name';
                        } else {
                          return null;
                        }
                      },
                      labelname: 'Full Name',
                      suffexiconcolor: Colors.grey.shade400,
                      // preitem: false,

                      enabled: true,
                      onChangeVal: (value) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Commontextformfeild(
                      controller: mobilecontroller,
                      maxLines: 1,
                      minLines: 1,
                      hintText: 'Mobile Number',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: false,
                      inputAction: TextInputAction.next,
                      typeOfRed: <TextInputFormatter>[
                        // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-z,A-Z,0-9,@,.,#,]')),
                        LengthLimitingTextInputFormatter(10),
                      ],
                      isErrorText: false,
                      isErrorTextString: 'Please enter mobile number',
                      keyboardPopType: TextInputType.phone,
                      icontap: () {},
                      isicon: false,
                      passwordicon: Icons.visibility,
                      iconspic: Icons.email_outlined,
                      validation: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter mobile number';
                        } else if (text.length != 10) {
                          return 'Please Enter Valid Mobile Number';
                        } else if (!RegExp(r'[0-9]').hasMatch(text)) {
                          return 'Enter Valid mobile Number';
                        } else {
                          return null;
                        }
                      },
                      labelname: 'Mobile Number',
                      suffexiconcolor: Colors.grey.shade400,
                      // preitem: false,

                      enabled: true,
                      onChangeVal: (value) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Commontextformfeild(
                      controller: emailcontroller,
                      maxLines: 1,
                      minLines: 1,
                      inputAction: TextInputAction.next,
                      hintText: 'Email ID',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: false,
                      typeOfRed: <TextInputFormatter>[
                        // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9@.]')),
                        LengthLimitingTextInputFormatter(50),
                      ],
                      isErrorText: false,
                      isErrorTextString: 'Please enter Email ID',
                      keyboardPopType: TextInputType.emailAddress,
                      icontap: () {},
                      isicon: false,
                      passwordicon: Icons.visibility,
                      iconspic: Icons.email_outlined,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email ID';
                        } else if (!RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(value)) {
                          return 'Please Enter Your Valid Email';
                        } else {
                          return null;
                        }
                      },
                      labelname: 'Email ID',
                      suffexiconcolor: Colors.grey.shade400,
                      // preitem: false,

                      enabled: true,
                      onChangeVal: (value) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Commontextformfeild(
                      controller: passwordcontroller,
                      maxLines: 1,
                      minLines: 1,
                      hintText: 'Enter Password',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: isshow.value,
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
                        isshow.value = !isshow.value;
                      },
                      isicon: true,
                      passwordicon: isshow.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      iconspic: Icons.lock_outline,
                      validation: (value) {
                        if (value == null || value.isEmpty) {

                          return 'Please Enter Password';
                        } else {
                          password.value=value;
                          return null;
                        }
                      },
                      labelname: 'Password',
                      suffexiconcolor: hintcolor,
                      enabled: true,
                      onChangeVal: (value) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Commontextformfeild(
                      controller: confirmpasswordcontroller,
                      maxLines: 1,
                      minLines: 1,
                      hintText: 'Confirm Password',
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
                      isErrorTextString: 'Please enter Confirm Password',
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
                          return 'Please Enter Confirm Password';
                        }else if(password.value!=value){
                          return 'Password & Confirm Password not matched';
                        } else {
                          return null;
                        }
                      },
                      labelname: ' Confirm Password',
                      suffexiconcolor: hintcolor,
                      enabled: true,
                      onChangeVal: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Obx(() {
                    return Checkbox(
                      side: const BorderSide(color: textfeildborder),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      activeColor: appThemecolor,
                      visualDensity:
                          const VisualDensity(vertical: -4, horizontal: -3),
                      value: isChecked.value,
                      onChanged: (value) {
                        isChecked.value = value!;
                      },
                    );
                  }),
                  RichText(
                    text: TextSpan(
                      text: 'I accept all the ',
                      style: const TextStyle(
                        color: normalblack,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'terms and Conditions',
                          style: const TextStyle(
                            color: appThemecolor, // Change link color as needed
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RoutesName.termConditionScreen);
                            },
                        ),
                      ],
                    ),
                  )

                ],
              ),
              const SizedBox(
                height: 15,
              ),

              _registerController.buttonLoader.value?
              PlatformButton(
                onPressed: () {},
                buttonText: '',
                loadingButton: true,
                borderRadius: 5,
                height: 50,
                minWidth: double.infinity,
              ):PlatformButton(
                buttonText: 'Continue ',
                onPressed: () async {
                  if (profilecreatekey.currentState!.validate()) {
                    if(isChecked.value){
                      if(_image!=null){
                        _registerController.registerApi(
                            name: fullnamecontroller.text,
                            mobileNo: mobilecontroller.text,
                            email: emailcontroller.text,
                            password: passwordcontroller.text,
                            cPassword: passwordcontroller.text,
                            profilePic:  await dio.MultipartFile.fromFile(
                              _image!.path,
                              filename: _image!.path.split('/').last,
                            ) // Provide an empty MultipartFile if _image is null
                        );

                      }else{
                        Get.snackbar('Profile Pic', 'Please upload profile picture');
                      }

                    }else{
                      Get.snackbar('Checkbox', 'Please Accept Term & cCondition.');
                    }

                  }
                },
                borderRadius: 5,
                height: 50,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                minWidth: double.infinity,),
              const SizedBox(
                height: 15,
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


}
