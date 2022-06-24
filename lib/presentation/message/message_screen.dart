import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/services/message_service.dart';
import 'package:ccvc_mobile/domain/model/message_model/message_sms_model.dart';
import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:ccvc_mobile/presentation/message/bloc/message_cubit.dart';
import 'package:ccvc_mobile/presentation/message/widgets/header_mess_widget.dart';
import 'package:ccvc_mobile/presentation/message/widgets/send_sms_widget.dart';
import 'package:ccvc_mobile/presentation/message/widgets/sms_cell.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final RoomChatModel? chatModel;
  final PeopleChat peopleChat;
  const MessageScreen({Key? key, this.chatModel, required this.peopleChat})
      : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  MessageCubit cubit = MessageCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getRoomChat(widget.peopleChat.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            HeaderMessWidget(
              peopleChat: widget.peopleChat,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: StreamBuilder<List<MessageSmsModel>>(
                    stream: cubit.chatStream(widget.chatModel?.roomId ?? ''),
                    builder: (context, snapshot) {
                      final data = snapshot.data ?? <MessageSmsModel>[];
                      return Column(
                        children: List.generate(data.length, (index) {
                          final result = data[index];
                          return SmsCell(smsModel: result);
                        }),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SendSmsWidget(
                hintText: 'Soạn tin nhắn...',
                sendTap: (value) {
                  cubit.sendSms(widget.chatModel?.roomId ?? '', value);
                },
                onSendFile: (value) {
                  cubit.sendImage(widget.chatModel?.roomId ?? '', value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
