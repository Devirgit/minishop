import 'package:equatable/equatable.dart';

class HotProductEntity extends Equatable {
  const HotProductEntity({
    required this.id,
    required this.isNew,
    required this.title,
    required this.subTitle,
    required this.picture,
    required this.isBuy,
  });

  final int id;
  final bool isNew;
  final String title;
  final String subTitle;
  final String picture;
  final bool isBuy;

  @override
  List<Object> get props {
    return [
      id,
      isNew,
      title,
      subTitle,
      picture,
      isBuy,
    ];
  }
}
