import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductDetailEntity extends Equatable {
  const ProductDetailEntity({
    required this.id,
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.ram,
    required this.rom,
    required this.title,
  });

  final int id;
  final String cpu;
  final String camera;
  final List<String> capacity;
  final List<Color> color;
  final List<String> images;
  final bool isFavorites;
  final double price;
  final double rating;
  final String ram;
  final String rom;
  final String title;

  @override
  List<Object> get props {
    return [
      id,
      cpu,
      camera,
      capacity,
      color,
      images,
      isFavorites,
      price,
      rating,
      ram,
      rom,
      title,
    ];
  }
}
