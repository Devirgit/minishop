import 'package:flutter/material.dart';
import 'package:minishop/common/context_extention.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      this.height = 54,
      required this.caption,
      required this.onClick})
      : super(key: key);
  final double height;
  final Widget caption;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        margin: const EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
              backgroundColor:
                  MaterialStateProperty.all<Color>(context.theme.accentColor)),
          onPressed: onClick,
          child: caption,
        ),
      ),
    );
  }
}
