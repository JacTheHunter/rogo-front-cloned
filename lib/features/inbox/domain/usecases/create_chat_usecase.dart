import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/inbox/domain/repositories/inbox_repository.dart';

class CreateChatUseCase extends UseCase<bool, CreateChatParams> {
  final InboxRepository _repository;

  CreateChatUseCase({required InboxRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(CreateChatParams params) async {
    return await _repository.createChat(
      companionId: params.companionId,
      publicationId: params.publicationId,
    );
  }
}

class CreateChatParams extends Equatable {
  final int companionId;
  final int publicationId;
  CreateChatParams({
    required this.companionId,
    required this.publicationId,
  });

  @override
  List<Object> get props => [companionId, publicationId];
}
