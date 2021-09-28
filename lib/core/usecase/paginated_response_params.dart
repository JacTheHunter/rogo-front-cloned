import 'package:equatable/equatable.dart';

class PaginatedResponseParams extends Equatable {
  final int? page;
  final int? limit;
  PaginatedResponseParams({
    this.page,
    this.limit,
  });

  @override
  List<Object?> get props => [page, limit];
}
