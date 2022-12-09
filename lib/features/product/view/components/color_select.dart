import 'package:flutter/material.dart';
import 'package:minishop/common/context_extention.dart';

class ColorSelect extends StatefulWidget {
  const ColorSelect(this.colorsAvaliable, {Key? key, this.onChange})
      : super(key: key);

  final List<Color> colorsAvaliable;
  final ValueChanged<Color>? onChange;

  @override
  State<ColorSelect> createState() => _ColorSelectState();
}

class _ColorSelectState extends State<ColorSelect> {
  int select = 0;

  void _onSelect(int value) {
    if (value != select) {
      setState(() {
        select = value;
        if (widget.onChange != null) {
          widget.onChange!(widget.colorsAvaliable[value]);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          widget.colorsAvaliable.length,
          (index) => InkWell(
                onTap: () => _onSelect(index),
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 15, top: 12),
                  decoration: ShapeDecoration(
                      color: widget.colorsAvaliable[index],
                      shadows: const [
                        BoxShadow(
                            color: Color.fromRGBO(167, 171, 201, 0.15),
                            blurRadius: 10)
                      ],
                      shape: CircleBorder(
                          side: BorderSide(
                              color: widget.colorsAvaliable[index]))),
                  child: index == select
                      ? Icon(
                          Icons.done,
                          color: context.theme.cardColor,
                          size: 24,
                        )
                      : const SizedBox(),
                ),
              )),
    );
  }
}
