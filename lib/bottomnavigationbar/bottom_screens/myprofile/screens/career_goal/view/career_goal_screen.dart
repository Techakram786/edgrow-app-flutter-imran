import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../widget/button.dart';
import '../view_model/carrer_controller.dart';

class CareerGoalScreen extends StatefulWidget {
  const CareerGoalScreen({super.key});

  @override
  State<CareerGoalScreen> createState() => _CareerGoalScreenState();
}

class _CareerGoalScreenState extends State<CareerGoalScreen> {
  final CareerController _controller = Get.put(CareerController());

  TextEditingController careerController = TextEditingController();


  @override
  void initState() {
    super.initState();
    careerController.text=  Get.arguments['career_brief'];
  }

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
      ),
      body:
         ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          physics: const BouncingScrollPhysics(),
          children: [
            const LatoCommonTextWidget(
                title: 'Career Goal',
                textColor: normalblack,
                textSize: 20,
                textweight: FontWeight.w700),
            const SizedBox(
              height: 16,
            ),
            Commontextformfeild(
              controller: careerController,
              maxLines: 7,
              minLines: 5,
              hintText: 'Write a Brief on your Career Goal',
              isPassword: false,
              isSuffixPressed: () {},
              isObscureText: false,
              typeOfRed: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(150),
              ],
              isErrorText: false,
              isErrorTextString: 'please enter Career Goal',
              keyboardPopType: TextInputType.text,
              icontap: () {},
              isicon: false,
              passwordicon: Icons.visibility,
              iconspic: Icons.email_outlined,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return 'please Enter Career Goal';
                } else {
                  return null;
                }
              },
              labelname: 'Career Goal',
              suffexiconcolor: Colors.grey.shade400,
              // preitem: false,

              enabled: true,
              onChangeVal: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),

      bottomNavigationBar: Obx(()=>
         Container(
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
              buttonText: 'Submit',
              onPressed: () async {
                if (careerController.text.isNotEmpty){
                  _controller.updateProfile(carrerBrief: careerController.text);
                }else{
                  Get.snackbar(
                      'Update Profile', '',
                      backgroundColor: textfeildborder);
                }
              },
              borderRadius: 5,
              height: 50,
              fontSize: 18,

              fontWeight: FontWeight.w500,
              minWidth: double.infinity,)
        ),
      ),
    );
  }
}
