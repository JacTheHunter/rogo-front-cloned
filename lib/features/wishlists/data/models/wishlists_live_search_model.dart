import 'dart:convert';

import '../../domain/entities/wishlists_live_search.dart';

class WishlistsLiveSearchModel extends WishlistsLiveSearch {
  final int id;
  final String image;
  final String rentalPriceRange;
  final String title;
  final String city;
  final bool isFavorite;

  WishlistsLiveSearchModel({
    required this.id,
    required this.city,
    required this.image,
    required this.isFavorite,
    required this.rentalPriceRange,
    required this.title,
  }) : super(
          id: id,
          city: city,
          image: image,
          isFavorite: isFavorite,
          rentalPriceRange: rentalPriceRange,
          title: title,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'rental_price_range': rentalPriceRange,
      'title': title,
      'city': city,
      'is_favorite': isFavorite,
    };
  }

  factory WishlistsLiveSearchModel.fromMap(Map<String, dynamic> map) {
    return WishlistsLiveSearchModel(
      id: map['id'],
      image: map['image'],
      rentalPriceRange: map['rental_price_range'],
      title: map['title'],
      city: map['city'],
      isFavorite: map['is_favorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WishlistsLiveSearchModel.fromJson(String source) => WishlistsLiveSearchModel.fromMap(json.decode(source));
}
