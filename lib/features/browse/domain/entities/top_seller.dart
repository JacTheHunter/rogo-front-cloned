import 'package:equatable/equatable.dart';

import 'seller.dart';

class TopSeller extends Equatable {
  final int id;
  final Seller seller;
  final String image;

  TopSeller({
    required this.id,
    required this.seller,
    required this.image,
  });

  @override
  List<Object?> get props => [id, seller, image];
}
