import 'package:minishop/core/components/respons.dart';
import 'package:minishop/core/error/failure.dart';
import 'package:minishop/features/product/data/model/product_detail_model.dart';
import 'package:minishop/features/product/data/service/product_service.dart';
import 'package:minishop/features/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required ProductService productService})
      : _productService = productService;

  final ProductService _productService;
  @override
  Future<Respons<Failure, ProductDetailModel>> productDetail(
      int productID) async {
    try {
      final productDetail = await _productService.productDetail(productID);
      return Right(productDetail);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
