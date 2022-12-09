part of 'cart_bloc.dart';

enum CartStatus { initial, loading, success, failure }

class CartState extends Equatable {
  const CartState._({
    required this.status,
    this.errorType,
    this.cart,
  });

  const CartState.init() : this._(status: CartStatus.initial);

  const CartState.loading() : this._(status: CartStatus.loading);

  const CartState.error(String? type)
      : this._(status: CartStatus.failure, errorType: type);

  const CartState.success(CartEntity cart)
      : this._(status: CartStatus.success, cart: cart);

  final CartStatus status;
  final String? errorType;
  final CartEntity? cart;

  @override
  List<Object> get props => [status];

  CartState copyWith({
    CartStatus? status,
    String? errorType,
    CartEntity? cart,
  }) {
    return CartState._(
      status: status ?? this.status,
      errorType: errorType ?? this.errorType,
      cart: cart ?? this.cart,
    );
  }
}
