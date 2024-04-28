import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../../../../widget/button.dart';
import '../../../../../../widget/loader/loader.dart';
import '../view_model/second_round_controller.dart';

class SecondRoundScreen extends StatelessWidget {
   SecondRoundScreen({super.key});
   TextEditingController linkController = TextEditingController();
   final SecondRoundController _controller = Get.put(SecondRoundController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
        appBar: AppBar(
          elevation: 0,
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
          title: const LatoCommonTextWidget(
            title: 'Second Round of Interview',
            textColor: normalblack,
            textSize: 16,
            textweight: FontWeight.w600,
          ),

        ),
      body: Obx(()=>
          Loader.screenLoader(
            loading: _controller.screenLoader.value,
           myWidget: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children:  <Widget> [
              const LatoCommonTextWidget(
                  title: 'Topic for Interview',
                  textColor: normalblack,
                  textSize: 12,
                  textweight: FontWeight.w700),
              const SizedBox(height: 10,),
               HtmlWidget(
                textStyle: const TextStyle(
                    fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: hintcolor
                ),
                _controller.secondRoundModel?.secondRoundTopic ?? '',
              ),
              const SizedBox(height: 10,),

              const Divider(
                color: dividerlinecolor,
              ),
              const SizedBox(height: 10,),
              const LatoCommonTextWidget(
                  title: 'Upload YouTube Link',
                  textColor: normalblack,
                  textSize: 12,
                  textweight: FontWeight.w700),
              const SizedBox(height: 10,),

              Commontextformfeild(
                controller: linkController,
                maxLines: 1,
                minLines: 1,
                hintText: '',
                isPassword: false,
                isSuffixPressed: () {},
                isObscureText: false,
                typeOfRed: <TextInputFormatter>[
                  // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                  // FilteringTextInputFormatter.allow(
                  //     RegExp('[a-z,A-Z,0-9,@,.,#,]')),
                  LengthLimitingTextInputFormatter(50),
                ],
                isErrorText: false,
                isErrorTextString:
                'Please Enter Youtube link',
                keyboardPopType: TextInputType.text,
                icontap: () {},
                isicon: false,
                passwordicon: Icons.visibility,
                iconspic: Icons.email_outlined,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Youtube link';
                  } else {
                    return null;
                  }
                },
                labelname: 'https://www.youtube.com/Dqg4Cfrpc8',
                suffexiconcolor: Colors.grey.shade300,
                enabled: true,
                onChangeVal: (value) {},
              ),
              const SizedBox(height: 10,),
               HtmlWidget(
                textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: hintcolor
                ),
                _controller.secondRoundModel?.youtubeVideoInstructions ?? ''
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _controller.buttonLoader.value?
                  PlatformButton(
                    onPressed: () {},
                    buttonText: '',
                    loadingButton: true,
                    borderRadius: 8,
                    height:40,
                    minWidth: 100,
                  ):
                  PlatformButton(
                    onPressed: () {
                      _controller.applySecondRoundApi(youTubeLink: linkController.text);
                    },
                    buttonText: 'Upload',
                    loadingButton: false,
                    borderRadius: 8,
                    height: 40,
                    minWidth: 100,
                  ),
                ],
              ),

            ],

                   ),
         ),
      ),

    );
  }
}
