import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/ui_responsive/sized_box.dart';
import 'package:intl/intl.dart';
import '../../../core/pusher_services.dart';
import '../../data/parameter/send_message_parameter.dart';
import '../controller/chats_cubit.dart';
import 'dart:ui' as ui;

class ChatScreen extends StatefulWidget {
  final String userName;
  final int? chatId;
  final int?  recieverId;

  const ChatScreen({super.key, required this.userName, required this.chatId , required this.recieverId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    widget.chatId != null?context.read<ChatsCubit>().getChatMessage(widget.chatId!):null;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    context.read<ChatsCubit>().getAllChats();
    print("didChangeDependencies");
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatsCubit>();
    return Directionality(
      textDirection:ui. TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorManager.secondary,
          title: Text('محادثة مع ${widget.userName}'),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatsCubit, ChatsState>(
                buildWhen: (previous, current) =>
                    current is GetMessagesSuccessState ||current is GetlifeMessageSuccessState,
                listener: (context, state) {
                  if (state is GetlifeMessageSuccessState) {
                    context.read<ChatsCubit>().getChatMessage(widget.chatId!);
                    // context.read<ChatsCubit>().getChatMessage(widget.userName);
                    // context.read<ChatsCubit>().senMessageController.clear();
                  }
                  if (state is GetMessagesSuccessState) {
                    pusherConnect(context);
                    // context.read<ChatsCubit>().getChatMessage(widget.userName);
                    // context.read<ChatsCubit>().senMessageController.clear();
                  }
                  if (state is SendMessageSuccessState) {
                    context.read<ChatsCubit>().getChatMessage(widget.chatId!);
                    context.read<ChatsCubit>().senMessageController.clear();
                  }
                },
                builder: (context, state) {
                  return state is GetMessagesSuccessState || state is GetlifeMessageSuccessState
                      ? ListView.builder(
                          reverse: true,
                          itemCount: chatCubit.messages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: const EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                              child: Align(
                                alignment:
                                    (chatCubit.messages[index].direction == "outbound"
                                        ? Alignment.topLeft
                                        : Alignment.topRight),
                                child: Row(
                                  children: [
                                    chatCubit.messages[index].direction == "inbound"
                                        ? Container(
                                            width: 50.0,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(chatCubit
                                                    .messages[index]
                                                    .sender
                                                    .avatarUrl),
                                              ),
                                            ),
                                          )
                                        : const Spacer(),
                                    17.pw,
                                    chatCubit.messages[index].direction == "outbound"
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              20.ph,
                                              Row(
                                                children: [
                                                  Text(
                                                    chatCubit
                                                        .messages[index]
                                                        .createdAt,
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  5.pw,
                                                ],
                                              ),
                                            ],
                                          )
                                        : 0.ph,
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: (chatCubit.messages[index].direction ==
                                                "outbound"
                                            ? Colors.grey.shade200
                                            : ColorManager.primary),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 10),
                                      child: Text(
                                        chatCubit.messages[index].message,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              (chatCubit.messages[index].direction ==
                                                      "outbound"
                                                  ? ColorManager.black
                                                  : ColorManager.white),
                                        ),
                                      ),
                                    ),
                                    7.pw,
                                    chatCubit.messages[index].direction == "inbound"
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              20.ph,

                                              Text(
                                                chatCubit
                                                    .messages[index]
                                                    .createdAt,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          )
                                        : 0.pw,

                                    ////
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      :state is GetMessagesLoadingState? const Center(
                    child: CircularProgressIndicator(
                    ),
                  ): SizedBox(height: 1,);
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 5, top: 5),
              child: Container(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.grey.withOpacity(.2),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(

                        focusNode: FocusNode(),
                        controller:
                            context.read<ChatsCubit>().senMessageController,
                        decoration:  const InputDecoration(
                          fillColor: ColorManager.grey,
                          hintTextDirection:ui. TextDirection.rtl,
                          hintText: 'إرسال...',
                          hintStyle: TextStyle(color: Colors.grey ,),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (context
                            .read<ChatsCubit>()
                            .senMessageController
                            .text
                            .isNotEmpty) {
                          context.read<ChatsCubit>().sendMessage(MessageParameter(
                            recieverId: widget.recieverId,
                              message: context
                                  .read<ChatsCubit>()
                                  .senMessageController
                                  .text,
                              chatId: widget.chatId));
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 9),
                        child: Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
