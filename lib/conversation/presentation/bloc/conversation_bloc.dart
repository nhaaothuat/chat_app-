import 'package:bloc/bloc.dart';
import 'package:chat_app/conversation/domain/usecases/fetch_conversation.dart';
import 'package:chat_app/conversation/presentation/bloc/conversation_event.dart';
import 'package:chat_app/conversation/presentation/bloc/conversation_state.dart';
import 'package:flutter/material.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationsState> {
  final FetchConversationUseCase fetchConversationsUseCase;

  ConversationBloc({required this.fetchConversationsUseCase})
      : super(ConversationsInitial()) {
    on<FetchConversations>(_onfetchConversations);
  }

  Future<void> _onfetchConversations(
      FetchConversations e, Emitter<ConversationsState> emit) async {
    try {
      final conversation = await fetchConversationsUseCase();
      emit(ConversationsLoaded(conversation));
    } catch (error) {
      debugPrint('Error fetching conversations: $error');
      emit(ConversationsError("Failed"));
    }
  }
}
