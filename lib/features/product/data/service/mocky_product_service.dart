import 'package:minishop/features/product/data/model/product_detail_model.dart';
import 'package:minishop/features/product/data/service/product_service.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'mocky_product_service.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class MockyProductService extends ProductService {
  factory MockyProductService(Dio dio, {String baseUrl}) = _MockyProductService;

  @GET("/6c14c560-15c6-4248-b9d2-b4508df7d4f5")
  @override
  Future<ProductDetailModel> productDetail(int productID);
}
