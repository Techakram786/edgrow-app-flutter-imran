import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesCertificateScreen extends StatefulWidget {
  const CoursesCertificateScreen({super.key});

  @override
  State<CoursesCertificateScreen> createState() =>
      _CoursesCertificateScreenState();
}

class _CoursesCertificateScreenState extends State<CoursesCertificateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                SvgPicture.asset('assets/icons/certificate_vector.svg'),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 280,
                  child: LatoCenterCommonTextWidget(
                      title: 'You have Completed the Course Successfully!',
                      textColor: normalblack,
                      textSize: 18,
                      textweight: FontWeight.w700),
                ),
                const LatoCenterCommonTextWidget(
                    title:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has ',
                    textColor: Color(0xFF5B5B5B),
                    textSize: 10,
                    textweight: FontWeight.w300),
                const SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(width: 0, color: appThemecolor)),
                        backgroundColor: appThemecolor,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/pdflogo.svg'),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Download Certificate',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: whitecolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
