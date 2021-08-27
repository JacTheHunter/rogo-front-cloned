import 'dart:convert';

import '../../domain/entities/top_seller.dart';

class TopSellerModel extends TopSeller {
  final int id;
  final Map<String, dynamic> seller;
  final String image;

  TopSellerModel({
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

  factory TopSellerModel.fromMap(Map<String, dynamic> map) {
    return TopSellerModel(
      id: map['id'],
      seller: Map<String, dynamic>.from(map['seller']),
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TopSellerModel.fromJson(String source) => TopSellerModel.fromMap(json.decode(source));
}
