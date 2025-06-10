import 'dart:convert';

import 'package:chat_app/conversation/data/model/conversation_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
class ConversationDataSource{
  final String baseUrl = "https://be-native.onrender.com/api/v1/conver";
  final _storage = FlutterSecureStorage();

  Future<List<ConversationModel>> fetchConversations() async{
    String token = await _storage.read(key: 'token') ?? '';
    // if (token.isEmpty) {
    //   throw Exception("Missing token. Please login.");
    // }
    // String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImMzNDFlZjY1LWY4ZmUtNDZiNC1hNTUzLTZjYzhlNDZlNjQxZiIsImlhdCI6MTc0OTQ1NjY4NywiZXhwIjoxNzQ5NDkyNjg3fQ.wjW-dhZ3Fe6Vu32d-e0UMU_G_3QpeSScqi8xDMcZ6-g";
    final res = await http.get(
      Uri.parse('${baseUrl}'),
      headers:{
      'Authorization': 'Bearer ${token}',
      }
    );

    print(res.body);
    if(res.statusCode == 200){
      List data = jsonDecode(res.body);

      return data.map((e)=> ConversationModel.fromJson(e)).toList();
    }else{
      throw Exception("Failed to fetch conversation");
    }
  }
}