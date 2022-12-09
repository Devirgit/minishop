import 'package:minishop/features/cart/data/model/cart_model.dart';
import 'package:minishop/core/error/failure.dart';
import 'package:minishop/core/components/respons.dart';
import 'package:minishop/features/cart/data/service/cart_service.dart';
import 'package:minishop/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl({required CartService cartService})
      : _cartService = cartService;

  final CartService _cartService;

  @override
  Future<Respons<Failure, CartModel>> cartProduct() async {
    try {
      final cart = await _cartService.cart();
      return Right(cart);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
