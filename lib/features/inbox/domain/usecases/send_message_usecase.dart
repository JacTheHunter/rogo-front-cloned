import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';
import 'package:rogo/features/inbox/domain/repositories/inbox_repository.dart';

class SendMessageUseCase extends UseCase<ChatMessage, SendMessageParams> {
  final InboxRepository _repository;

  SendMessageUseCase({required InboxRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, ChatMessage>> call(SendMessageParams params) async {
    return await _repository.sendMessage(
      text: params.text,
      chatId: params.chatId,
    );
  }
}

class SendMessageParams extends Equatable {
  final String text;
  final int chatId;
  SendMessageParams({
    required this.text,
    required this.chatId,
  });

  @override
  List<Object> get props => [text, chatId];
}
