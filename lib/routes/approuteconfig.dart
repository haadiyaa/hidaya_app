import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidhayah/routes/approuteconst.dart';
import 'package:hidhayah/view/dashboard/view/dashboardpage.dart';
import 'package:hidhayah/view/loginsignup/view/loginpage.dart';
import 'package:hidhayah/view/qibladirection/view/qibladirectionpage.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.dashBoardRoute,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: DashBoardPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.qiblaDirRoute,
        path: '/qibladir',
        pageBuilder: (context, state) {
          return const MaterialPage(child: QiblaDir());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.loginRoute,
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.loginPopRoute,
        path: '/loginBack',
        pageBuilder: (context, state) {
          return const MaterialPage(child: DashBoardPage());
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: Scaffold(body: Center(child: Text(state.error.toString()),),));
    },
  );
}
