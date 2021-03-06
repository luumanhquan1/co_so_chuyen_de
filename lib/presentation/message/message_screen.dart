import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/message_model/message_sms_model.dart';
import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:ccvc_mobile/presentation/message/bloc/message_cubit.dart';
import 'package:ccvc_mobile/presentation/message/manager_message_screen/manager_message_screen.dart';
import 'package:ccvc_mobile/presentation/message/widgets/header_mess_widget.dart';
import 'package:ccvc_mobile/presentation/message/widgets/send_sms_widget.dart';
import 'package:ccvc_mobile/presentation/message/widgets/sms_cell.dart';
import 'package:flutter/material.dart';

import '../../widgets/views/state_stream_layout.dart';

class MessageScreen extends StatefulWidget {
  final RoomChatModel? chatModel;
  final List<PeopleChat> peopleChat;
  final List<PeopleChat>? peopleGroupChat;
  const MessageScreen({
    Key? key,
    this.chatModel,
    required this.peopleChat,
    this.peopleGroupChat,
  }) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  MessageCubit cubit = MessageCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.chatModel != null) {
      cubit.initDate(widget.chatModel?.roomId ?? '', widget.peopleChat);
    } else {
      cubit.peopleChat = widget.peopleChat;
      cubit.getRoomChat(widget.peopleChat.first.userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StateStreamLayout(
      retry: () {},
      error: AppException('', ''),
      stream: cubit.stateStream,
      textEmpty: '',
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManagerMessagerScreen(
                        peopleChats:
                            widget.peopleGroupChat ?? [...widget.peopleChat],
                        messageCubit: cubit,
                      ),
                    ),
                  );
                },
                child: HeaderMessWidget(
                  peopleChat: widget.peopleChat,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              StreamBuilder<String>(
                stream: cubit.roomChat,
                builder: (context, snapshot) {
                  final id = snapshot.data ?? '';
                  return Expanded(
                    child: SingleChildScrollView(
                      reverse: true,
                      child: StreamBuilder<List<MessageSmsModel>>(
                          stream: cubit.chatStream(id),
                          builder: (context, snapshot) {
                            final data = snapshot.data ?? <MessageSmsModel>[];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: List.generate(data.length, (index) {
                                final result = data[index];
                                PeopleChat? peopleSender;
                                if (widget.peopleGroupChat != null) {
                                  final peopleGruop = widget.peopleGroupChat!
                                      .where((element) =>
                                          element.userId == result.senderId);
                                  if (peopleGruop.isNotEmpty) {
                                    peopleSender = peopleGruop.first;
                                  }
                                } else {
                                  peopleSender = widget.peopleChat.first;
                                }
                                return SmsCell(
                                  smsModel: result,
                                  peopleChat: peopleSender,
                                );
                              }),
                            );
                          }),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SendSmsWidget(
                  hintText: 'So???n tin nh???n...',
                  sendTap: (value) {
                    cubit.sendSms(value);
                  },
                  onSendFile: (value) {
                    cubit.sendImage(value);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
