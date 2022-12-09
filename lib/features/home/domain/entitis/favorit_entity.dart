import 'package:equatable/equatable.dart';

import 'package:minishop/features/home/domain/entitis/best_product_entity.dart';
import 'package:minishop/features/home/domain/entitis/hot_product_entity.dart';

class FavoritEntity extends Equatable {
  const FavoritEntity({
    required this.bestSellerProduct,
    required this.hotSalesProduct,
  });

  final List<BestProductEntity> bestSellerProduct;
  final List<HotProductEntity> hotSalesProduct;

  @override
  List<Object> get props => [bestSellerProduct, hotSalesProduct];
}
