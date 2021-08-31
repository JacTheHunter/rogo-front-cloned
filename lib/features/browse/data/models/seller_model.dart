import 'dart:convert';

import '../../domain/entities/seller.dart';

class SellerModel extends Seller {
  final String avatar;
  final String fullName;
  final num rating;
  final num reviews;

  SellerModel(
    this.avatar,
    this.fullName,
    this.rating,
    this.reviews,
  ) : super(
          avatar: avatar,
          fullName: fullName,
          rating: rating,
          reviews: reviews,
        );

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'full_name': fullName,
      'rating': rating,
      'reviews': reviews,
    };
  }

  factory SellerModel.fromMap(Map<String, dynamic> map) {
    return SellerModel(
      map['avatar'],
      map['full_name'],
      map['rating'],
      map['reviews'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SellerModel.fromJson(String source) => SellerModel.fromMap(json.decode(source));
}
