import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minishop/app/bloc/app_cart_bloc.dart';
import 'package:minishop/common/context_extention.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key, required this.child, this.productCountColor})
      : super(key: key);

  final Widget child;
  final Color? productCountColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCartBloc, AppCartState>(
      builder: (context, state) {
        return Stack(
          children: [
            child,
            if (state.countProductCart != 0)
              _CountCartProduct(
                state.countProductCart,
                productCountColor: productCountColor,
              )
          ],
        );
      },
    );
  }
}

class _CountCartProduct extends StatelessWidget {
  const _CountCartProduct(this.countProduct, {Key? key, this.productCountColor})
      : super(key: key);

  final Color? productCountColor;
  final int countProduct;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Container(
        width: 18,
        height: 18,
        decoration: ShapeDecoration(
            color: productCountColor ?? context.theme.accentColor,
            shape: CircleBorder(
                side: BorderSide(
              color: productCountColor ?? context.theme.accentColor,
            ))),
        child: Center(
            child: Text(
          countProduct.toString(),
          style: TextStyle(color: context.theme.cardColor, fontSize: 12),
        )),
      ),
    );
  }
}
