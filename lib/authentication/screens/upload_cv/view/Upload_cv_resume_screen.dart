import 'package:edgrow_app/authentication/screens/upload_cv/view_model/upload_cv_controller.dart';
import 'package:edgrow_app/commons/local_storage/SecureStorage.dart';
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../../../bottomnavigationbar/bottom_screens/home/widgets/resume_select_widget.dart';
import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../../../../widget/button.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../widget/loader/loader.dart';

class UploadCvResumeScreen extends StatefulWidget {
  const UploadCvResumeScreen({super.key});

  @override
  State<UploadCvResumeScreen> createState() => _UploadCvResumeScreenState();
}

class _UploadCvResumeScreenState extends State<UploadCvResumeScreen> {
  final UploadCvController controller = Get.put(UploadCvController());
  TextEditingController cvresumecontroller = TextEditingController();
  RxInt radioindex = 50.obs;
  RxString resumeId = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Loader.screenLoader(
            loading: controller.screenLoader.value,
           myWidget: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                const LatoCommonTextWidget(
                    title: 'Upload CV/Resume',
                    textColor: normalblack,
                    textSize: 20,
                    textweight: FontWeight.w700),
                const SizedBox(
                  height: 16,
                ),
                Commontextformfeild(
                  controller: cvresumecontroller,
                  maxLines: 1,
                  minLines: 1,
                  hintText: 'Resume/CV Title*',
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
                  isErrorTextString: 'please enter Resume/CV Title',
                  keyboardPopType: TextInputType.text,
                  icontap: () {},
                  isicon: false,
                  passwordicon: Icons.visibility,
                  iconspic: Icons.email_outlined,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please Enter Resume/CV Title';
                    } else {
                      return null;
                    }
                  },
                  labelname: 'Resume/CV Title *',
                  suffexiconcolor: Colors.grey.shade400,
                  // preitem: false,

                  enabled: true,
                  onChangeVal: (value) {},
                ),
                const SizedBox(
                  height: 16,
                ),
             //pdf uploader
                GestureDetector(
                  onTap: () => controller.pickAndUploadPdf(),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: RDottedLineBorder.all(
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/pdf_uploadf.svg'),
                        const SizedBox(
                          width: 5,
                        ),
                        const LatoCenterCommonTextWidget(
                            title: 'Upload Your File',
                            textColor: normalblack,
                            textSize: 15,
                            textweight: FontWeight.w500),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                        if (controller.selectedPdf.value != null) {
                          return Column(
                            children: [
                              Text(
                                  'Selected PDF: ${controller.selectedPdf.value!.files.single.name}'
                              ),
                            ],
                          );
                        } else {
                          return const Text('No PDF selected');
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const LatoCommonTextWidget(
                    title: 'The File Should be in PDF Format Less than 2MB',
                    textColor: Color(0xFF3A3A3A),
                    textSize: 12,
                    textweight: FontWeight.w600),
                const LatoCommonTextWidget(
                    title: 'Your Resume/CV List',
                    textColor: normalblack,
                    textSize: 12,
                    textweight: FontWeight.w700),
                const SizedBox(
                  height: 10,
                ),

                   ListView.separated(
                    itemCount: controller.resumeList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemBuilder: (_, i) {
                      return Obx(
                            () => ResumeSelectWidget(
                          resumename: '${controller.resumeList[i].title}',
                          resumecolor: radioindex.value == i
                              ? appThemecolor
                              : normalblack,
                          radiobgcolor: radioindex.value == i
                              ? appThemecolor
                              : whitecolor,
                          radiotap: () {
                            radioindex.value = i;
                            resumeId.value = controller
                                .resumeList[i].id
                                .toString();
                          },
                          deletetap: () {
                            if(resumeId.isNotEmpty){
                              radioindex.value = i;
                              resumeId.value = controller
                                  .resumeList[i].id
                                  .toString();
                              controller.deleteResumeApi(resumeId:  resumeId.value);
                            }else{
                              Get.snackbar(
                                  'Cv', 'Please select resume',
                                  backgroundColor: textfeildborder);
                            }

                          },
                        ),
                      );
                    },
                    separatorBuilder:
                        (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),

              ]),
         ),
      ),
      bottomNavigationBar: Obx(()=>
         Container(
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          height: 90,
          color: const Color(0xFFFFFFFF),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.pickAndUploadPdf(),
                      child: const LatoCommonTextWidget(
                          title: '+ Add another Resume',
                          textColor: normalblack,
                          textSize: 12,
                          textweight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              controller.buttonLoader.value?
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

                  if(controller.selectedPdf.value!=null){
                    if(cvresumecontroller.text.isNotEmpty){
                      dio.MultipartFile? doc;
                      try{
                        doc=await dio.MultipartFile.fromFile(
                          '${controller.selectedPdf.value!.files.single.path}',
                          filename: controller.selectedPdf.value!.files.first.name,
                        );
                        controller.uploadCvApi(
                          title: cvresumecontroller.text,
                          file: doc,
                          context: context,
                          // Provide an empty MultipartFile if _image is null
                        );
                      }catch (e){
                        print('Error creating MultipartFile: $e');
                      }
                    }else{
                      Get.snackbar('Upload Cv', 'Please enter title', backgroundColor: textfeildborder);
                    }



                  }else{
                    Get.snackbar('Profile Pic', 'Please upload cv file', backgroundColor: textfeildborder);
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

// sucessfull() => Get.bottomSheet(
//       Container(
//           height: 150,
//           color: Colors.greenAccent,
//           child: Column(
//             children: [
//               Text('Hii 1', textScaleFactor: 2),
//               Text('Hii 2', textScaleFactor: 2),
//               Text('Hii 3', textScaleFactor: 2),
//               Text('Hii 4', textScaleFactor: 2),
//             ],
//           )),
//       barrierColor: Colors.red[50],
//       isDismissible: false,
//     );
Future completeAccount(BuildContext context) {
  return showModalBottomSheet(
      // clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(17))),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (BuildContext context, StateSetter myState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/account_created.svg',
                            ),
                            const LatoCenterCommonTextWidget(
                                title: 'Account Created Sucessfully!',
                                maxLine: 2,
                                textColor: normalblack,
                                textSize: 24,
                                textweight: FontWeight.w600),
                            const SizedBox(
                              height: 10,
                            ),
                            const MulishCenterCommonTextWidget(
                                title:
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has ',
                                textColor: sucesfultext,
                                textSize: 14,
                                textweight: FontWeight.w500),
                            const SizedBox(
                              height: 16,
                            ),
                            Commonbutton(
                                button: 'Ready for Job Search',
                                ontapped: () {
                                  SecureStorage.deleteAll();
                                  Get.offAllNamed(RoutesName.loginScreen);
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
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }));
}
