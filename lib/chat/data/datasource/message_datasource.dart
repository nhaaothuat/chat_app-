import 'dart:convert';

import 'package:chat_app/chat/data/model/message_model.dart';
import 'package:chat_app/chat/domain/enities/message_enity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:http/http.dart" as http;

class MessageDataSource {
  final String baseUrl = "https://be-native.onrender.com/api/v1/message";

  final _storage = FlutterSecureStorage();

  Future<List<MessageEnity>> fetchMessages(String conversationId) async {
    String token = await _storage.read(key: "token") ?? "";
    final res = await http.get(
      Uri.parse("${baseUrl}/$conversationId"),
      headers: {"Authorization": "Bearer $token"},
    );
    print(res.body);
    if(res.statusCode==200){
      List data = jsonDecode(res.body);
      print("Raw response data: $data");
      return data.map((json)=>MessageModel.fromJson(json)).toList();
    }else{
      throw Exception("Failed to fetch Message");
    }

  }
}
