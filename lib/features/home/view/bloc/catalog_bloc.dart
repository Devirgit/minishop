import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:minishop/features/home/domain/entitis/favorit_entity.dart';
import 'package:minishop/features/home/domain/repository/favorit_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc(FavoritRepository favoritRepository)
      : _favoritRepository = favoritRepository,
        super(const CatalogState.init()) {
    on<CatalogLoad>(_onCatalogLoad);
  }

  final FavoritRepository _favoritRepository;

  Future<void> _onCatalogLoad(
    CatalogLoad event,
    Emitter<CatalogState> emit,
  ) async {
    emit(const CatalogState.loading());
    final respons = await _favoritRepository.favoritProducts();
    respons.result((error) => emit(CatalogState.error(error.type)),
        (items) => emit(CatalogState.success(items)));
  }
}
