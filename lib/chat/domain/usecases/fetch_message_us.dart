import 'package:chat_app/chat/domain/enities/message_enity.dart';
import 'package:chat_app/chat/domain/repositories/message_repository.dart';

class FetchMessageUseCase{
  final MessageRepository repository;

  FetchMessageUseCase({required this.repository});

  Future<List<MessageEnity>> call (String conversationId) async{
    return await repository.fetchMessage(conversationId);
  }
}