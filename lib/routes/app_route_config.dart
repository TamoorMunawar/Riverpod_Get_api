import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_state/routes/app_route_constant.dart';

import '../screen/Home.dart';
import '../screen/StateNotifierScreen.dart';

class MyAppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: AppRoutesConstant.homeRoute,
      path: '/',
      pageBuilder: (context, state) {
        return const MaterialPage(child: HomeScreen());
      },
    ),
    GoRoute(
        name: AppRoutesConstant.stateNotifierProviderRoute,
        path: '/stateNotifierProvider',
        pageBuilder: (context, state) {
          return MaterialPage(child: StateNotifierScreen());
        }),
  ]);
}
