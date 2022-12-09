import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minishop/app/bloc/app_cart_bloc.dart';
import 'package:minishop/app/widgets/button.dart';
import 'package:minishop/app/widgets/cart_button.dart';
import 'package:minishop/app/widgets/decorate_icon_button.dart';
import 'package:minishop/common/context_extention.dart';
import 'package:minishop/common/theme/display_transformation.dart';
import 'package:minishop/common/theme/icons.dart';
import 'package:minishop/core/di/di.dart';
import 'package:minishop/features/product/view/bloc/product_bloc.dart';
import 'package:minishop/features/product/view/components/components.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(this.productID, {super.key});

  final int productID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(Di.get())..add(ProductLoad(productID)),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecorateIconButton(
                    backgroundColor: context.theme.fontColor,
                    iconColor: context.theme.cardColor,
                    iconButton: const Padding(
                      padding: EdgeInsets.only(left: 3),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    onTap: () => context.go('/'),
                  ),
                  Expanded(
                      child: Center(
                          child: Text(context.loc.productDetailsHeader))),
                  CartButton(
                    productCountColor: context.theme.fontColor,
                    child: DecorateIconButton(
                      backgroundColor: context.theme.accentColor,
                      iconColor: context.theme.cardColor,
                      iconButton: const Icon(
                        UIIcon.cart,
                        size: 15,
                      ),
                      onTap: () => context.go('/cart'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: context.theme.cardColor,
                    height: 200,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BlocBuilder<ProductBloc, ProductState>(
                      buildWhen: (previous, current) => previous != current,
                      builder: (context, state) {
                        return ListView(
                          children: [
                            FotoSlider(photos: state.product?.images ?? []),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: SizedBox(
                                  height: 320,
                                  child: ProductDetails(state.product)),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    color: context.theme.cardColor,
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: Button(
                      caption: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.loc.addToCart,
                                style: TextStyle(
                                    color: context.theme.cardColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              BlocBuilder<ProductBloc, ProductState>(
                                builder: (context, state) {
                                  return Text(
                                    '\$${ViewFormat.formatCostDisplay(state.product?.price ?? 0, patern: 1.01)}',
                                    style: TextStyle(
                                        color: context.theme.cardColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  );
                                },
                              ),
                            ]),
                      ),
                      onClick: () =>
                          context.read<AppCartBloc>().add(AddToCart(productID)),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
