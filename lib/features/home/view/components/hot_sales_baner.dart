import 'package:flutter/material.dart';
import 'package:minishop/common/context_extention.dart';
import 'package:minishop/features/home/domain/entitis/hot_product_entity.dart';

class HotSalesBaner extends StatelessWidget {
  const HotSalesBaner(this.product, {super.key});

  final HotProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          color: context.theme.banerColor,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                product.picture,
              ),
              fit: BoxFit.cover,
              alignment: FractionalOffset.topLeft)),
      child: Container(
        margin: EdgeInsets.only(
            left: 10, right: MediaQuery.of(context).size.width / 2),
        padding: const EdgeInsets.only(left: 15),
        color: context.theme.banerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product.isNew
                ? Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: ShapeDecoration(
                        color: context.theme.accentColor,
                        shape: CircleBorder(
                            side:
                                BorderSide(color: context.theme.accentColor))),
                    child: Center(
                      child: Text(
                        context.loc.newProduct,
                        style: TextStyle(
                            color: context.theme.cardColor,
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 30,
                  ),
            Column(
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                      color: context.theme.cardColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  product.subTitle,
                  style: TextStyle(
                      color: context.theme.cardColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Container(
              height: 25,
              width: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        context.theme.cardColor)),
                child: Text(
                  context.loc.buyNow,
                  style: TextStyle(
                      color: context.theme.fontColor,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
