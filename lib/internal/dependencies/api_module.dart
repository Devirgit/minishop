import 'package:dio/dio.dart';
import 'package:minishop/features/cart/data/service/cart_service.dart';
import 'package:minishop/features/cart/data/service/mocky_cart_service.dart';
import 'package:minishop/features/home/data/service/favorit_service.dart';
import 'package:minishop/features/home/data/service/mocky_favorit_service.dart';
import 'package:minishop/features/product/data/service/mocky_product_service.dart';
import 'package:minishop/features/product/data/service/product_service.dart';

class ApiModule {
  final Dio _dio = Dio();

  static final ApiModule _instantce = ApiModule._internal();

  factory ApiModule() => _instantce;

  ApiModule._internal();

  CartService get cartService => MockyCartService(_dio);
  FavoritService get favoritService => MockyFavoritService(_dio);
  ProductService get productService => MockyProductService(_dio);
}
