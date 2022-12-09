import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:minishop/app/widgets/button.dart';
import 'package:minishop/app/widgets/decorate_icon_button.dart';
import 'package:minishop/common/theme/display_transformation.dart';
import 'package:minishop/common/theme/icons.dart';
import 'package:minishop/core/di/di.dart';
import 'package:minishop/features/cart/view/bloc/cart_bloc.dart';
import 'package:minishop/features/cart/view/components/components.dart';
import 'package:minishop/common/context_extention.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Text(
                context.loc.addAddress,
                textAlign: TextAlign.end,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )),
              const SizedBox(
                width: 8,
              ),
              DecorateIconButton(
                backgroundColor: context.theme.accentColor,
                iconColor: context.theme.cardColor,
                iconButton: const Icon(UIIcon.location),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => CartBloc(Di.get())..add(LoadCart()),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30, bottom: 40),
                child: Text(
                  context.loc.cartTitle,
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: context.theme.bottomBarColor,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 20,
                            color: Color.fromRGBO(76, 95, 143, 0.1),
                            offset: Offset(0, -5))
                      ]),
                  child: Column(children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 80, 10, 10),
                      child: BlocBuilder<CartBloc, CartState>(
                        buildWhen: (previous, current) =>
                            previous.cart != current.cart ||
                            previous.status != current.status,
                        builder: (context, state) {
                          switch (state.status) {
                            case CartStatus.loading:
                              return const Center(
                                  child: CircularProgressIndicator());
                            case CartStatus.success:
                              return ProductList(state.cart?.products ?? []);
                            default:
                              return Center(
                                child: Text(
                                  context.loc.emptyData,
                                  style:
                                      TextStyle(color: context.theme.cardColor),
                                ),
                              );
                          }
                        },
                      ),
                    )),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: context.theme.dividerColor,
                                  width: 2))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 35, 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.loc.totalPrice,
                                style: TextStyle(
                                    color: context.theme.cardColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                context.loc.deliveryType,
                                style: TextStyle(
                                    color: context.theme.cardColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          BlocBuilder<CartBloc, CartState>(
                            buildWhen: (previous, current) =>
                                previous.cart?.delivery !=
                                    current.cart?.delivery ||
                                previous.cart?.totalPrice !=
                                    current.cart?.totalPrice,
                            builder: (context, state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '\$${ViewFormat.formatCostDisplay(state.cart?.totalPrice ?? 0)}',
                                      style: TextStyle(
                                          color: context.theme.cardColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(state.cart?.delivery ?? '-',
                                      style: TextStyle(
                                          color: context.theme.cardColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700)),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                        color: context.theme.dividerColor,
                      ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 5, 40, 40),
                      child: Button(
                        caption: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  context.loc.checkout,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ]),
                        onClick: () {},
                      ),
                    ),
                  ]),
                ),
              ),
            ]),
      ),
    );
  }
}
