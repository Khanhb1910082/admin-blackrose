import 'package:flutter/material.dart';

class SizeDevice {
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
}
