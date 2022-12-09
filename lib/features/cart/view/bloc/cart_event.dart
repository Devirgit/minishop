part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class IncreaseCount extends CartEvent {
  const IncreaseCount(this.id, {required this.incCount});

  final int id;
  final int incCount;
  @override
  List<Object> get props => [id, incCount];
}

class DecreaseCount extends CartEvent {
  const DecreaseCount(this.id, {required this.decCount});

  final int id;
  final int decCount;
  @override
  List<Object> get props => [id, decCount];
}

class RemoveProduct extends CartEvent {
  const RemoveProduct(this.id);

  final int id;
  @override
  List<Object> get props => [id];
}
