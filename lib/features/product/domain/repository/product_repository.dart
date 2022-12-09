import 'package:minishop/core/components/respons.dart';
import 'package:minishop/core/error/failure.dart';
import 'package:minishop/features/product/domain/entitis/product_detail_entity.dart';

abstract class ProductRepository {
  Future<Respons<Failure, ProductDetailEntity>> productDetail(int productID);
}
