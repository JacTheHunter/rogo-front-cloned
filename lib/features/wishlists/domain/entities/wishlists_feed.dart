import 'package:equatable/equatable.dart';

class WishlistsFeed extends Equatable {
  final int id;
  final String image;
  final String rentalPrice;
  final String title;
  final String city;
  final bool isFavorite;

  WishlistsFeed({
    required this.id,
    required this.image,
    required this.rentalPrice,
    required this.title,
    required this.city,
    required this.isFavorite,
  });

  @override
  List<Object?> get props {
    return [id, image, rentalPrice, title, city, isFavorite];
  }
}
