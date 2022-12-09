import 'package:flutter/material.dart';
import 'package:minishop/common/context_extention.dart';

class MemorySelect extends StatefulWidget {
  const MemorySelect(this.memoryAvaliable, {Key? key, this.onChange})
      : super(key: key);
  final List<String> memoryAvaliable;
  final ValueChanged<String>? onChange;
  @override
  State<MemorySelect> createState() => _MemorySelectState();
}

class _MemorySelectState extends State<MemorySelect> {
  int select = 0;

  void _onSelect(int value) {
    if (value != select) {
      setState(() {
        select = value;
        if (widget.onChange != null) {
          widget.onChange!(widget.memoryAvaliable[value]);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            widget.memoryAvaliable.length,
            (index) => InkWell(
                onTap: () => _onSelect(index),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index == select
                          ? context.theme.accentColor
                          : context.theme.cardColor),
                  child: Text(
                    '${widget.memoryAvaliable[index]} GB',
                    style: TextStyle(
                        color: index == select
                            ? context.theme.cardColor
                            : context.theme.capacityColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  ),
                ))));
  }
}
