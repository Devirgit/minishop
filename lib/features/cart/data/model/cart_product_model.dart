import 'package:minishop/features/cart/domain/entitis/cart_product_entity.dart';

class CartProductModel extends CartProductEntity {
  const CartProductModel({
    required int id,
    required double price,
    required String title,
    required String images,
  }) : super(id: id, images: images, price: price, title: title);

  CartProductModel.fromJson(Map<String, dynamic> map)
      : super(
          id: map['id'] as int,
          price: map['price'] * 1.0,
          title: map['title'] as String,
          images: map['images'] as String,
        );
}
