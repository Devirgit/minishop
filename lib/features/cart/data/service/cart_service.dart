import 'package:minishop/features/cart/data/model/cart_model.dart';

abstract class CartService {
  Future<CartModel> cart();
}
