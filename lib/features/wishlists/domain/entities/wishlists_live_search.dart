import 'package:equatable/equatable.dart';

class WishlistsLiveSearch extends Equatable {
  final int id;
  final String image;
  final String rentalPriceRange;
  final String title;
  final String city;
  final bool isFavorite;

  WishlistsLiveSearch({
    required this.id,
    required this.image,
    required this.rentalPriceRange,
    required this.title,
    required this.city,
    required this.isFavorite,
  });

  @override
  List<Object?> get props {
    return [id, image, rentalPriceRange, title, city, isFavorite];
  }
}
