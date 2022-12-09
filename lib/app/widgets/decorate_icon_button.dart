import 'package:flutter/material.dart';

class DecorateIconButton extends StatelessWidget {
  const DecorateIconButton(
      {required this.backgroundColor,
      required this.iconButton,
      required this.iconColor,
      this.onTap,
      Key? key})
      : super(key: key);

  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final Widget iconButton;

  @override
  Widget build(BuildContext context) {
    final icon = IconTheme(
        data: IconThemeData(
          color: iconColor,
          size: 20,
        ),
        child: iconButton);

    return Container(
      width: 37,
      height: 37,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        icon: icon,
        onPressed: onTap,
      ),
    );
  }
}
