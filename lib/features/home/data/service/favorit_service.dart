import 'package:minishop/features/home/data/model/favorit_model.dart';

abstract class FavoritService {
  Future<FavoritModel> favoritProducts();
}
