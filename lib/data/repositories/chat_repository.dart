import 'package:hokok/data/models/chat_message_model.dart';
import 'package:hokok/data/models/chat_model.dart';
import 'package:hokok/data/services/api/chat_api_services.dart';
import 'package:hokok/domain/interfaces/i_chat_internface.dart';

class ChatRepository implements IChatInterface {
  static ChatRepository? _chatRepository;
  ChatRepository._internal();
  static ChatRepository instance() {
    if (_chatRepository == null) {
      return _chatRepository = ChatRepository._internal();
    }
    return _chatRepository!;
  }

  @override
  Future<List<ChatMessages>> getChatMessages(model) async {
    return await ChatApiServices.instance().getChatMessagesSer(model);
  }

  @override
  Future<List<Chats>> getChats(model) async {
    return await ChatApiServices.instance().getChatsSer(model);
  }

  @override
  Future<Map<String, dynamic>> sendMessage(model) async {
    return await ChatApiServices.instance().sendMessageSer(model);
  }

  @override
  Future<Map<String, dynamic>> sendMessageToAdmin(model) async {
    return await ChatApiServices.instance().sendMessageToAdminSer(model);
  }
}
