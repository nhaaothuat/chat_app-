import 'package:chat_app/conversation/domain/enities/conversation_enity.dart';

abstract class ConversationRepository{
  Future<List<ConversationEnity>> fetchConversations();
}