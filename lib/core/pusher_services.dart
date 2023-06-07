import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../chat/presintation/controller/chats_cubit.dart';


PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
void pusherConnect(BuildContext context) async {
  try {
    await pusher.init(
      apiKey: "06ef1544705f59e5dd7f",
      cluster: "mt1",
      onConnectionStateChange: onConnectionStateChange,
      onError: onError,
      onSubscriptionSucceeded: onSubscriptionSucceeded,
      onEvent: context.read<ChatsCubit>().onEvent,
      onSubscriptionError: onSubscriptionError,
      onDecryptionFailure: onDecryptionFailure,
      onMemberAdded: onMemberAdded,
      onMemberRemoved: onMemberRemoved,
      onSubscriptionCount: onSubscriptionCount,
      // authEndpoint: "<Your Authendpoint Url>",
      // onAuthorizer: onAuthorizer
    );
    await pusher.subscribe(channelName: "message");
    await pusher.connect();
  } catch (e) {
    log("ERROR: $e");
  }
}

void onConnectionStateChange(dynamic currentState, dynamic previousState) {
  log("Connection: $currentState");
}

void onError(String message, int? code, dynamic e) {
  log("onError: $message code: $code exception: $e");
}

void onSubscriptionSucceeded(String channelName, dynamic data) {
  log("onSubscriptionSucceeded: $channelName data: $data");
  final me = pusher.getChannel(channelName)?.me;
  log("Me: $me");
}

void onSubscriptionError(String message, dynamic e) {
  log("onSubscriptionError: $message Exception: $e");
}

void onDecryptionFailure(String event, String reason) {
  log("onDecryptionFailure: $event reason: $reason");
}

// void onEvent(PusherEvent event) {
//   log("onEvent: $event");
// }

void onMemberAdded(String channelName, PusherMember member) {
  log("onMemberAdded: $channelName user: $member");
}

void onMemberRemoved(String channelName, PusherMember member) {
  log("onMemberRemoved: $channelName user: $member");
}

void onSubscriptionCount(String channelName, int subscriptionCount) {
  log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
}

// dynamic onAuthorizer(String channelName, String socketId, dynamic options) {
//   return {
//     "auth": "foo:bar",
//     "channel_data": '{"user_id": 1}',
//     "shared_secret": "foobar"
//   };
// }
