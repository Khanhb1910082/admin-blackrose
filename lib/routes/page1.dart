import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.amber,
      child: Center(
        child: InkWell(
            onTap: () {
              context.go('/page2');
            },
            child: Text('page1')),
      ),
    ));
  }
}
