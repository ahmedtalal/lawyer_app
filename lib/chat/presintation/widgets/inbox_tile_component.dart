import 'package:flutter/material.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/ui_responsive/sized_box.dart';
import 'package:intl/intl.dart';


class InboxTileComponent extends StatelessWidget {
  final String userName;
  final String lastMessage;
  final String createdAt;
  final String avatarUrl;
  final int unreadMessageCount;
  final int isSeen;
  const InboxTileComponent(
      {Key? key,
      required this.userName,
      required this.lastMessage,
      required this.createdAt,
        required this.avatarUrl,
        required this.unreadMessageCount,
      required this.isSeen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      leading: Container(
        width: 50.0,
        height: 55.0,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                avatarUrl),
          ),
        ),
      ),
      title: Text(
        userName,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ColorManager.primary, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        lastMessage,
        style: TextStyle(
            fontWeight: isSeen != 1 ? FontWeight.bold : FontWeight.w400,
            color: isSeen != 1 ? ColorManager.black : ColorManager.grey),
        maxLines: 2,
      ),
      trailing: Column(
        children: [
          Text(createdAt),
          unreadMessageCount != 0
              ? CircleAvatar(
                  radius: 12,
                  backgroundColor: ColorManager.secondary,
                  child: Text(
                    unreadMessageCount.toString(),
                    style: const TextStyle(color: ColorManager.white),
                  ),
                )
              : 0.ph,
        ],
      ),
    );
  }
}
