import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:minishop/features/product/domain/entitis/product_detail_entity.dart';
import 'package:minishop/features/product/domain/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(ProductRepository productRepository)
      : _productRepository = productRepository,
        super(const ProductState.init()) {
    on<ProductLoad>(_onProductLoad);
  }

  final ProductRepository _productRepository;

  Future<void> _onProductLoad(
    ProductLoad event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductState.loading());
    final response = await _productRepository.productDetail(event.productID);
    response.result((error) => emit(ProductState.failure(error.type)),
        (product) => emit(ProductState.success(product)));
  }
}
