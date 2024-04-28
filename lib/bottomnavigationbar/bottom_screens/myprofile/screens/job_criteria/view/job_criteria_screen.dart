
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../widget/loader/loader.dart';
import '../view_model/job_criteria_controller.dart';

class JobCriteriaScreen extends StatefulWidget {
  const JobCriteriaScreen({super.key});

  @override
  State<JobCriteriaScreen> createState() => _JobCriteriaScreenState();
}

class _JobCriteriaScreenState extends State<JobCriteriaScreen> {
  final JobCriteriaController _controller = Get.put(JobCriteriaController());

  String? lookingsubjects;
  final List<String> subjectmodels = [
    'Maths,Physcis,Biology',
    'Maths,Social,Biology',
    'Maths,Hindi,Biology',
    'Maths,English,Biology',
  ];

  String? typeofwork;
  final List<String> listtypes = [
    'Full Time, WFH',
    'Part Time, WFH',
    'Full Time, Office',
    'Part Time, Office'
  ];
  String? loaction;
  final List<String> locationlist = [
    'Visakhapatnam',
    'Kakinada',
    'Rajahmundry',
    'Nellore'
  ];
  String? leveltype;
  final List<String> leveltypelist = [
    'Fresher,Internship',
    'Experience',
    'Internship',
    'Fresher'
  ];
  String? expsaltype;
  final List<String> expsallist = [
    '2.5L-3.5L',
    '3.5L-4.5L',
    '5.5L-6.5L',
    '6.5L-7.5L'
  ];
  final GlobalKey<FormState> _jobkey = GlobalKey<FormState>();

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
          title: 'Job Criteria',
          textColor: normalblack,
          textSize: 16,
          textweight: FontWeight.w600,
        ),
        titleSpacing: -3,
      ),
      body: Obx(()=>
          Loader.screenLoader(
            loading: _controller.screenLoader.value,
           myWidget: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 08),
            children: [
              Form(
                key: _jobkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LatoCommonTextWidget(
                        title: 'Job You are looking for',
                        textColor: normalblack,
                        textSize: 14,
                        textweight: FontWeight.w600),
                    const SizedBox(
                      height: 8,
                    ),
                    Commontextformfeild(
                      controller: _controller.controllerLookingFor,
                      maxLines: 5,
                      minLines: 1,
                      hintText: '',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: false,
                      typeOfRed: <TextInputFormatter>[
                        // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9]')),
                        LengthLimitingTextInputFormatter(50),
                      ],
                      isErrorText: false,
                      isErrorTextString: 'please enter mobile no',
                      keyboardPopType: TextInputType.number,
                      icontap: () {},
                      isicon: false,
                      passwordicon: Icons.visibility,
                      iconspic: Icons.email_outlined,
                      validation: (value) {
                        return null;
                      },
                      labelname: '',
                      suffexiconcolor: Colors.grey.shade400,
                      // preitem: false,

                      enabled: false,
                      onChangeVal: (value) {},
                    ),
                    /*DropdownButtonFormField(
                      isExpanded: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      value: lookingsubjects,
                      items: subjectmodels.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: LatoCommonTextWidget(
                            title: option,
                            textColor: normalblack,
                            textSize: 12,
                            textweight: FontWeight.w500,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          lookingsubjects = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Select subject ';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Job Looking for',
                        hintStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: normalblack,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),*/
                    const SizedBox(
                      height: 10,
                    ),
                    const LatoCommonTextWidget(
                        title: 'Type of Work',
                        textColor: normalblack,
                        textSize: 14,
                        textweight: FontWeight.w600),
                    const SizedBox(
                      height: 8,
                    ),
                    Commontextformfeild(
                      controller: _controller.controllerWorkType,
                      maxLines: 5,
                      minLines: 1,
                      hintText: '',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: false,
                      typeOfRed: <TextInputFormatter>[
                        // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9]')),
                        LengthLimitingTextInputFormatter(50),
                      ],
                      isErrorText: false,
                      isErrorTextString: 'please enter mobile no',
                      keyboardPopType: TextInputType.number,
                      icontap: () {},
                      isicon: false,
                      passwordicon: Icons.visibility,
                      iconspic: Icons.email_outlined,
                      validation: (value) {
                        return null;
                      },
                      labelname: '',
                      suffexiconcolor: Colors.grey.shade400,
                      // preitem: false,

                      enabled: false,
                      onChangeVal: (value) {},
                    ),
                   /* DropdownButtonFormField(
                      isExpanded: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      value: typeofwork,
                      items: listtypes.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: LatoCommonTextWidget(
                            title: option,
                            textColor: normalblack,
                            textSize: 12,
                            textweight: FontWeight.w500,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          typeofwork = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Select subject';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Type of Work',
                        hintStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: normalblack,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),*/
                    const SizedBox(
                      height: 10,
                    ),
                    const LatoCommonTextWidget(
                        title: 'Location',
                        textColor: normalblack,
                        textSize: 14,
                        textweight: FontWeight.w600),
                    const SizedBox(
                      height: 8,
                    ),
                    Commontextformfeild(
                      controller: _controller.controllerLocationType,
                      maxLines: 5,
                      minLines: 1,
                      hintText: '',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: false,
                      typeOfRed: <TextInputFormatter>[
                        // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9]')),
                        LengthLimitingTextInputFormatter(50),
                      ],
                      isErrorText: false,
                      isErrorTextString: 'please enter mobile no',
                      keyboardPopType: TextInputType.number,
                      icontap: () {},
                      isicon: false,
                      passwordicon: Icons.visibility,
                      iconspic: Icons.email_outlined,
                      validation: (value) {
                        return null;
                      },
                      labelname: '',
                      suffexiconcolor: Colors.grey.shade400,
                      // preitem: false,

                      enabled: false,
                      onChangeVal: (value) {},
                    ),
                    /*DropdownButtonFormField(
                      isExpanded: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      value: loaction,
                      items: locationlist.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: LatoCommonTextWidget(
                            title: option,
                            textColor: normalblack,
                            textSize: 12,
                            textweight: FontWeight.w500,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          loaction = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Select location ';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'City location',
                        hintStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: normalblack,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),*/
                    const SizedBox(
                      height: 10,
                    ),
                    const LatoCommonTextWidget(
                        title: 'Level',
                        textColor: normalblack,
                        textSize: 14,
                        textweight: FontWeight.w600),
                    const SizedBox(
                      height: 8,
                    ),
                    Commontextformfeild(
                      controller: _controller.controllerLevel,
                      maxLines: 5,
                      minLines: 1,
                      hintText: '',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: false,
                      typeOfRed: <TextInputFormatter>[
                        // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9]')),
                        LengthLimitingTextInputFormatter(50),
                      ],
                      isErrorText: false,
                      isErrorTextString: 'please enter mobile no',
                      keyboardPopType: TextInputType.number,
                      icontap: () {},
                      isicon: false,
                      passwordicon: Icons.visibility,
                      iconspic: Icons.email_outlined,
                      validation: (value) {
                        return null;
                      },
                      labelname: '',
                      suffexiconcolor: Colors.grey.shade400,
                      // preitem: false,

                      enabled: false,
                      onChangeVal: (value) {},
                    ),
                    /*DropdownButtonFormField(
                      isExpanded: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      value: leveltype,
                      items: leveltypelist.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: LatoCommonTextWidget(
                            title: option,
                            textColor: normalblack,
                            textSize: 12,
                            textweight: FontWeight.w500,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          leveltype = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Select Level ';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Level',
                        hintStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: normalblack,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),*/
                    const SizedBox(
                      height: 10,
                    ),
                    const LatoCommonTextWidget(
                        title: 'Expected Salary',
                        textColor: normalblack,
                        textSize: 14,
                        textweight: FontWeight.w600),
                    const SizedBox(
                      height: 8,
                    ),
                    Commontextformfeild(
                      controller: _controller.controllerSalary,
                      maxLines: 5,
                      minLines: 1,
                      hintText: '',
                      isPassword: false,
                      isSuffixPressed: () {},
                      isObscureText: false,
                      typeOfRed: <TextInputFormatter>[
                        // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9]')),
                        LengthLimitingTextInputFormatter(50),
                      ],
                      isErrorText: false,
                      isErrorTextString: 'please enter mobile no',
                      keyboardPopType: TextInputType.number,
                      icontap: () {},
                      isicon: false,
                      passwordicon: Icons.visibility,
                      iconspic: Icons.email_outlined,
                      validation: (value) {
                        return null;
                      },
                      labelname: '',
                      suffexiconcolor: Colors.grey.shade400,
                      // preitem: false,

                      enabled: false,
                      onChangeVal: (value) {},
                    ),
                   /* DropdownButtonFormField(
                      isExpanded: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      value: expsaltype,
                      items: expsallist.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: LatoCommonTextWidget(
                            title: option,
                            textColor: normalblack,
                            textSize: 12,
                            textweight: FontWeight.w500,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          expsaltype = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Select Level ';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Level',
                        hintStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: normalblack,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: textfeildborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
                   ),
         ),
      ),
      /*bottomNavigationBar: Container(
        height: 60,
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            Commonbutton(
                button: 'Submit',
                ontapped: () {
                  if (_jobkey.currentState!.validate()) {
                    Get.snackbar('Job', 'JobCrtieria Update sucessfully',
                        backgroundColor: appThemecolor,
                        colorText: whitecolor,
                        duration: const Duration(seconds: 3));

                    Get.to(() =>  const MyProfileScreen(),
                        transition: Transition.rightToLeft);
                  }
                },
                horizontalpadding: 15,
                verticalPadding: 0,
                bgcolor: appThemecolor,
                borderwidth: 0,
                bordercolor: appThemecolor,
                textclr: whitecolor,
                txtweight: FontWeight.w500),
          ],
        ),
      ),*/
    );
  }
}
