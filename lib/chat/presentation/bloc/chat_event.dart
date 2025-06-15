abstract class ChatEvent{}

class LoadMessageEvent extends ChatEvent{
  final String conversationId;

  LoadMessageEvent({required this.conversationId});
}

class SendMessageEvent extends ChatEvent{
  final String conversationId;
  final String content;

  SendMessageEvent({required this.conversationId, required this.content});
}

class ReceiveMessageEvent extends ChatEvent{
  final Map<String,dynamic> message;
  ReceiveMessageEvent({required this.message});
}