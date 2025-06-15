import 'package:bloc/bloc.dart';
import 'package:chat_app/chat/domain/enities/message_enity.dart';
import 'package:chat_app/chat/domain/usecases/fetch_message_us.dart';
import 'package:chat_app/chat/presentation/bloc/chat_event.dart';
import 'package:chat_app/chat/presentation/bloc/chat_state.dart';
import 'package:chat_app/core/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FetchMessageUseCase fetchMessageUseCase;
  final SocketService _socketService = SocketService();
  final List<MessageEnity> _message = [];
  final _storage = FlutterSecureStorage();

  ChatBloc({required this.fetchMessageUseCase}) : super(ChatLoadingState()) {
    on<LoadMessageEvent>(_onLoadMessage);
    on<SendMessageEvent>(_onSendMessage);
    on<ReceiveMessageEvent>(_onReceiveEvent);
  }

  Future<void> _onLoadMessage(
      LoadMessageEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoadingState());
    try {
      final messages = await fetchMessageUseCase(event.conversationId);
      _message.clear();
      _message.addAll(messages);
      emit(ChatLoadedState(List.from(_message)));
      _socketService.socket.emit('joinConversation',event.conversationId);
      _socketService.socket.on('newMessage',(data){
        print("step1 - receive : ${data}");
        add(ReceiveMessageEvent(message: data));
      });
    } catch (error) {
      debugPrint('Error fetching chat: $error');
      emit(ChatErrorState("Failed to load message"));
    }
  }

  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
      String userId = await _storage.read(key: 'userId') ?? " ";
    print("userId: ${userId}");

    final newMessage={
      'conversation_id':event.conversationId,
      'content':event.content,
      'sender_id':userId,
    };
    _socketService.socket.emit('sendMessage',newMessage);
    
  }

  Future<void> _onReceiveEvent(
      ReceiveMessageEvent event, Emitter<ChatState> emit) async {
   print("step2 - receive event called");

   print(event.message);

   final message =MessageEnity(id: event.message['id'], conversationId: event.message['conversation_id'], senderId: event.message['sender_id'], content: event.message['content'], createdAt: event.message['created_at']);
   print("Hello: ${event.message}");
   _message.add(message);
   emit(ChatLoadedState(List.from(_message)));
  }
}
