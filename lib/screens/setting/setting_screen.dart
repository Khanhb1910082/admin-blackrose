import 'package:blackrose_admin_panel/core/constants/size_of_device.dart';
import 'package:blackrose_admin_panel/routes/routes.dart';
import 'package:blackrose_admin_panel/service/api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          width: SizeDevice().width(context),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () async {
              await GetAPI.auth.signOut().then((value) {
                context.go(WebRoutes.loginScreen);
              });
            },
            child: const Text(
              'Đăng xuất',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
