import 'package:chat_app/chat/domain/enities/message_enity.dart';

abstract class ChatState{

}

class ChatLoadingState extends ChatState{

}

class ChatLoadedState extends ChatState{
  final List<MessageEnity> message;
  ChatLoadedState(this.message);
}

class ChatErrorState extends ChatState{
  final String message;
  ChatErrorState(this.message);
}