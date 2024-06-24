import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/routes/approuteconst.dart';
import 'package:hidhayah/view/dashboard/view/dashboardpage.dart';
import 'package:hidhayah/view/loginsignup/view/login_page.dart';
import 'package:hidhayah/view/loginsignup/view/signup_page.dart';
import 'package:hidhayah/view/profile/view/profilepage.dart';
import 'package:hidhayah/view/qibladirection/view/qibladirectionpage.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.dashBoardRoute,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: DashboardpageWrapper());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.qiblaDirRoute,
        path: '/qibladir',
        pageBuilder: (context, state) {
          return const MaterialPage(child: QiblaDir());
        },
      ),
      // GoRoute(
      //   name: MyAppRouteConstants.loginRoute,
      //   path: '/login',
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: LoginPage());
      //   },
      // ),
      GoRoute(
        name: MyAppRouteConstants.loginRoute2,
        path: '/login2',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginPagee());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.signup,
        path: '/signup',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignUpPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.loginPopRoute,
        path: '/loginBack',
        pageBuilder: (context, state) {
          return const MaterialPage(child: DashboardpageWrapper());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.profileRoute,
        path: '/profile',
        pageBuilder: (context, state) {
          final userModel=state.extra as UserModel;
          // final name=state.pathParameters['name'];
          // final email=state.pathParameters['email'];
          return MaterialPage(child: ProfilePageWrapper(userModel: userModel,));
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: Scaffold(body: Center(child: Text(state.error.toString()),),));
    },
  );
}
