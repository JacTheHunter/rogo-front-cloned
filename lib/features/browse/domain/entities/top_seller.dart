import 'package:equatable/equatable.dart';

class TopSeller extends Equatable {
  final int id;
  final Map<String, dynamic> seller;
  final String image;

  TopSeller({
    required this.id,
    required this.seller,
    required this.image,
  });

  @override
  List<Object?> get props => [id, seller, image];
}
