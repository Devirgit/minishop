import 'package:minishop/core/components/respons.dart';
import 'package:minishop/core/error/failure.dart';
import 'package:minishop/features/cart/domain/entitis/cart_entity.dart';

abstract class CartRepository {
  Future<Respons<Failure, CartEntity>> cartProduct();
}
