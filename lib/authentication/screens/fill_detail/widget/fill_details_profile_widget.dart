import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../commons/common_colors.dart';

class FillDetailsCard extends StatelessWidget {
  final VoidCallback detailtap;
  final String iconpic, titlename;
  final int? status;
  const FillDetailsCard(
      {super.key,
      required this.detailtap,
      required this.iconpic,
      required this.titlename, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: status==0?detailscardclr:appThemecolor, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListTile(
            onTap: detailtap,
            horizontalTitleGap: 4,
            leading: SvgPicture.asset(iconpic,
            color: status==0?normalblack:whitecolor,),
            title: LatoCommonTextWidget(
              title: titlename,
              textSize: 14,
              textweight: FontWeight.w500,
              textColor: status==0?normalblack:whitecolor,
            ),
            trailing: status==0?SvgPicture.asset('assets/icons/ios_arrow.svg'):SvgPicture.asset('assets/icons/tick.svg')),
      ),
    );
  }
}
