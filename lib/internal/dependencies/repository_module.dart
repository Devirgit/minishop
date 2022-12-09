import 'package:minishop/features/cart/data/repository/cart_repository_impl.dart';
import 'package:minishop/features/cart/domain/repository/cart_repository.dart';
import 'package:minishop/features/home/data/repository/favorit_repository_impl.dart';
import 'package:minishop/features/home/domain/repository/favorit_repository.dart';
import 'package:minishop/features/product/data/repository/product_repository_impl.dart';
import 'package:minishop/features/product/domain/repository/product_repository.dart';
import 'package:minishop/internal/dependencies/api_module.dart';

class RepositoryModule {
  static final RepositoryModule _instantce = RepositoryModule._internal();

  factory RepositoryModule() {
    return _instantce;
  }

  RepositoryModule._internal();

  CartRepository get cartRepository =>
      CartRepositoryImpl(cartService: ApiModule().cartService);
  FavoritRepository get favoritRepository =>
      FavoritRepositoryImpl(favoritService: ApiModule().favoritService);
  ProductRepository get productRepository =>
      ProductRepositoryImpl(productService: ApiModule().productService);
}
