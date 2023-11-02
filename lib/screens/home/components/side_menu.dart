import 'package:blackrose_admin_panel/core/constants/color_constants.dart';
import 'package:blackrose_admin_panel/providers/menu_provider.dart';
import 'package:blackrose_admin_panel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: defaultPadding * 3,
                ),
                Image.asset(
                  "assets/logo/appIcon.png",
                  scale: 45,
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                const Text("BlackRose - Application")
              ],
            )),
            DrawerListTile(
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                context.go(WebRoutes.homeScreen);
              },
            ),
            DrawerListTile(
              title: "Posts",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                context.go(WebRoutes.postsScreen);
              },
            ),
            DrawerListTile(
              title: "Pages",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                context.go(WebRoutes.pagesScreen);
              },
            ),
            DrawerListTile(
              title: "Categories",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {
                context.go(WebRoutes.categorisScreen);
              },
            ),
            DrawerListTile(
              title: "Appearance",
              svgSrc: "assets/icons/menu_store.svg",
              press: () {
                context.go(WebRoutes.appearanceScreen);
              },
            ),
            DrawerListTile(
              title: "Users",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {
                context.go(WebRoutes.usersScreen);
              },
            ),
            DrawerListTile(
              title: "Tools",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {
                context.go(WebRoutes.toolScreen);
              },
            ),
            DrawerListTile(
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                context.push(WebRoutes.settingScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
