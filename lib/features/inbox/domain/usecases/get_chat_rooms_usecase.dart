import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/usecase/paginated_response_params.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_chat_rooms.dart';
import 'package:rogo/features/inbox/domain/repositories/inbox_repository.dart';

class GetChatRoomsUseCase extends UseCase<PaginatedChatRooms, PaginatedResponseParams> {
  final InboxRepository _repository;

  GetChatRoomsUseCase({required InboxRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedChatRooms>> call(PaginatedResponseParams params) async {
    return await _repository.getPaginatedChatRooms(
      page: params.page,
      limit: params.limit,
    );
  }
}
