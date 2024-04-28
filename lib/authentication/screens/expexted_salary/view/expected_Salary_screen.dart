
import 'package:edgrow_app/authentication/screens/expexted_salary/view_model/expected_sal_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../../../../widget/button.dart';


class ExpectedSalaryScreen extends StatelessWidget {
   ExpectedSalaryScreen({super.key});
   final ExpectedSalController _expectedSalController = Get.put(ExpectedSalController());

  @override
  Widget build(BuildContext context) {
    var startValue = 4.0.obs;
    // Initial start value
    var endValue = 50.0.obs;
    // Initial end value
    return Scaffold(
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
         ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            const LatoCommonTextWidget(
                title: 'Expected Salary',
                textColor: normalblack,
                textSize: 20,
                textweight: FontWeight.w700),
            const SizedBox(
              height: 16,
            ),
        //textslider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // "$_startValue""L",
                  '${startValue.value.toStringAsFixed(2)}L',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: normalblack),
                ),
                Text(
                  // "$_endValue""L",
                  '${endValue.value.toStringAsFixed(2)}L',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: normalblack),
                )
              ],
            ),
            //slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8.0, // Adjust the height of the background line
                trackShape: CustomTrackShape(),
              ),
              child: RangeSlider(
                min: 1.0, // Minimum value
                max:70.0, // Maximum value
                activeColor: appThemecolor,
                values: RangeValues(startValue.value, endValue.value),
                onChanged: (RangeValues values) {
                  startValue.value = values.start;
                  endValue.value = values.end;
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Obx(()=>
         Container(

          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          decoration: const BoxDecoration(color: whitecolor),
          child:
              _expectedSalController.buttonLoader.value?
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
                  _expectedSalController.setUpdateSalaryapi(startSalary:  startValue.value.toStringAsFixed(2), endSalary: endValue.value.toStringAsFixed(2), context: context);
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

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx + 4.0; // Adjust the left offset
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;

    // Adjust the width of the background line (track)
    final double trackWidth = parentBox.size.width - 8.0;

    return Rect.fromPoints(
      Offset(trackLeft, trackTop),
      Offset(trackLeft + trackWidth, trackTop + trackHeight),
    );
  }
}
