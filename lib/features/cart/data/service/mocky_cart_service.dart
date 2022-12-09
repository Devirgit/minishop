import 'package:minishop/features/cart/data/model/cart_model.dart';
import 'package:minishop/features/cart/data/service/cart_service.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'mocky_cart_service.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class MockyCartService extends CartService {
  factory MockyCartService(Dio dio, {String baseUrl}) = _MockyCartService;

  @override
  @GET("/53539a72-3c5f-4f30-bbb1-6ca10d42c149")
  Future<CartModel> cart();
}
