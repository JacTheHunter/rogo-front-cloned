import 'dart:convert';

import 'package:rogo/features/browse/domain/entities/top_sellers_entity.dart';

class TopSellersModel extends TopSellersEntity {
  final int id;
  final Map<String, dynamic> seller;
  final String image;

  TopSellersModel({
    required this.id,
    required this.seller,
    required this.image,
  }) : super(id: id, image: image, seller: seller);

  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'seller': seller,
      'image': image,
    };
  }

  factory TopSellersModel.fromMap(Map<String, dynamic> map) {
    return TopSellersModel(
      id: map['id'],
      seller: Map<String, dynamic>.from(map['seller']),
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TopSellersModel.fromJson(String source) => TopSellersModel.fromMap(json.decode(source));
}
