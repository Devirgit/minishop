import 'package:minishop/core/components/respons.dart';
import 'package:minishop/core/error/failure.dart';
import 'package:minishop/features/home/domain/entitis/favorit_entity.dart';

abstract class FavoritRepository {
  Future<Respons<Failure, FavoritEntity>> favoritProducts();
}
