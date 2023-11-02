import 'package:blackrose_admin_panel/responsive.dart';
import 'package:flutter/material.dart';

import 'components/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: child,
              // IndexedStack(
              //   index: menuProvider.indexMenu,
              //   children: menuProvider.pages,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
