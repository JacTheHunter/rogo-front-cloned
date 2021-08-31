import 'dart:convert';

import 'seller_model.dart';
import '../../domain/entities/seller.dart';

import '../../domain/entities/top_seller.dart';

class TopSellerModel extends TopSeller {
  final int id;
  final Seller seller;
  final String image;

  TopSellerModel({
    required this.id,
    required this.seller,
    required this.image,
  }) : super(id: id, image: image, seller: seller);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'seller': (seller as SellerModel).toMap(),
      'image': image,
    };
  }

  factory TopSellerModel.fromMap(Map<String, dynamic> map) {
    return TopSellerModel(
      id: map['id'],
      seller: SellerModel.fromMap(map['seller']),
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TopSellerModel.fromJson(String source) => TopSellerModel.fromMap(json.decode(source));
}
