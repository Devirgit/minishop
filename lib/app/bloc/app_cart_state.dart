part of 'app_cart_bloc.dart';

class AppCartState extends Equatable {
  const AppCartState({this.countProductCart = 0});

  final int countProductCart;

  @override
  List<Object> get props => [countProductCart];
}
