import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:minishop/core/components/respons.dart';
import 'package:minishop/features/cart/domain/entitis/cart_entity.dart';
import 'package:minishop/features/cart/domain/repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartRepository cartRepository)
      : _cartRepository = cartRepository,
        super(const CartState.init()) {
    on<LoadCart>(_onLoadCart);
    on<IncreaseCount>(_onIncreaseCount);
    on<DecreaseCount>(_onDecreaseCount);
    on<RemoveProduct>(_onRemoveProduct);
  }

  final CartRepository _cartRepository;

  Future<void> _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());
    final response = await _cartRepository.cartProduct();
    response.result((error) => emit(CartState.error(error.type)),
        (cart) => emit(CartState.success(cart)));
  }

  Respons<String, CartEntity> _changeProducts(
      CartEntity? cart, int id, int count) {
    final index =
        cart?.products.indexWhere((product) => product.id == id) ?? -1;
    if (index >= 0) {
      final changetProduct = cart!.products[index];
      int newCount = changetProduct.count + count;
      if (newCount <= 0) {
        newCount = 1;
      }
      final products = [...cart.products];

      products[index] = changetProduct.copyWith(count: newCount);
      return Right(cart.copyWith(products: products));
    } else {
      return const Left('response-error');
    }
  }

  Future<void> _onIncreaseCount(
    IncreaseCount event,
    Emitter<CartState> emit,
  ) async {
    final currentCart = state.cart;
    emit(const CartState.loading());
    final response = _changeProducts(currentCart, event.id, event.incCount);
    response.result((error) => CartState.error(error),
        (cart) => emit(CartState.success(cart)));
  }

  Future<void> _onDecreaseCount(
    DecreaseCount event,
    Emitter<CartState> emit,
  ) async {
    final currentCart = state.cart;
    emit(const CartState.loading());
    final response = _changeProducts(currentCart, event.id, -event.decCount);
    response.result((error) => CartState.error(error),
        (cart) => emit(CartState.success(cart)));
  }

  Future<void> _onRemoveProduct(
    RemoveProduct event,
    Emitter<CartState> emit,
  ) async {
    final currentCart = state.cart;
    if (currentCart != null) {
      emit(const CartState.loading());
      currentCart.products.removeWhere((product) => product.id == event.id);
      emit(CartState.success(currentCart));
    }
  }
}
