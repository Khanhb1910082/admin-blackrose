import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Main extends StatelessWidget {
  const Main({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('main'),
      ),
      drawer: Column(
        children: [
          TextButton(
            onPressed: () {
              context.go('/page1');
            },
            child: Text('page1'),
          ),
          TextButton(
            onPressed: () {
              context.go('/page2');
            },
            child: Text('page2'),
          ),
          TextButton(
            onPressed: () {
              context.go('/page3');
            },
            child: Text('page3'),
          ),
        ],
      ),
      body: child,
    );
  }
}
