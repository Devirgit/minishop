part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductLoad extends ProductEvent {
  const ProductLoad(this.productID);

  final int productID;

  @override
  List<Object> get props => [productID];
}
