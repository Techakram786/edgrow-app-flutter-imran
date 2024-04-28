import 'package:edgrow_app/commons/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatelessWidget {
  final String title, leadingImage;
  final VoidCallback onTapFun;
  final double imageHeight, imageWidth;
  const ProfileWidget(
      {Key? key,
      required this.title,
      required this.onTapFun,
      required this.leadingImage,
      required this.imageHeight,
      required this.imageWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      // color: Colors.grey.shade800,
      child: Transform.translate(
        offset: const Offset(0.0, 0),
        child: ListTile(
          onTap: onTapFun,
          hoverColor: const Color(0xFFFFFFFF),
          // hoverColor: Colors.grey.shade800,
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              leadingImage,
              height: imageHeight,
              width: imageWidth,
            ),
          ),
          minLeadingWidth: 5,
          horizontalTitleGap: 14,
          // tileColor: Colors.white,
          title: Text(title,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: normalblack,
                      fontSize: 13,
                      fontWeight: FontWeight.w400))),
          trailing: const Icon(
            Icons.arrow_forward_ios_sharp,
            color: normalblack,
            size: 16,
          ),
        ),
      ),
    );
  }
}
