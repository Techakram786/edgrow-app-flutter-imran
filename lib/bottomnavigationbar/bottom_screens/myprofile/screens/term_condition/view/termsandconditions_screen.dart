import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../view_model/term_condition_controller.dart';

class TermsandConditionsScreen extends StatelessWidget {
   TermsandConditionsScreen({super.key});
  final TermConditionController _controller = Get.put(TermConditionController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Loader.screenLoader(
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
            title: const LatoCommonTextWidget(
              title: 'Terms and Conditions',
              textColor: normalblack,
              textSize: 16,
              textweight: FontWeight.w600,
            ),
            titleSpacing: -3,
          ),
          body: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children:  [
              HtmlWidget(
                textStyle: const TextStyle(
                    fontSize: 12),
                _controller.cmsModel?.description ?? '',
              )
            ],
          ),
        ),
      ),
    );
  }
}
