import 'package:flutter/material.dart';
import 'package:minishop/common/context_extention.dart';

class HeaderBlock extends StatelessWidget {
  const HeaderBlock(
      {Key? key,
      required this.header,
      required this.actionTitle,
      this.onAction})
      : super(key: key);

  final String header;
  final String actionTitle;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          InkWell(
            onTap: onAction,
            child: Text(actionTitle,
                textAlign: TextAlign.right,
                style:
                    TextStyle(fontSize: 15, color: context.theme.accentColor)),
          ),
        ],
      ),
    );
  }
}
