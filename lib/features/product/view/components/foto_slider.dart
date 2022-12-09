import 'package:flutter/material.dart';
import 'package:minishop/common/context_extention.dart';

class FotoSlider extends StatefulWidget {
  const FotoSlider({Key? key, required this.photos}) : super(key: key);

  final List<String> photos;

  @override
  State<FotoSlider> createState() => _FotoSliderState();
}

class _FotoSliderState extends State<FotoSlider> {
  late double itemWidth;
  int? selected;
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    selected = 0;
    _controller = FixedExtentScrollController(initialItem: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    itemWidth = width * 0.75;
    final itemHeight = width - 5;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: itemWidth + 20,
            height: itemHeight - 70,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(55, 78, 136, 0.16),
                      blurRadius: 20,
                      offset: Offset(0, 10))
                ]),
          ),
        ),
        SizedBox(
          width: width,
          height: itemHeight - 50,
          child: RotatedBox(
            quarterTurns: -1,
            child: Align(
              alignment: Alignment.topCenter,
              child: ListWheelScrollView(
                  itemExtent: itemWidth,
                  diameterRatio: 5,
                  offAxisFraction: -0.5,
                  controller: _controller,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selected = index;
                    });
                  },
                  children: List.generate(widget.photos.length, (int index) {
                    return RotatedBox(
                      quarterTurns: 1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: index == selected ? itemWidth : itemWidth - 20,
                        height: index == selected ? itemWidth : itemWidth - 20,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Image.network(widget.photos[index]),
                        ),
                      ),
                    );
                  })),
            ),
          ),
        ),
      ],
    );
  }
}
