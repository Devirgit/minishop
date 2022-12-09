part of 'product_bloc.dart';

enum ProductStatus { initial, loading, success, failure }

class ProductState extends Equatable {
  const ProductState._({this.errorType, this.product, required this.status});

  const ProductState.init() : this._(status: ProductStatus.initial);

  const ProductState.failure(String? errorType)
      : this._(status: ProductStatus.failure, errorType: errorType);

  const ProductState.loading() : this._(status: ProductStatus.loading);

  const ProductState.success(ProductDetailEntity product)
      : this._(status: ProductStatus.success, product: product);

  final ProductDetailEntity? product;
  final String? errorType;
  final ProductStatus status;
  @override
  List<Object> get props => [
        status,
      ];
}
