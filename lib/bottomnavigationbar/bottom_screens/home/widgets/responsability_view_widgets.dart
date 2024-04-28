import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class ResponsibilitesWidget extends StatelessWidget {
  final String rolestext;
  const ResponsibilitesWidget({super.key, required this.rolestext});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Icon(
            Icons.circle,
            size: 8,
            color: Color(0xFF586688),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: LatoCommonTextWidget(
              title: rolestext,
              textColor: responsetextclr,
              textSize: 11,
              maxLine: 20,
              textweight: FontWeight.w400),
        ),
      ],
    );
  }
}
