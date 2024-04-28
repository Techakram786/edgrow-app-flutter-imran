// ignore_for_file: deprecated_member_use


import 'package:edgrow_app/commons/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../authentication/screens/choose_login_screen.dart';
import '../../widget/flutter_toast.dart';
import '../bottom_screens/courses/screens/course_screen.dart';
import '../bottom_screens/home/screens/homescreen.dart';
import '../bottom_screens/myjobs/screens/myjobs_screen.dart';
import '../bottom_screens/myprofile/screens/my_profile/view/myprofile_screen.dart';
import '../bottom_screens/shortlisted/screens/shortlistedscreen.dart';
import '../controller/bottomnavbar_controller.dart';

// ignore: must_be_immutable
class BottomNavgationBarScreen extends StatefulWidget {
  final int currentindex;
  final bool islog;
  bool isChoiseScreen;
  BottomNavgationBarScreen(
      {super.key,
      required this.currentindex,
      required this.islog,
      this.isChoiseScreen = true});

  @override
  State<BottomNavgationBarScreen> createState() =>
      _BottomNavgationBarScreenState();
}

class _BottomNavgationBarScreenState extends State<BottomNavgationBarScreen> {
  final BottomNavigationController _bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {

    var lastTapDown = 0;
    final navigatescreens = [

           Homescreen(
            islogin: widget.isChoiseScreen.obs,
                   ),
        widget.islog?const MyJobsScreen():const ChooseLoginRegisterScreen(),
      widget.islog?const CourseScreen():const ChooseLoginRegisterScreen(),
      widget.islog?const ShortListedScreen():const ChooseLoginRegisterScreen(),
      widget.islog? const MyProfileScreen():const ChooseLoginRegisterScreen()
    ];

    return
      WillPopScope(
        onWillPop: () async {
          var now = DateTime.now().millisecondsSinceEpoch;
          if (now - lastTapDown < 1000) {
            return true;
          }else{

            if(_bottomNavigationController.selectedindex.value==0){
              lastTapDown = now;
              FlutterToast.show(context, 'Press again to exit.');
            }else{
              _bottomNavigationController.changeIndex(0);
            }


          }
          return false;
        },
        child: Scaffold(

            body: Obx(
              () => IndexedStack(
                index: _bottomNavigationController.selectedindex.value,
                children: navigatescreens,
              ),
            ),
            bottomNavigationBar: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                child: BottomNavigationBar(
                    elevation: 10,
                    backgroundColor: whitecolor,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: appThemecolor,
                    unselectedItemColor: unslectedclr,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    selectedLabelStyle: GoogleFonts.lato(
                      textStyle:
                          const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                    unselectedLabelStyle: GoogleFonts.lato(
                      textStyle:
                          const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                    onTap: (index) {
                      _bottomNavigationController.changeIndex(index);
                    },
                    currentIndex: _bottomNavigationController.selectedindex.value,
                    items: [
                      _buildNavItem('Home', 'assets/icons/homeshape.svg','assets/icons/Home.svg', 0),
                      _buildNavItem('My Jobs', 'assets/icons/jobsshape.svg','assets/icons/myjobs.svg', 1),
                      _buildNavItem('Courses', 'assets/icons/courseshape.svg','assets/icons/courses.svg', 2),
                      _buildNavItem('Saved', 'assets/icons/previewshape.svg', 'assets/icons/preview.svg',3),
                      _buildNavItem('My Profile','assets/icons/profileShape.svg','assets/icons/profile.svg', 4),
                    ]),
              ),
            ),
                 ),
      );


  }
  BottomNavigationBarItem _buildNavItem(String label, String selectIcon,  String unSelectIcon,int index) {
    final isSelected = index == _bottomNavigationController.selectedindex.value;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: isSelected
            ? Transform.translate(
         // Adjust the scale factor as needed
          offset: isSelected ? const Offset(0, -5) : Offset.zero,
          child: SvgPicture.asset(
            selectIcon,
            height: 21,
          ),
        )
            : SvgPicture.asset(
          unSelectIcon,
          height: 21,

        ),
      ),
      label: label,
    );
  }
}
