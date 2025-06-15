import 'package:chat_app/chat/data/datasource/message_datasource.dart';
import 'package:chat_app/chat/domain/enities/message_enity.dart';
import 'package:chat_app/chat/domain/repositories/message_repository.dart';

class MessageImplement implements MessageRepository{

  final MessageDataSource messageDataSource;

  MessageImplement({required this.messageDataSource});

  @override
  Future<List<MessageEnity>> fetchMessage(String conversationId) async{
  return await messageDataSource.fetchMessages(conversationId);
  }

  @override
  Future<void> sendMessage(MessageEnity message) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
  
}