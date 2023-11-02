import 'package:blackrose_admin_panel/screens/screen.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  int indexMenu = 0;

  List<Widget> pages = [
    const DashboardScreen(),
    const PostScreen(),
    const PagesScreen(),
    const CategoriesScreen(),
    const AppearanceScreen(),
    const UsersScreen(),
    const ToolsScreen(),
    const SettingScreen(),
  ];

  void setIndexMenu(int index) {
    indexMenu = index;
    notifyListeners();
  }
}
