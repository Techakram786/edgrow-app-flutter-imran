import 'package:edgrow_app/authentication/screens/current_position/view_model/current_position_controller.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:edgrow_app/widget/loader/loader.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../widget/button.dart';
import '../../../../widget/current_postion_widget.dart';





class CurrentPostionScreen extends StatefulWidget {
  const CurrentPostionScreen({super.key});



  @override
  State<CurrentPostionScreen> createState() => _CurrentPostionScreenState();
}

class _CurrentPostionScreenState extends State<CurrentPostionScreen> {
  final CurrentPositionController _cuurentPositionController = Get.put(CurrentPositionController());



  RxInt selectedPostionId = 0.obs;

  @override
  Widget build(BuildContext context) {

    return Obx(()=>
       Loader.screenLoader(
        loading: _cuurentPositionController.screenLoader.value,
         myWidget:Scaffold(
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
           body: Obx((){
             return ListView(
               shrinkWrap: true,
               scrollDirection: Axis.vertical,
               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
               physics: const BouncingScrollPhysics(),
               children: [
                 const LatoCenterCommonTextWidget(
                     title: 'What is your Current Postion Right Now?',
                     textColor: normalblack,
                     textSize: 20,
                     textweight: FontWeight.w700),
                 const SizedBox(
                   height: 20,
                 ),
                 GridView.builder(
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2,
                         mainAxisExtent: 110,
                         mainAxisSpacing: 8,
                         crossAxisSpacing: 8),
                     itemCount: _cuurentPositionController.currentPositionData.length,
                     shrinkWrap: true,
                     scrollDirection: Axis.vertical,
                     physics: const NeverScrollableScrollPhysics(),
                     itemBuilder: (BuildContext context, int index) {
                       return  Obx((){
                         return  CurrentPostionCard(
                           postionname: '${_cuurentPositionController.currentPositionData[index].currentPositionName}',
                           iconcolor: _cuurentPositionController.selectedindex.value == index
                               ? whitecolor
                               : const Color(0xFFF6F6F6),
                           cardbgcolor: _cuurentPositionController.selectedindex.value == index
                               ? appThemecolor
                               : const Color(0xFFF6F6F6),
                           cardtextcolor:
                           _cuurentPositionController.selectedindex.value == index ? whitecolor : normalblack,
                           postiontap: () {
                             selectedPostionId.value=_cuurentPositionController.currentPositionData[index].id!;
                             _cuurentPositionController.selectedindex.value = index;
                           },
                         );
                       }
                       );
                     }),
                 const SizedBox(
                   height: 15,
                 ),
                 _cuurentPositionController.buttonLoader.value?
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
                     if( selectedPostionId.value!=0){
                       _cuurentPositionController.setCurrentPositionData(currentPositionId: selectedPostionId.value.toString());
                     }else{
                       Get.snackbar('Current Position', 'Please choose current position');
                     }
                   },
                   borderRadius: 5,
                   height: 50,
                   fontSize: 18,
                   fontWeight: FontWeight.w500,
                   minWidth: double.infinity,)
               ],
             );
           }

           ),
         )),
    );
  }


}

