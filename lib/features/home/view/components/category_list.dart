import 'package:flutter/material.dart';
import 'package:minishop/common/context_extention.dart';
import 'package:minishop/common/theme/icons.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: _category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 15 : 0,
                right: index == _category.length - 1 ? 15 : 0),
            child: _CategoryButton(
              _category[index].title,
              icon: _category[index].icon,
              isActive: index == selectCategory,
              onTap: () {
                selectCategory = index;
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton(this.title,
      {Key? key, this.isActive = false, this.onTap, required this.icon})
      : super(key: key);

  final String title;
  final bool isActive;
  final Icon icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconThemeData(
      color:
          isActive ? context.theme.cardColor : context.theme.iconCategoryColor,
      size: 30,
    );
    final containerColor =
        isActive ? context.theme.accentColor : context.theme.cardColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: 70,
              height: 70,
              decoration: ShapeDecoration(
                  color: containerColor,
                  shadows: const [
                    BoxShadow(
                        color: Color.fromRGBO(167, 171, 201, 0.15),
                        blurRadius: 10)
                  ],
                  shape: CircleBorder(side: BorderSide(color: containerColor))),
              child: IconTheme(
                data: iconTheme,
                child: icon,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: isActive
                    ? context.theme.accentColor
                    : context.theme.fontColor),
          ),
        ],
      ),
    );
  }
}

List<_Catrgories> _category = [
  _Catrgories(title: 'Phone', icon: const Icon(UIIcon.phone)),
  _Catrgories(title: 'Computer', icon: const Icon(UIIcon.computer)),
  _Catrgories(title: 'Health', icon: const Icon(UIIcon.health)),
  _Catrgories(title: 'Books', icon: const Icon(UIIcon.books)),
  _Catrgories(title: 'Other', icon: const Icon(Icons.star_border_outlined))
];

class _Catrgories {
  _Catrgories({required this.title, required this.icon});
  final String title;
  final Icon icon;
}
