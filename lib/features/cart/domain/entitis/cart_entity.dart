import 'package:equatable/equatable.dart';
import 'package:minishop/features/cart/domain/entitis/cart_product_entity.dart';

class CartEntity extends Equatable {
  const CartEntity({
    required this.id,
    required this.total,
    required this.delivery,
    required this.products,
  });

  final int id;
  final double total;
  final String delivery;

  final List<CartProductEntity> products;

  double get totalPrice => products.fold(
      0, (previousValue, product) => previousValue + product.cost);

  @override
  List<Object> get props => [id, total, delivery, products];

  CartEntity copyWith({
    double? total,
    List<CartProductEntity>? products,
  }) {
    return CartEntity(
      id: id,
      total: total ?? this.total,
      delivery: delivery,
      products: products ?? this.products,
    );
  }
}
