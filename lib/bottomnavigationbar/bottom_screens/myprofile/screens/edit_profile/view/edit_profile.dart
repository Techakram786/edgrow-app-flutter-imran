

import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../authentication/controllers/dynamic_controllers.dart';

import '../../../../../../authentication/screens/current_position/model/CurrentPositionModel.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../widget/button.dart';
import '../model/city_model.dart';
import '../model/state_model.dart';
import '../view_model/edit_profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  String? genderselection;
  final List<String> genderoptions = [
    'Gender',
    'Male',
    'Female',
    'Others',
  ];
  StateModel? stateselection;
  CurrentPositionMode? currentPositionSelection;

  CityModel? cityselection;
  final textFieldController = Get.put(TextFieldControllerLogic());
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  
  final GlobalKey<FormState> contactkey = GlobalKey<FormState>();

  String? fromDate;
  final EditProfileController _controller = Get.put(EditProfileController());
  int? start;

  @override
  void initState() {
    super.initState();
    nameController.text=_controller.edgrowProfileModel!.value.fullName!;
    mobileController.text=_controller.edgrowProfileModel!.value.mobileNumber!;
    emailController.text=_controller.edgrowProfileModel!.value.email!;
    genderselection=_controller.edgrowProfileModel!.value.gender!;
    List<String>? defaultList=_controller.edgrowProfileModel!.value.portfolio;
      if(defaultList!.isNotEmpty){
        textFieldController.remvoeText(0);
        for (var data in defaultList) {

          textFieldController.textControllers.add(TextEditingController(text: data));
        }
      }
   
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Obx(
        () => Loader.screenLoader(
          loading: _controller.screenLoader.value,
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
                        title: 'Edit Profile',
                        textSize: 20,
                        textColor: normalblack,
                        textweight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Commontextformfeild(
                        controller: nameController,
                        maxLines: 1,
                        minLines: 1,
                        hintText: 'Full name',
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
                        isErrorTextString: 'please enter full name',
                        keyboardPopType: TextInputType.emailAddress,
                        icontap: () {},
                        isicon: false,
                        passwordicon: Icons.visibility,
                        iconspic: Icons.email_outlined,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please Enter name';
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
                      DropdownButtonFormField(
                        isExpanded: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        value: currentPositionSelection ?? _controller.defaultPosition,
                        items: _controller.currentPositionData.map((option) {
                          return DropdownMenuItem(
                            value: option,
                            child: LatoCommonTextWidget(
                              title: '${option.currentPositionName}',
                              textColor: normalblack,
                              textSize: 12,
                              textweight: FontWeight.w500,
                            ),
                          );
                        }).toList(),
                        onChanged: (CurrentPositionMode? currentPosition) { // Specify the correct type here
                          if (currentPosition != null) {
                            setState(() {
                              currentPositionSelection = currentPosition;


                            });
                          }
                        },
                        validator: (value) {
                          if (value == null  ) {
                            return 'Please choose Current Postion';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Current Position',
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
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Commontextformfeild(
                        controller: mobileController,
                        maxLines: 1,
                        minLines: 1,
                        hintText: 'Mobile no',
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
                          if (value == null || value.isEmpty) {
                            return 'please Enter mobile no';
                          } else {
                            return null;
                          }
                        },
                        labelname: 'Mobile no',
                        suffexiconcolor: Colors.grey.shade400,
                        // preitem: false,

                        enabled: false,
                        onChangeVal: (value) {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Commontextformfeild(
                        controller: emailController,
                        maxLines: 1,
                        minLines: 1,
                        hintText: 'Email',
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
                        isErrorTextString: 'please enter email',
                        keyboardPopType: TextInputType.emailAddress,
                        icontap: () {},
                        isicon: false,
                        passwordicon: Icons.visibility,
                        iconspic: Icons.email_outlined,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please Enter name';
                          } else {
                            return null;
                          }
                        },
                        labelname: 'Email',
                        suffexiconcolor: Colors.grey.shade400,
                        // preitem: false,

                        enabled: true,
                        onChangeVal: (value) {},
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
                          if (value == null || value.isEmpty ) {
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
                        value: stateselection ?? _controller.defaultState,
                        items: _controller.stateData.map((option) {
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
                              _controller.defaultState=StateModel();
                              _controller.changeType.value='onchange';
                              _controller.getCity(stateId: stateId, );
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
                        value: _controller.changeType.value=='init'?_controller.defaultCity:cityselection ,
                        items: _controller.cityData.map((option) {
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
              child: _controller.buttonLoader.value?
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

                    List<String> portofolioList = textFieldController.textControllers.map((controller) => controller.text).toList();

                    _controller.updateProfile( gender: genderselection!, countryId: '101',
                        stateId: stateselection?.id.toString() ?? _controller.defaultState!.id.toString(), cityId: cityselection?.id.toString() ?? _controller.defaultCity!.id.toString(),
                         portfoli:portofolioList, fullName: nameController.text, mobileNo: mobileController.text, email: emailController.text, currentPositionId: currentPositionSelection?.id.toString()?? _controller.defaultPosition!.id.toString());
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
