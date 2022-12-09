import 'package:flutter/material.dart';
import 'package:minishop/features/product/domain/entitis/product_detail_entity.dart';

class ProductDetailModel extends ProductDetailEntity {
  const ProductDetailModel({
    required int id,
    required String cpu,
    required String camera,
    required List<String> capacity,
    required List<Color> color,
    required List<String> images,
    required bool isFavorites,
    required double price,
    required double rating,
    required String ram,
    required String rom,
    required String title,
  }) : super(
            camera: camera,
            capacity: capacity,
            color: color,
            cpu: cpu,
            id: id,
            images: images,
            isFavorites: isFavorites,
            price: price,
            ram: ram,
            rating: rating,
            rom: rom,
            title: title);

  static Color _fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  ProductDetailModel.fromJson(Map<String, dynamic> map)
      : super(
          id: int.parse(map['id']),
          cpu: map['CPU'] as String,
          camera: map['camera'] as String,
          capacity: List<String>.from(map['capacity']),
          color: List<Color>.from(map['color'].map((item) => _fromHex(item))),
          images: List<String>.from(map['images']),
          isFavorites: map['isFavorites'] as bool,
          price: map['price'] * 1.0,
          rating: map['rating'] * 1.0,
          ram: map['ssd'] as String,
          rom: map['sd'] as String,
          title: map['title'] as String,
        );
}
