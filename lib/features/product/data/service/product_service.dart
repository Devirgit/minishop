import 'package:minishop/features/product/data/model/product_detail_model.dart';

abstract class ProductService {
  Future<ProductDetailModel> productDetail(int productID);
}
