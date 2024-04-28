
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';

import '../../../../widget/button.dart';

import '../view_model/Edu_controller.dart';

class EducationDetailsScreen extends StatefulWidget {
  const EducationDetailsScreen({super.key});

  @override
  State<EducationDetailsScreen> createState() => _EducationDetailsScreenState();
}

class _EducationDetailsScreenState extends State<EducationDetailsScreen> {
  String? universeselection;
  final EducationDtlController _educationDtlController =
  Get.put(EducationDtlController());
  final GlobalKey<FormState> eduKey = GlobalKey<FormState>();
  int currentYear = DateTime.now().year;
  String? fromDate;

  int? start;
  RxList<String> eduList = RxList<String>.of(['Initial Item']);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
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
        ),
        body: Obx(()=>
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(

                children: [
                  Form(
                    key: eduKey,
                    child: Column(
                      children: [
                        const LatoCommonTextWidget(
                            title: 'Education Details',
                            textColor: normalblack,
                            textSize: 20,
                            textweight: FontWeight.w600),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/1.5,
                          child: ListView.separated(
                            itemCount: eduList.length,

                            itemBuilder: (context, index) {
                              return itemEdu(index);
                            }, separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(
                                height: 30,
                              );
                          },
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () {
                            if (eduKey.currentState!.validate()){
                              _educationDtlController.addEduDtlApi(highestQualification: _educationDtlController.highestqualificationcontroller[_educationDtlController.myIndex.value].text,
                                  course: _educationDtlController.coursecontroller[_educationDtlController.myIndex.value].text, courseType: _educationDtlController.coursetypecontroller[_educationDtlController.myIndex.value].text, specialization: _educationDtlController.specialtypecontroller[_educationDtlController.myIndex.value].text,
                                  universityName: _educationDtlController.universitycontroller[_educationDtlController.myIndex.value].text, marks: _educationDtlController.cgpacontroller[_educationDtlController.myIndex.value].text, startYear: _educationDtlController.startYearController[_educationDtlController.myIndex.value].text,
                                  endYear: _educationDtlController.endYearController[_educationDtlController.myIndex.value].text, currentlyStdy: _educationDtlController.isChecked[_educationDtlController.myIndex.value].value?'1':'0', context: context, callType: 'AddScreen');
                              eduList.add('');
                            }
                          },
                          child: const Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.add,
                                color: normalblack,
                                size: 15,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              LatoCommonTextWidget(
                                  title: 'Add another Education',
                                  textColor: normalblack,
                                  textSize: 12,
                                  textweight: FontWeight.w500)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),

                  _educationDtlController.buttonLoader.value?
                  PlatformButton(
                    onPressed: () {},
                    buttonText: '',
                    loadingButton: true,
                    borderRadius: 5,
                    height: 50,
                    minWidth: double.infinity,
                  ):PlatformButton(
                    buttonText: _educationDtlController.screenType=='edit'?'Update':'Submit',
                    onPressed: () async {
                      if (eduKey.currentState!.validate()) {

                        if(_educationDtlController.screenType=='edit'){
                          _educationDtlController.updateEduDtlApi(highestQualification: _educationDtlController.highestqualificationcontroller[0].text,
                              course: _educationDtlController.coursecontroller[0].text, courseType: _educationDtlController.coursetypecontroller[0].text, specialization: _educationDtlController.specialtypecontroller[0].text,
                              universityName: _educationDtlController.universitycontroller[0].text, marks: _educationDtlController.cgpacontroller[0].text, startYear: _educationDtlController.startYearController[0].text,
                              endYear: _educationDtlController.endYearController[0].text, currentlyStdy: _educationDtlController.isChecked[0].value?'1':'0', eduId: _educationDtlController.eduDtlModel!.id.toString());
                        }else{
                          _educationDtlController.addEduDtlApi(highestQualification: _educationDtlController.highestqualificationcontroller[_educationDtlController.myIndex.value].text,
                              course: _educationDtlController.coursecontroller[_educationDtlController.myIndex.value].text, courseType: _educationDtlController.coursetypecontroller[_educationDtlController.myIndex.value].text, specialization: _educationDtlController.specialtypecontroller[_educationDtlController.myIndex.value].text,
                              universityName: _educationDtlController.universitycontroller[_educationDtlController.myIndex.value].text, marks: _educationDtlController.cgpacontroller[_educationDtlController.myIndex.value].text, startYear: _educationDtlController.startYearController[_educationDtlController.myIndex.value].text,
                              endYear: _educationDtlController.endYearController[_educationDtlController.myIndex.value].text, currentlyStdy: _educationDtlController.isChecked[_educationDtlController.myIndex.value].value?'1':'0', context: context, callType: 'submit');

                          /*_educationDtlController.addEduDtlApi(highestQualification: _educationDtlController.highestqualificationcontroller[0].text,
                              course: _educationDtlController.coursecontroller[0].text, courseType: _educationDtlController.coursetypecontroller[0].text, specialization: _educationDtlController.specialtypecontroller[0].text,
                              universityName: _educationDtlController.universitycontroller[0].text, marks: _educationDtlController.cgpacontroller[0].text, startYear: _educationDtlController.startYearController[0].text,
                              endYear: _educationDtlController.endYearController[0].text, currentlyStdy: _educationDtlController.isChecked[0].value?'1':'0', context: context);*/
                        }
                      }
                    },
                    borderRadius: 5,
                    height: 50,
                    fontSize: 18,

                    fontWeight: FontWeight.w500,
                    minWidth: double.infinity,),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget itemEdu(int index){
   _educationDtlController.myIndex.value=index;
    return Column(
      children: [
        Commontextformfeild(
          controller: _educationDtlController.highestqualificationcontroller[index],
          maxLines: 1,
          minLines: 1,
          hintText: 'Highest Qualification',
          isPassword: false,
          isSuffixPressed: () {},
          isObscureText: false,
          typeOfRed: <TextInputFormatter>[
            // FilteringTextInputFormatter.deny(RegExp("[ ]")),
            FilteringTextInputFormatter.allow(
                RegExp('[a-z,A-Z,0-9,@,.,#, ]')),
            LengthLimitingTextInputFormatter(50),
          ],
          isErrorText: false,
          isErrorTextString: 'Please enter highest qualification',
          keyboardPopType: TextInputType.emailAddress,
          icontap: () {},
          isicon: false,
          passwordicon: Icons.visibility,
          iconspic: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter highest qualification';
            } else {
              return null;
            }
          },
          labelname: 'Highest Qualification',
          suffexiconcolor: Colors.grey.shade400,
          // preitem: false,
          enabled: true,
          onChangeVal: (value) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Commontextformfeild(
          controller: _educationDtlController.coursecontroller[index],
          maxLines: 1,
          minLines: 1,
          hintText: 'Course',
          isPassword: false,
          isSuffixPressed: () {},
          isObscureText: false,
          typeOfRed: <TextInputFormatter>[
            // FilteringTextInputFormatter.deny(RegExp("[ ]")),
            FilteringTextInputFormatter.allow(
                RegExp('[a-z,A-Z,0-9,@,.,#, ]')),
            LengthLimitingTextInputFormatter(50),
          ],
          isErrorText: false,
          isErrorTextString: 'Please enter Course',
          keyboardPopType: TextInputType.emailAddress,
          icontap: () {},
          isicon: false,
          passwordicon: Icons.visibility,
          iconspic: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Course';
            } else {
              return null;
            }
          },
          labelname: 'Course',
          suffexiconcolor: Colors.grey.shade400,
          // preitem: false,

          enabled: true,
          onChangeVal: (value) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Commontextformfeild(
          controller: _educationDtlController.coursetypecontroller[index],
          maxLines: 1,
          minLines: 1,
          hintText: 'Course Type',
          isPassword: false,
          isSuffixPressed: () {},
          isObscureText: false,
          typeOfRed: <TextInputFormatter>[
            // FilteringTextInputFormatter.deny(RegExp("[ ]")),
            FilteringTextInputFormatter.allow(
                RegExp('[a-z,A-Z,0-9,@,.,#, ]')),
            LengthLimitingTextInputFormatter(50),
          ],
          isErrorText: false,
          isErrorTextString: 'Please enter Course type',
          keyboardPopType: TextInputType.emailAddress,
          icontap: () {},
          isicon: false,
          passwordicon: Icons.visibility,
          iconspic: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Course type';
            } else {
              return null;
            }
          },
          labelname: 'Course Type',
          suffexiconcolor: Colors.grey.shade400,
          // preitem: false,

          enabled: true,
          onChangeVal: (value) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Commontextformfeild(
          controller: _educationDtlController.specialtypecontroller[index],
          maxLines: 1,
          minLines: 1,
          hintText: 'Specialization',
          isPassword: false,
          isSuffixPressed: () {},
          isObscureText: false,
          typeOfRed: <TextInputFormatter>[
            // FilteringTextInputFormatter.deny(RegExp("[ ]")),
            FilteringTextInputFormatter.allow(
                RegExp('[a-z,A-Z,0-9,@,.,#, ]')),
            LengthLimitingTextInputFormatter(50),
          ],
          isErrorText: false,
          isErrorTextString: 'Please enter Specialization',
          keyboardPopType: TextInputType.emailAddress,
          icontap: () {},
          isicon: false,
          passwordicon: Icons.visibility,
          iconspic: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Specialization';
            } else {
              return null;
            }
          },
          labelname: 'Specialization',
          suffexiconcolor: Colors.grey.shade400,
          // preitem: false,

          enabled: true,
          onChangeVal: (value) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Commontextformfeild(
          controller: _educationDtlController.universitycontroller[index],
          maxLines: 1,
          minLines: 1,
          hintText: 'University Name',
          isPassword: false,
          isSuffixPressed: () {},
          isObscureText: false,
          typeOfRed: <TextInputFormatter>[
            // FilteringTextInputFormatter.deny(RegExp("[ ]")),
            FilteringTextInputFormatter.allow(
                RegExp('[a-z,A-Z,0-9,@,.,#, ]')),
            LengthLimitingTextInputFormatter(50),
          ],
          isErrorText: false,
          isErrorTextString: 'Please enter university Name',
          keyboardPopType: TextInputType.text,
          icontap: () {},
          isicon: false,
          passwordicon: Icons.visibility,
          iconspic: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter university Name';
            } else {
              return null;
            }
          },
          labelname: 'University Name',
          suffexiconcolor: Colors.grey.shade400,
          // preitem: false,

          enabled: true,
          onChangeVal: (value) {},
        ),
        const SizedBox(
          height: 15,
        ),
        Commontextformfeild(
          controller: _educationDtlController.cgpacontroller[index],
          maxLines: 1,
          minLines: 1,
          hintText: 'CGPA/Marks',
          isPassword: false,
          isSuffixPressed: () {},
          isObscureText: false,
          typeOfRed: <TextInputFormatter>[
            // FilteringTextInputFormatter.deny(RegExp("[ ]")),
            FilteringTextInputFormatter.allow(
                RegExp('[0-9,.]')),
            LengthLimitingTextInputFormatter(4),
          ],
          isErrorText: false,
          isErrorTextString: 'Please enter CGPA/Marks',
          keyboardPopType: TextInputType.number,
          icontap: () {},
          isicon: false,
          passwordicon: Icons.visibility,
          iconspic: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter CGPA/Marks';
            } else {
              return null;
            }
          },
          labelname: 'CGPA/Marks',
          suffexiconcolor: Colors.grey.shade400,
          // preitem: false,

          enabled: true,
          onChangeVal: (value) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        onBackground: Colors.transparent,
                        primary: appThemecolor,
                      )),
                  child: CommontextformfeildIcons(
                    controller: _educationDtlController.startYearController[index],
                    maxLines: 1,
                    minLines: 1,
                    hintText: 'Start Year',
                    isPassword: false,
                    isSuffixPressed: () {},
                    isObscureText: false,

                    typeOfRed: <TextInputFormatter>[
                      // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                      FilteringTextInputFormatter.allow(
                          RegExp('[0-9]')),
                      LengthLimitingTextInputFormatter(4),
                    ],
                    isErrorText: false,
                    isErrorTextString: 'Please enter start year',
                    keyboardPopType: TextInputType.number,
                    icontap: () {},
                    isicon: true,
                    iconAssetPath: 'assets/icons/calendar_icon.svg',
                    iconspic: Icons.email_outlined,
                    validation: (value) {
                      int? startYear = int.tryParse(value);
                      if (value == null || value.isEmpty) {
                        return 'Please enter start year';
                      } else {

                        if (value.length < 4 || startYear!>currentYear ) {
                          return 'Enter correct start year';
                        }else{
                          return null;
                        }
                      }
                    },
                    labelname: 'Start Year',
                    suffexiconcolor: Colors.grey.shade400,
                    // preitem: false,

                    enabled: true,
                    onChangeVal: (value) {},
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /**safedoor theme wrape theme widget */
                    Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            onBackground: Colors.transparent,
                            primary: appThemecolor,
                          )),
                      child:  CommontextformfeildIcons(
                        controller: _educationDtlController.endYearController[index],
                        maxLines: 1,
                        minLines: 1,
                        hintText: 'End Year',
                        isPassword: false,
                        isSuffixPressed: () {},
                        isObscureText: false,

                        typeOfRed: <TextInputFormatter>[
                          // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9]')),
                          LengthLimitingTextInputFormatter(4),
                        ],
                        isErrorText: false,
                        isErrorTextString: 'Please enter end year',
                        keyboardPopType: TextInputType.number,
                        icontap: () {},
                        isicon: true,
                        iconAssetPath: 'assets/icons/calendar_icon.svg',
                        iconspic: Icons.email_outlined,
                        validation: (value) {

                          if(_educationDtlController.isChecked[index].value){
                            return null;
                          }else{
                            if (value == null || value.isEmpty) {
                              return 'Please enter end year';
                            } else {
                              if (value.length < 4 ) {
                                return 'Enter correct end year';
                              }else if (int.parse(_educationDtlController.startYearController[index].text) > int.parse(value)){
                                return 'Enter correct end year';
                              }else{
                                return null;
                              }

                            }
                          }

                        },
                        labelname: 'End Year',
                        suffexiconcolor: Colors.grey.shade400,
                        // preitem: false,

                        enabled: true,
                        onChangeVal: (value) {},
                      ),
                    ),
                  ],
                )),
          ],
        ),
        const SizedBox(
          height: 16,
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
                value: _educationDtlController.isChecked[index].value,
                onChanged: (value) {
                  _educationDtlController.isChecked[index].value = value!;
                },
              );
            }),
            const LatoCommonTextWidget(
                title: 'Are You Studying Right Now',
                textColor: normalblack,
                textSize: 12,
                textweight: FontWeight.w500),
          ],
        ),
      ],
    );
  }
}
