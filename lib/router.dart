// router.dart
import 'package:go_router/go_router.dart';
import 'package:proprty_managment/widgets/bottom_navigation.dart';

import 'main.dart';
import 'widgets/my_information/my_info.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      path: '/myInfo',
      builder: (context, state) => MyInfo(),
    ),
    GoRoute(
      path: '/bottom_navigation',
      builder: (context, state) => BottomNavigationScreen(),
    ),
  ],
);

