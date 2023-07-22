import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hokok/chat/data/models/chats_model.dart';
import '../../../core/api_consumer.dart';
import '../../../core/api_paths.dart';
import '../models/message_model.dart';
import '../parameter/send_message_parameter.dart';

abstract class ChatsRemoteDataSource {
  Future<List<ChatsModel>> getAllChats();
  Future<List<MessageModel>> getChatMessage(int chatId);
  Future<void> sendMessage(MessageParameter messageParameter );

}

class ChatsRemoteDataSourceImpl implements ChatsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ChatsRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<List<ChatsModel>> getAllChats() async {
    Response data = await _apiConsumer.get(CHATS);
    var json = jsonDecode(data.data);
    List list = json['data']["chats"];
    List<ChatsModel> chats =
    list.map<ChatsModel>((e) => ChatsModel.fromJson(e)).toList();
    return chats;
  }
  @override
  Future<List<MessageModel>> getChatMessage(int chatId) async {
    Response data = await _apiConsumer.get(chatMessages(chatId));
    var json = jsonDecode(data.data);
    List list = json['data']["messages"];
    List<MessageModel> messages =
    list.map<MessageModel>((e) => MessageModel.fromJson(e)).toList();
    return messages;
  }

  @override
  Future<void> sendMessage(MessageParameter messageParameter ) async {
    Response response = await _apiConsumer.post(
      body: messageParameter.toJson(),
      messageParameter.isAdmin?CHATADMINMESSAGES :   CHATMESSAGES,
    );
    if (response.statusCode == 200) {
      print("send Messages Successfully");
    } else {
      throw Exception();
    }
  }


}
