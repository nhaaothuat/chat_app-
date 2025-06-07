import 'package:bloc/bloc.dart';
import 'package:chat_app/conversation/presentation/bloc/conversation_event.dart';
import 'package:chat_app/conversation/presentation/bloc/conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent,ConversationsState>{

  final FetchConversations fetchConversationsUseCase;

  ConversationBloc(this.fetchConversationsUseCase):super(ConversationsInitial()){
    on<FetchConversations>(_onfetchConversations);
  }

  Future<void> _onFetchConversations (FetchConversations e, Emitter<ConversationsState> emit)async{
    try{
final conversation = await fetchConversationsUseCase();
emit(ConversationsLoaded(conversation));
    }catch(error){
      emit(ConversationsError("Failed"));
    }
  }

}