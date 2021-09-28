import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/usecase/paginated_response_params.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_chat_rooms.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_users.dart';
import 'package:rogo/features/inbox/domain/repositories/inbox_repository.dart';

class GetUsersForChatUseCase extends UseCase<PaginatedUsers, PaginatedResponseParams> {
  final InboxRepository _repository;

  GetUsersForChatUseCase({required InboxRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedUsers>> call(PaginatedResponseParams params) async {
    return await _repository.getPaginatedUsers(
      page: params.page,
      limit: params.limit,
    );
  }
}
