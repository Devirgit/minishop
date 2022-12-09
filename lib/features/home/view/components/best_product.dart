import 'package:flutter/material.dart';
import 'package:minishop/features/home/domain/entitis/best_product_entity.dart';
import 'package:minishop/common/theme/display_transformation.dart';
import 'package:minishop/common/context_extention.dart';

class BestProductItem extends StatelessWidget {
  const BestProductItem(this.product, {super.key});

  final BestProductEntity product;

  @override
  Widget build(BuildContext context) {
    final iconFavorit =
        product.isFavorit ? Icons.favorite : Icons.favorite_border_outlined;

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(170, 182, 211, 0.1),
              blurRadius: 1.0,
              offset: Offset(0, 2),
            ),
          ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constrain) {
                    return Container(
                        height: constrain.maxWidth - 10,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.network(
                          product.picture,
                          fit: BoxFit.contain,
                        ));
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 25,
                    height: 25,
                    margin: const EdgeInsets.only(right: 12, top: 12),
                    decoration: ShapeDecoration(
                        shadows: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius: 20,
                          )
                        ],
                        color: context.theme.cardColor,
                        shape: CircleBorder(
                            side: BorderSide(color: context.theme.cardColor))),
                    child: Center(
                      child: Icon(
                        iconFavorit,
                        color: context.theme.accentColor,
                        size: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text:
                        "\$${ViewFormat.formatCostDisplay(product.discountPrice, patern: 1)} ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: context.theme.fontColor)),
                TextSpan(
                    text:
                        " \$${ViewFormat.formatCostDisplay(product.price, patern: 1)}",
                    style: TextStyle(
                        color: context.theme.priceOldColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough))
              ])),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 15),
              child: Text(
                product.title,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
            ),
          ]),
    );
  }
}
