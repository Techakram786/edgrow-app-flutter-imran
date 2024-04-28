import 'package:flutter/material.dart';

import 'package:loading_overlay_pro/loading_overlay_pro.dart';



class Loader{

  static Widget screenLoader( {required bool loading,Widget? myWidget,BottomNavigationBar? bottomNavigationBar}){
    return LoadingOverlayPro(
      isLoading:loading,
      child: Scaffold(
          body: myWidget,
          bottomNavigationBar: bottomNavigationBar
      ),
    );
  }

}
