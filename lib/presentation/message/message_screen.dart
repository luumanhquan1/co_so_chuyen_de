import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/message/bloc/message_cubit.dart';
import 'package:ccvc_mobile/presentation/message/widgets/header_mess_widget.dart';
import 'package:ccvc_mobile/presentation/message/widgets/send_sms_widget.dart';
import 'package:ccvc_mobile/presentation/message/widgets/sms_cell.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  MessageCubit cubit = MessageCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
           HeaderMessWidget(),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: List.generate(cubit.listFakeData.length, (index) {
                    final result = cubit.listFakeData[index];
                    return SmsCell(smsModel: result);
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SendSmsWidget(hintText: 'Write a message...',sendTap: (){

              },),
            )
          ],
        ),
      ),

    );
  }
}
