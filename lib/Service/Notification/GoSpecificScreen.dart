
import 'package:flutter/material.dart';



import 'PayLoadModel/NavigationDetails.dart';

void goSpecificScreen(
    {required BuildContext context,
    required NavigationDetailsModel navigationDetailsModel}) {
  navigatorPushRoute({required Widget widget}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

 /* if (navigationDetailsModel.type == NavigatorRouters.home) {
    PageNavigator.homePage(context, guestUser: false);
  } else if (navigationDetailsModel.type == NavigatorRouters.quizzes) {
    PageNavigator.quizzes(context);
  } else if (navigationDetailsModel.type == NavigatorRouters.wallet) {
    PageNavigator.wallet(context, isBack: true, guestUser: false);
  } else if (navigationDetailsModel.type == NavigatorRouters.homePage) {
    PageNavigator.homePage(context, guestUser: false);
  } else if (navigationDetailsModel.type == NavigatorRouters.charity) {
    debugPrint("Charity Screen");
    navigatorPushRoute(widget: const Charity(isBack: true, guestUser: false));
  }*/
}
