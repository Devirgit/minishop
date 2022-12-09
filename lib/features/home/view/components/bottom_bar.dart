import 'package:flutter/material.dart';
import 'package:minishop/app/widgets/cart_button.dart';
import 'package:minishop/common/context_extention.dart';
import 'package:minishop/common/theme/icons.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
          color: context.theme.bottomBarColor,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: ShapeDecoration(
                      color: context.theme.cardColor,
                      shape: CircleBorder(
                          side: BorderSide(
                        color: context.theme.cardColor,
                      ))),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  context.loc.explorerNaviBar,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: context.theme.cardColor),
                )
              ],
            ),
            CartButton(
              child: IconButton(
                  onPressed: () => context.go('/cart'),
                  icon: Icon(
                    UIIcon.cart,
                    color: context.theme.cardColor,
                  )),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(UIIcon.heart, color: context.theme.cardColor)),
            IconButton(
                onPressed: () {},
                icon: Icon(UIIcon.people, color: context.theme.cardColor)),
          ],
        ),
      ),
    );
  }
}
