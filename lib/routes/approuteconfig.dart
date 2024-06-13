import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidhayah/routes/approuteconst.dart';
import 'package:hidhayah/view/dashboard/view/dashboardpage.dart';
import 'package:hidhayah/view/qibladirection/view/qibladirectionpage.dart';

class MyAppRouter {
  GoRouter router = GoRouter(routes: [
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
  ]);
}
