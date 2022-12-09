import 'package:flutter/material.dart';
import 'package:minishop/app/widgets/decorate_icon_button.dart';
import 'package:minishop/common/theme/icons.dart';
import 'package:minishop/features/product/domain/entitis/product_detail_entity.dart';
import 'package:minishop/common/context_extention.dart';
import 'package:minishop/features/product/view/components/color_select.dart';
import 'package:minishop/features/product/view/components/memory_select.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(this.product, {super.key});

  final ProductDetailEntity? product;

  List<Widget> _ratingStars(BuildContext context) {
    final fullFavorit = product?.rating.truncate() ?? 0;
    final bool isHalfRating = (product?.rating ?? 0) - fullFavorit > 0;
    return List.generate(
      5,
      (index) {
        final IconData icons;
        bool isColored = true;
        if (index == fullFavorit && isHalfRating) {
          icons = Icons.star_half;
        } else if (index <= fullFavorit - 1) {
          icons = Icons.star;
        } else {
          icons = Icons.star_border_outlined;
          isColored = false;
        }

        return Icon(
          icons,
          size: 18,
          color: isColored
              ? context.theme.favoritColor
              : context.theme.iconCategoryColor,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(28, 28, 28, 5),
      decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product?.title ?? '-',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: _ratingStars(context),
                    )
                  ],
                ),
                if (product?.isFavorites ?? false)
                  DecorateIconButton(
                      backgroundColor: context.theme.fontColor,
                      iconButton: const Icon(Icons.favorite_border_outlined),
                      iconColor: context.theme.cardColor),
              ],
            ),
            Expanded(child: _TabBarProperty(product)),
          ]),
    );
  }
}

class _TabBarProperty extends StatefulWidget {
  const _TabBarProperty(this.product, {Key? key}) : super(key: key);
  final ProductDetailEntity? product;

  @override
  State<_TabBarProperty> createState() => __TabBarPropertyState();
}

class __TabBarPropertyState extends State<_TabBarProperty>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;

  void _tabChange() {
    setState(() {
      tabIndex = _tabController.index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    _tabController.addListener(_tabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      context.loc.tabShop,
      context.loc.tabDetails,
      context.loc.tabFeatures
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: List.generate(tabs.length, (index) => Tab(text: tabs[index])),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              _TabShop(widget.product),
              const _TabDetails(),
              const _TabFeatures(),
            ],
          ),
        )
      ],
    );
  }
}

class _TabShop extends StatelessWidget {
  const _TabShop(this.product, {Key? key}) : super(key: key);

  final ProductDetailEntity? product;

  Widget _propertyProduct(BuildContext context, IconData icon, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: Icon(
            icon,
            color: context.theme.productParamsColor,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: context.theme.productParamsColor,
              fontSize: 11,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _propertyProduct(context, UIIcon.processor, product?.cpu ?? '-'),
              _propertyProduct(context, UIIcon.camera, product?.camera ?? '-'),
              _propertyProduct(context, UIIcon.ram, product?.ram ?? '-'),
              _propertyProduct(context, UIIcon.rom, product?.rom ?? '-'),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            context.loc.selectOption,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Builder(builder: (context) {
            if (product != null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColorSelect(
                    product!.color,
                    onChange: (value) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: MemorySelect(
                      product!.capacity,
                      onChange: (value) {},
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox(
                height: 20,
              );
            }
          }),
        ],
      ),
    );
  }
}

class _TabDetails extends StatelessWidget {
  const _TabDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.loc.tabDetails),
    );
  }
}

class _TabFeatures extends StatelessWidget {
  const _TabFeatures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.loc.tabFeatures),
    );
  }
}
