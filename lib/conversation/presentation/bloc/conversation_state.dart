import 'package:chat_app/conversation/domain/enities/conversation_enity.dart';

abstract class ConversationsState{}

class ConversationsInitial extends ConversationsState{}

class ConversationsLoading extends ConversationsState{}

class ConversationsLoaded extends ConversationsState{
  final List<ConversationEnity> conversations;
  ConversationsLoaded(this.conversations);
}

class ConversationsError extends ConversationsState{
  final String message;
  ConversationsError(this.message);
}