import 'package:chat_app/conversation/data/datasource/conversation_datasource.dart';
import 'package:chat_app/conversation/domain/enities/conversation_enity.dart';
import 'package:chat_app/conversation/domain/repositories/conversation_repository.dart';

class ConversationImple implements ConversationRepository{

  final ConversationDataSource conversationDataSource;

  ConversationImple({required this.conversationDataSource});

  @override
  Future<List<ConversationEnity>> fetchConversations() async{
    return await conversationDataSource.fetchConversations();
  }

}