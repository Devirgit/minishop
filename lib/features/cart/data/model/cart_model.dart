import 'package:minishop/features/cart/data/model/cart_product_model.dart';
import 'package:minishop/features/cart/domain/entitis/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required int id,
    required double total,
    required String delivery,
    required List<CartProductModel> product,
  }) : super(delivery: delivery, id: id, products: product, total: total);

  CartModel.fromJson(Map<String, dynamic> map)
      : super(
          id: int.parse(map['id']),
          total: map['total'] * 1.0,
          delivery: map['delivery'] as String,
          products: List<CartProductModel>.from(
              map['basket']?.map((item) => CartProductModel.fromJson(item))),
        );
}
