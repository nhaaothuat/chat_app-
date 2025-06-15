import 'package:chat_app/chat/domain/enities/message_enity.dart';

abstract class MessageRepository{
  Future<List<MessageEnity>> fetchMessage(String conversationId);
  Future<void> sendMessage(MessageEnity message);
}