import 'package:minishop/features/home/data/model/best_product_model.dart';
import 'package:minishop/features/home/data/model/hot_product_model.dart';
import 'package:minishop/features/home/domain/entitis/favorit_entity.dart';

class FavoritModel extends FavoritEntity {
  FavoritModel.fromJson(Map<String, dynamic> map)
      : super(
            bestSellerProduct: List<BestProductModel>.from(map['best_seller']
                ?.map((item) => BestProductModel.fromJson(item))),
            hotSalesProduct: List<HotProductModel>.from(map['home_store']
                ?.map((item) => HotProductModel.fromJson(item))));
}
