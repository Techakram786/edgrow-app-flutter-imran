import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../authentication/screens/choose_login_screen.dart';
import '../../authentication/screens/login/view/login_your_account.dart';
import '../../onboardScreens/view/onboard_view_screen.dart';
import '../../spalshscreen/view/spalshscreen.dart';

class AppGoRoutes{
  GoRouter router = GoRouter(
      routes: [
        GoRoute(
            name: RoutesName.splashScreen,
            path:  '/',
           pageBuilder: (context,state){
             return MaterialPage(child: SplashScreen());
           }),
        GoRoute(
            name: RoutesName.boardingScreen,
            path: '/boarding',
            pageBuilder: (context,state){
              return MaterialPage(child: OnboardingScreen());
            }),
        GoRoute(
            name: RoutesName.chooseLoginScreen,
            path: '/choose_login',
            pageBuilder: (context,state){
              return const MaterialPage(child: ChooseLoginRegisterScreen());
            }),
        GoRoute(
            name: RoutesName.loginScreen,
            path: '/login',
            pageBuilder: (context,state){
              return const MaterialPage(child: LoginAccountScreen());
            }),
      ]);
}