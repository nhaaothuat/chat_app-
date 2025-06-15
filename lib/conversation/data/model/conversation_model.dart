import 'package:chat_app/conversation/domain/enities/conversation_enity.dart';

class ConversationModel extends ConversationEnity {
  ConversationModel(
      {required id,
      required participantName,
      required lastMessage,
      required lastMessageTime})
      : super(
            id: id,
            participantName: participantName,
            lastMessage: lastMessage,
            lastMessageTime: lastMessageTime);

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    print('Parsing conversation: $json');
    return ConversationModel(
        id: json['conversation_id'] ?? '',  //phải nhập đúng key ['conversation_id'] mà API gửi lên
        participantName: json['paticipant_name'] ?? '',
        lastMessage: json['last_message'] ?? '',
        lastMessageTime: DateTime.parse(json['last_message_time']));
  }
}
