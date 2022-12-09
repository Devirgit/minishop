import 'package:minishop/core/error/failure.dart';
import 'package:minishop/core/components/respons.dart';
import 'package:minishop/features/home/data/service/favorit_service.dart';
import 'package:minishop/features/home/domain/entitis/favorit_entity.dart';
import 'package:minishop/features/home/domain/repository/favorit_repository.dart';

class FavoritRepositoryImpl extends FavoritRepository {
  FavoritRepositoryImpl({required FavoritService favoritService})
      : _favoritService = favoritService;

  final FavoritService _favoritService;

  @override
  Future<Respons<Failure, FavoritEntity>> favoritProducts() async {
    try {
      final favoritProducts = await _favoritService.favoritProducts();
      return Right(favoritProducts);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
