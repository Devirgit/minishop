import 'package:equatable/equatable.dart';

class CartProductEntity extends Equatable {
  const CartProductEntity({
    required this.id,
    required this.price,
    required this.title,
    required this.images,
    this.count = 1,
  });

  final int id;
  final double price;
  final String title;
  final String images;
  final int count;

  double get cost => count * price;

  @override
  List<Object> get props {
    return [
      id,
      price,
      title,
      images,
      count,
    ];
  }

  CartProductEntity copyWith({
    int? count,
  }) {
    return CartProductEntity(
      id: id,
      price: price,
      title: title,
      images: images,
      count: count ?? this.count,
    );
  }
}
