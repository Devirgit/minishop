import 'package:minishop/features/home/data/model/favorit_model.dart';
import 'package:minishop/features/home/data/service/favorit_service.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'mocky_favorit_service.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class MockyFavoritService implements FavoritService {
  factory MockyFavoritService(Dio dio, {String baseUrl}) = _MockyFavoritService;

  @override
  @GET("/654bd15e-b121-49ba-a588-960956b15175")
  Future<FavoritModel> favoritProducts();
}
