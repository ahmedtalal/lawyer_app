import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color_manager.dart';
import '../../../core/functions.dart';
import '../controller/chats_cubit.dart';
import '../widgets/inbox_tile_component.dart';
import 'chat_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ChatsCubit>().getAllChats();
    return Scaffold(
      appBar: AppBar(     centerTitle: true,     backgroundColor: ColorManager.secondary
          ,title: const Text("المحادثات")),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 23, right: 15),
        child: BlocConsumer<ChatsCubit, ChatsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state is GetChatsSuccessState
                ? ListView.builder(
                    itemCount: state.chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          navigateTo(
                            context,
                            ChatScreen(
                              recieverId: state
                                  .chats[index].recieverId,
                              chatId: state
                                  .chats[index].conversationId,
                              userName: state
                                  .chats[index].name,
                            ),
                          );
                        },
                        child: InboxTileComponent(
                          avatarUrl:
                              state.chats[index].lastMessage.sender.avatarUrl,
                          createdAt: state.chats[index].lastMessage.createdAt,
                          isSeen: 0,
                          lastMessage: state.chats[index].lastMessage.message,
                          unreadMessageCount: 1,

                              // state.chats[index].unreadMessagesCount,
                          userName:
                              state.chats[index].name,
                        ),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
