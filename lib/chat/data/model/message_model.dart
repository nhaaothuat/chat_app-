import 'package:chat_app/chat/domain/enities/message_enity.dart';


class MessageModel extends MessageEnity{
  MessageModel({required super.id, required super.conversationId, required super.senderId, required super.content, required super.createdAt});

 factory MessageModel.fromJson(Map<String, dynamic> json){
   return MessageModel(
     id: json['id'],
     conversationId: json["conversation_id"] ,
     senderId: json["sender_id"] ,
     content: json["content"] ,
     createdAt:json['created_at'],

   );
 }

}