import 'package:minishop/features/home/domain/entitis/best_product_entity.dart';

class BestProductModel extends BestProductEntity {
  const BestProductModel({
    required int id,
    required bool isFavorit,
    required String title,
    required double price,
    required double discountPrice,
    required String picture,
  }) : super(
            discountPrice: discountPrice,
            id: id,
            isFavorit: isFavorit,
            picture: picture,
            price: price,
            title: title);

  BestProductModel.fromJson(Map<String, dynamic> map)
      : super(
          id: map['id'] as int,
          isFavorit: map['is_favorites'] as bool,
          title: map['title'] as String,
          price: map['price_without_discount'] * 1.0,
          discountPrice: map['discount_price'] * 1.0,
          picture: map['picture'] as String,
        );
}
