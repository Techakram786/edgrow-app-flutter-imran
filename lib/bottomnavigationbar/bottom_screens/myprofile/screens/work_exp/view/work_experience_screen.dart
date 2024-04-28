

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../widget/button.dart';
import '../view_model/work_exp_controller.dart';

class WorkExperienceScreen extends StatefulWidget {
  const WorkExperienceScreen({super.key});

  @override
  State<WorkExperienceScreen> createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  String? universeselection;
  final WorkExpController _workExpController =
  Get.put(WorkExpController());
  final GlobalKey<FormState> workExpKey = GlobalKey<FormState>();
  int currentYear = DateTime.now().year;
  final List<String> universeoptions = [
    'University Name',
    'Andhra University',
    'JNTU Kakinada',
    'Geetam University',
  ];

  RxList<String> eduList = RxList<String>.of(['Initial Item']);

  String? fromDate;

  int? start;
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
                      key: workExpKey,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: LatoCommonTextWidget(
                                title: 'Work Experience',
                                textColor: normalblack,
                                textSize: 20,
                                textweight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height/1.5,
                            child: ListView.separated(
                              itemCount: eduList.length,

                              itemBuilder: (context, index) {
                                return itemWorkExp(index);
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
                              if (workExpKey.currentState!.validate()){
                                _workExpController.addWorkExpDtlApi(title: _workExpController.jobTitleController[_workExpController.myIndex.value].text,
                                    companyName: _workExpController.companyNameController[_workExpController.myIndex.value].text, salary: _workExpController.salaryController[_workExpController.myIndex.value].text, level: _workExpController.levelController[_workExpController.myIndex.value].text,
                                     startYear: _workExpController.startYearController[_workExpController.myIndex.value].text,
                                    endYear: _workExpController.endYearController[_workExpController.myIndex.value].text, currentlyWork: _workExpController.isChecked[_workExpController.myIndex.value].value?'1':'0', context: context, callType: 'AddScreen');
                                eduList.add('');
                              }
                            },
                            child: const Row(
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
                                    title: 'Add another Work Experience',
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

                    _workExpController.buttonLoader.value?
                    PlatformButton(
                      onPressed: () {},
                      buttonText: '',
                      loadingButton: true,
                      borderRadius: 5,
                      height: 50,
                      minWidth: double.infinity,
                    ):PlatformButton(
                      buttonText: _workExpController.screenType=='edit'?'Update':'Submit',
                      onPressed: () async {
                        if (workExpKey.currentState!.validate()) {

                          if(_workExpController.screenType=='edit'){
                            _workExpController.updateWorkExpDtlApi(title: _workExpController.jobTitleController[0].text,
                                companyName: _workExpController.companyNameController[0].text, salary: _workExpController.salaryController[0].text, level: _workExpController.levelController[0].text,
                                startYear: _workExpController.startYearController[0].text, endYear: _workExpController.endYearController[0].text, currentlyWork: _workExpController.isChecked[0].value?'1':'0', workExpId: _workExpController.workExpModel!.id.toString(),);
                          }else{
                            _workExpController.addWorkExpDtlApi(title: _workExpController.jobTitleController[_workExpController.myIndex.value].text,
                                companyName: _workExpController.companyNameController[_workExpController.myIndex.value].text, salary: _workExpController.salaryController[_workExpController.myIndex.value].text, level: _workExpController.levelController[_workExpController.myIndex.value].text,
                               startYear: _workExpController.startYearController[_workExpController.myIndex.value].text,
                                endYear: _workExpController.endYearController[_workExpController.myIndex.value].text, currentlyWork: _workExpController.isChecked[_workExpController.myIndex.value].value?'1':'0', context: context, callType: 'submit');


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
  Widget itemWorkExp(int index){
    _workExpController.myIndex.value=index;
    return Column(
      children: [
        Commontextformfeild(
          controller: _workExpController.jobTitleController[index],
          maxLines: 1,
          minLines: 1,
          hintText: 'Title',
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
          isErrorTextString: 'please enter Title',
          keyboardPopType: TextInputType.emailAddress,
          icontap: () {},
          isicon: false,
          passwordicon: Icons.visibility,
          iconspic: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'please Enter Title';
            } else {
              return null;
            }
          },
          labelname: 'Title',
          suffexiconcolor: Colors.grey.shade400,
          // preitem: false,
          enabled: true,
          onChangeVal: (value) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Commontextformfeild(
          controller: _workExpController.companyNameController[index],
          maxLines: 1,
          minLines: 1,
          hintText: 'Company Name',
          isPassword: false,
          isSuffixPressed: () {},
          isObscureText: false,
          typeOfRed: <TextInputFormatter>[
            // FilteringTextInputFormatter.deny(RegExp("[ ]")),
            FilteringTextInputFormatter.allow(
                RegExp('[a-z,A-Z,0-9,@,.,#, ,]')),
            LengthLimitingTextInputFormatter(50),
          ],
          isErrorText: false,
          isErrorTextString: 'Please enter company name',
          keyboardPopType: TextInputType.emailAddress,
          icontap: () {},
          isicon: false,
          passwordicon: Icons.visibility,
          iconspic: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Company Name';
            } else {
              return null;
            }
          },
          labelname: 'Company Name',
          suffexiconcolor: Colors.grey.shade400,
          // preitem: false,
          enabled: true,
          onChangeVal: (value) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Commontextformfeild(
          controller: _workExpController.salaryController[index],
          maxLines: 1,
          minLines: 1,
          hintText: 'Salary',
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
          isErrorTextString: 'Please enter Salary',
          keyboardPopType: TextInputType.number,
          icontap: () {},
          isicon: false,
          passwordicon: Icons.visibility,
          iconspic: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Salary';
            } else {
              return null;
            }
          },
          labelname: 'Salary',
          suffexiconcolor: Colors.grey.shade400,
          // preitem: false,

          enabled: true,
          onChangeVal: (value) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Commontextformfeild(
          controller: _workExpController.levelController[index],
          maxLines: 1,
          minLines: 1,
          hintText: 'Level',
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
          isErrorTextString: 'please enter Level',
          keyboardPopType: TextInputType.emailAddress,
          icontap: () {},
          isicon: false,
          passwordicon: Icons.visibility,
          iconspic: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'please Enter Level';
            } else {
              return null;
            }
          },
          labelname: 'Level',
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
                    controller: _workExpController.startYearController[index],
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
                        controller: _workExpController.endYearController[index],
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

                          if(_workExpController.isChecked[index].value){
                            return null;
                          }else{
                            if (value == null || value.isEmpty) {
                              return 'Please enter end year';
                            } else {
                              if (value.length < 4 ) {
                                return 'Enter correct end year';
                              }else if (int.parse(_workExpController.startYearController[index].text) > int.parse(value)){
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
                value: _workExpController.isChecked[index].value,
                onChanged: (value) {
                  _workExpController.isChecked[index].value = value!;
                },
              );
            }),
            const LatoCommonTextWidget(
                title: 'Are You Working Right Now',
                textColor: normalblack,
                textSize: 12,
                textweight: FontWeight.w500),
          ],
        ),
      ],
    );
  }

}
