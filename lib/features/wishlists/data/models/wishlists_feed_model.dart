import 'dart:convert';

import '../../domain/entities/wishlists_feed.dart';

class WishlistsFeedModel extends WishlistsFeed {
  final int id;
  final String image;
  final String rentalPrice;
  final String title;
  final String city;
  final bool isFavorite;

  WishlistsFeedModel({
    required this.id,
    required this.image,
    required this.rentalPrice,
    required this.title,
    required this.city,
    required this.isFavorite,
  }) : super(
          city: city,
          id: id,
          image: image,
          rentalPrice: rentalPrice,
          title: title,
          isFavorite: isFavorite,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'rental_price': rentalPrice,
      'title': title,
      'city': city,
      'is_favorite': isFavorite,
    };
  }

  factory WishlistsFeedModel.fromMap(Map<String, dynamic> map) {
    return WishlistsFeedModel(
      id: map['id'],
      image: map['image'],
      rentalPrice: map['rental_price'],
      title: map['title'],
      city: map['city'],
      isFavorite: map['is_favorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WishlistsFeedModel.fromJson(String source) => WishlistsFeedModel.fromMap(json.decode(source));
}
