import 'package:flutter/material.dart';
import 'package:minishop/app/routing/not_found.dart';
import 'package:minishop/app/routing/route_page.dart';
import 'package:minishop/features/cart/cart.dart';
import 'package:minishop/features/home/home.dart';
import 'package:minishop/features/product/product.dart';

abstract class RoutePageConfig {
//service pages
  static const notFoundPage = PageConfig(
    key: ValueKey('not_found_page'),
    child: NotFoundPage(),
  );

//all page
  static const homePage = PageConfig(
    key: ValueKey('home_page'),
    child: HomePage(),
  );
  static const cartPage = PageConfig(
    key: ValueKey('cart_page'),
    child: CartPage(),
  );
  static productPage(int productID) => PageConfig(
        key: const ValueKey('product_page'),
        child: ProductPage(productID),
      );
}

class PageConfig extends NaviPage {
  const PageConfig(
      {required super.child,
      super.key,
      super.title,
      super.fullScreenDialog,
      super.type = NaviPageType.slideRightTransition});
}
