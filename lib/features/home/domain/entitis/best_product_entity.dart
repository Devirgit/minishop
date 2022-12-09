import 'package:equatable/equatable.dart';

class BestProductEntity extends Equatable {
  const BestProductEntity({
    required this.id,
    required this.isFavorit,
    required this.title,
    required this.price,
    required this.discountPrice,
    required this.picture,
  });

  final int id;
  final bool isFavorit;
  final String title;
  final double price;
  final double discountPrice;
  final String picture;

  @override
  List<Object> get props {
    return [
      id,
      isFavorit,
      title,
      price,
      discountPrice,
      picture,
    ];
  }
}
