import 'package:minishop/features/home/domain/entitis/hot_product_entity.dart';

class HotProductModel extends HotProductEntity {
  const HotProductModel({
    required int id,
    required bool isNew,
    required String title,
    required String subTitle,
    required String picture,
    required bool isBuy,
  }) : super(
            id: id,
            isBuy: isBuy,
            isNew: isNew,
            picture: picture,
            subTitle: subTitle,
            title: title);

  HotProductModel.fromJson(Map<String, dynamic> map)
      : super(
          id: map['id'] as int,
          isNew: map.containsKey('is_new') ? map['is_new'] as bool : false,
          title: map['title'] as String,
          subTitle: map['subtitle'] as String,
          picture: map['picture'] as String,
          isBuy: map['is_buy'] as bool,
        );
}
