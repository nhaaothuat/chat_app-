import 'package:chat_app/conversation/domain/enities/conversation_enity.dart';
import 'package:chat_app/conversation/domain/repositories/conversation_repository.dart';

class FetchConversationUseCase{
  final ConversationRepository repository;

  FetchConversationUseCase(this.repository);

  Future<List<ConversationEnity>> call() async{
    return repository.fetchConversations();
  }
}