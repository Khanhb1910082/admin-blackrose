import 'package:flutter/material.dart';

enum ButtonType { PRIMARY, PLAIN }

class AppButton extends StatelessWidget {
  final ButtonType? type;
  final VoidCallback? onPressed;
  final String? text;

  const AppButton({Key? key, this.type, this.onPressed, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: getButtonColor(context, type!),
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: const [
            BoxShadow(
                //color: Color.fromRGBO(169, 176, 185, 0.42),
                //spreadRadius: 0,
                //blurRadius: 3.0,
                //offset: Offset(0, 2),
                )
          ],
        ),
        child: Center(
          child: Text(text!,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: getTextColor(context, type!))),
        ),
      ),
    );
  }
}

Color getButtonColor(context, ButtonType type) {
  switch (type) {
    case ButtonType.PRIMARY:
      // return Theme.of(context).buttonColor;
      return Theme.of(context).buttonTheme.colorScheme!.background;

    case ButtonType.PLAIN:
      return Colors.white;
    default:
      return Theme.of(context).primaryColor;
  }
}

Color getTextColor(context, ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return Theme.of(context).primaryColor;
    case ButtonType.PRIMARY:
      return Colors.white;
    default:
      // return Theme.of(context).;
      return Theme.of(context).buttonTheme.colorScheme!.background;
  }
}
