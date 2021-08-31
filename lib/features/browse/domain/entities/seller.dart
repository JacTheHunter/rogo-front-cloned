import 'package:equatable/equatable.dart';

class Seller extends Equatable {
  final String avatar;
  final String fullName;
  final num rating;
  final num reviews;
  Seller({
    required this.avatar,
    required this.fullName,
    required this.rating,
    required this.reviews,
  });

  @override
  List<Object> get props => [avatar, fullName, rating, reviews];
}
