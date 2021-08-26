import 'package:equatable/equatable.dart';

class TopSellersEntity extends Equatable {
  final int id;
  final Map<String, dynamic> seller;
  final String image;

const  TopSellersEntity({
    required this.id,
    required this.seller,
    required this.image,
  });

  @override
  List<Object?> get props => [id, seller, image];
}
