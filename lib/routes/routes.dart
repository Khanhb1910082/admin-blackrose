import 'package:blackrose_admin_panel/routes/main.dart';
import 'package:blackrose_admin_panel/routes/page1.dart';
import 'package:blackrose_admin_panel/routes/page2.dart';
import 'package:blackrose_admin_panel/routes/page3.dart';
import 'package:blackrose_admin_panel/screens/home/components/side_menu.dart';
import 'package:blackrose_admin_panel/screens/login/login_screen.dart';
import 'package:blackrose_admin_panel/screens/screen.dart';
import 'package:blackrose_admin_panel/service/api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class WebRoutes {
  static const String loginScreen = "/";
  static const String homeScreen = '/dashboard';
  static const String postsScreen = '/posts';
  static const String pagesScreen = '/pages';
  static const String categorisScreen = '/categoris';
  static const String appearanceScreen = '/appearance';
  static const String usersScreen = '/users';
  static const String toolScreen = '/tool';
  static const String settingScreen = '/setting';
  static GoRouter router = GoRouter(
    initialLocation: GetAPI.auth.currentUser == null ? loginScreen : homeScreen,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: loginScreen,
        builder: (context, state) =>
            const Login(title: "Wellcome to the Admin & Dashboard Panel"),
      ),
      GoRoute(
          path: homeScreen,
          pageBuilder: (context, state) => const MaterialPage(
                child: HomeScreen(
                  child: DashboardScreen(),
                ),
              )),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) =>
            NoTransitionPage(child: HomeScreen(child: child)),
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: homeScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DashboardScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: postsScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: PostScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: pagesScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: PagesScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: categorisScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: CategoriesScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: appearanceScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AppearanceScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: usersScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: UsersScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: toolScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ToolsScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: settingScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SettingScreen()),
          ),
        ],
      ),
    ],
  );
}
