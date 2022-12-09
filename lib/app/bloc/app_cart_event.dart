part of 'app_cart_bloc.dart';

abstract class AppCartEvent extends Equatable {
  const AppCartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends AppCartEvent {
  const AddToCart(this.productID);

  final int productID;

  @override
  List<Object> get props => [productID];
}
