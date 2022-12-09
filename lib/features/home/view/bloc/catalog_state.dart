part of 'catalog_bloc.dart';

enum CatalogStatus { initial, loading, success, failure }

class CatalogState extends Equatable {
  const CatalogState._(
      {required this.status, this.errorType, this.favoritProduct});

  const CatalogState.init()
      : this._(
          status: CatalogStatus.initial,
        );

  const CatalogState.error(String? errorType)
      : this._(status: CatalogStatus.failure, errorType: errorType);

  const CatalogState.loading() : this._(status: CatalogStatus.loading);

  const CatalogState.success(FavoritEntity favorit)
      : this._(status: CatalogStatus.success, favoritProduct: favorit);

  final FavoritEntity? favoritProduct;
  final String? errorType;
  final CatalogStatus status;
  @override
  List<Object> get props => [status];
}
