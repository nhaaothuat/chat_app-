import 'dart:convert';

import 'package:chat_app/conversation/data/model/conversation_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
class ConversationDataSource{
  final String baseUrl = "https://be-native.onrender.com/api/v1/conver";
  final _storage = FlutterSecureStorage();

  Future<List<ConversationModel>> fetchConversations() async{
    String token = await _storage.read(key: 'token') ?? '';
    final res = await http.get(
      Uri.parse('${baseUrl}'),
      headers:{
      'Authorization': 'Bearer ${token}',
      }
    );

    if(res.statusCode == 200){
      List data = jsonDecode(res.body);
      return data.map((e)=> ConversationModel.fromJson(e)).toList();
    }else{
      throw Exception("Failed to fetch conversation");
    }
  }
}