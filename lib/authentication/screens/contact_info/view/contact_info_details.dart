// ignore_for_file: deprecated_member_use

import 'package:date_time_picker/date_time_picker.dart';
import 'package:edgrow_app/authentication/screens/contact_info/model/CityModel.dart';
import 'package:edgrow_app/authentication/screens/contact_info/view_model/contact_info_controller.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../commons/common_colors.dart';
import '../../../../widget/button.dart';
import '../../../controllers/dynamic_controllers.dart';
import '../model/StateModel.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  final textFieldController = Get.put(TextFieldControllerLogic());
  String? genderselection;
  final List<String> genderoptions = [
    'Gender',
    'Male',
    'Female',
    'Others',
  ];
  StateModel? stateselection;

  CityModel? cityselection;


  TextEditingController datecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();

  final GlobalKey<FormState> contactkey = GlobalKey<FormState>();

  String? fromDate;
  final ContactInfoController _contactInfoController =
      Get.put(ContactInfoController());
  int? start;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Obx(
        () => Loader.screenLoader(
          loading: _contactInfoController.screenLoader.value,
          myWidget: Scaffold(
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
            body: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              children: [
                Form(
                  key: contactkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LatoCommonTextWidget(
                        title: 'Contact Info',
                        textSize: 20,
                        textColor: normalblack,
                        textweight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                          onBackground: Colors.transparent,
                          primary: appThemecolor,
                        )),
                        child: DateTimePicker(
                          textInputAction: TextInputAction.next,
                          controller: datecontroller,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            fillColor: whitecolor,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: textfeildborder),
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'DOB',
                            hintStyle: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            suffixIcon: const Icon(
                              Icons.calendar_month_rounded,
                              size: 20,
                              color: appThemecolor,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          type: DateTimePickerType.date,
                          dateMask: 'dd-MM-yyyy',
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now().subtract(const Duration(days: 18 * 365)),
                            initialDate:DateTime.now().subtract(const Duration(days: 18 * 365)),
                          selectableDayPredicate: (date) {
                            return true;
                          },
                          onChanged: (val) {
                            setState(() {
                              // selectedToDate = val;
                              fromDate = val;
                              start = 1;
                            });
                          },
                            validator: (value) {
                              if (value == null || value.isEmpty || value=='date') {
                                return 'Please choose date';
                              } else {
                                return null;
                              }
                            },
                          onSaved: (val) => print(val),

                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField(
                        isExpanded: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        value: genderselection,
                        items: genderoptions.map((option) {
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
                            genderselection = newValue.toString();
                          });
                        },
                          validator: (value) {
                            if (value == null || value.isEmpty || value == 'Gender' ) {
                              return 'Please choose Gender';
                            } else {
                              return null;
                            }
                          },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Gender',
                          hintStyle: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: normalblack,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: textfeildborder),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: textfeildborder),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: textfeildborder),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: textfeildborder),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField<StateModel>(
                        isExpanded: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        value: stateselection,
                        items: _contactInfoController.stateData.map((option) {
                          return DropdownMenuItem(
                            value: option,
                            child: LatoCommonTextWidget(
                              title: '${option.name}',
                              textColor: normalblack,
                              textSize: 12,
                              textweight: FontWeight.w500,
                            ),
                          );
                        }).toList(),
                        onChanged: (StateModel? selectedState) { // Specify the correct type here
                          if (selectedState != null) {
                            setState(() {
                              stateselection = selectedState;
                              String stateId = selectedState.id.toString();
                              _contactInfoController.getCity(stateId: stateId);
                            });
                          }
                        },
                          validator: (value) {
                            if (value == null  ) {
                              return 'Please choose State';
                            } else {
                              return null;
                            }
                          },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'State',
                          hintStyle: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              color: normalblack,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: textfeildborder),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(width: 1, color: textfeildborder),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(width: 1, color: textfeildborder),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: textfeildborder),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      )
                      ,
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField<CityModel>(
                        isExpanded: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        value: cityselection,
                        items: _contactInfoController.cityData.map((option) {
                          return DropdownMenuItem(
                            value: option,
                            child: LatoCommonTextWidget(
                              title: '${option.name}',
                              textColor: normalblack,
                              textSize: 12,
                              textweight: FontWeight.w500,
                            ),
                          );
                        }).toList(),
                        onChanged: (CityModel? selectedCity) {
                          setState(() {
                            cityselection = selectedCity;
                          });
                        },
                        validator: (value) {
                          if (value == null  ) {
                            return 'Please choose City';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'City',
                          hintStyle: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: normalblack,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: textfeildborder),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: textfeildborder),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: textfeildborder),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: textfeildborder),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Commontextformfeild(
                        controller: addresscontroller,
                        maxLines: 1,
                        minLines: 1,
                        hintText: 'Address',
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
                        isErrorTextString: 'please enter address',
                        keyboardPopType: TextInputType.emailAddress,
                        icontap: () {},
                        isicon: false,
                        passwordicon: Icons.visibility,
                        iconspic: Icons.email_outlined,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please Enter address';
                          } else {
                            return null;
                          }
                        },
                        labelname: 'Address',
                        suffexiconcolor: Colors.grey.shade400,
                        // preitem: false,

                        enabled: true,
                        onChangeVal: (value) {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ////+++++++++++++++++++++++++++++++++++++++////
                      GetX<TextFieldControllerLogic>(
                        builder: (getxlogic) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Commontextformfeild(
                                      controller:
                                          getxlogic.textControllers[index],
                                      maxLines: 1,
                                      minLines: 1,
                                      hintText: 'Portfolio Website',
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
                                      isErrorTextString: 'please enter website',
                                      keyboardPopType: TextInputType.text,
                                      icontap: () {},
                                      isicon: false,
                                      passwordicon: Icons.visibility,
                                      iconspic: Icons.email_outlined,
                                      validation: (value) {
                                        return null;
                                      },
                                      labelname: 'Portofolio Website',
                                      suffexiconcolor: Colors.grey.shade400,
                                      // preitem: false,

                                      enabled: true,
                                      onChangeVal: (value) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (index == 0) {
                                        getxlogic.addTextField();
                                      } else {
                                        getxlogic.remvoeText(index);
                                      }
                                    },
                                    child: Icon(
                                      index == 0
                                          ? Icons.add_circle_outline_rounded
                                          : Icons.delete,
                                      size: 25,
                                      color: appThemecolor,
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: getxlogic.textControllers.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                          );
                        },
                      )
                      ////+++++++++++++++++++++++++++++++++++++++////
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: 50,
              color: whitecolor,
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: _contactInfoController.buttonLoader.value?
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
                  if (contactkey.currentState!.validate()) {

                    List<String> portofolioList = textFieldController.textControllers
                        .map((controller) => controller.text)
                        .where((text) => text.isNotEmpty)
                        .toList();
                    print('proo${portofolioList.length}');
                    _contactInfoController.updateContact(dob: datecontroller.text, gender: genderselection!, countryId:  _contactInfoController.countryData[0].id.toString(),
                        stateId: stateselection!.id.toString(), cityId: cityselection!.id.toString(),
                        address: addresscontroller.text, portfoli:portofolioList, context: context);
                  }
                },
                borderRadius: 5,
                height: 50,
                fontSize: 18,

                fontWeight: FontWeight.w500,
                minWidth: double.infinity,)
            ),
          ),
        ),
      ),
    );
  }
}
