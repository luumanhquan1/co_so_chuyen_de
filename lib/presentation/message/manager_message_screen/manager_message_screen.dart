import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/login/user_info.dart';
import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:ccvc_mobile/presentation/message/bloc/message_cubit.dart';
import 'package:ccvc_mobile/presentation/message/manager_message_screen/create_group_screen.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ManagerMessagerScreen extends StatefulWidget {
  final List<PeopleChat> peopleChats;
  final MessageCubit messageCubit;
  const ManagerMessagerScreen(
      {Key? key, required this.peopleChats, required this.messageCubit})
      : super(key: key);

  @override
  _ManagerMessagerScreenState createState() => _ManagerMessagerScreenState();
}

class _ManagerMessagerScreenState extends State<ManagerMessagerScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.peopleChats.length == 1) {
      widget.messageCubit.getListFriend();
    }
  }

  @override
  Widget build(BuildContext context) {
    final people = widget.peopleChats.first;
    return Scaffold(
      appBar: AppBarDefaultBack(''),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                imageUrl: people.avatarUrl,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              people.nameDisplay,
              style: textNormalCustom(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  cellButton(
                      icon: const Icon(Icons.group),
                      title: widget.peopleChats.length == 1
                          ? 'Tạo nhóm chat'
                          : 'Thành viên',
                      onTap: () {
                        showCupertinoModalBottomSheet(
                          context: context,
                          builder: (context) => CreateGroupScreen(
                            listFriend: widget.peopleChats.length == 1
                                ? widget.messageCubit.listFriend
                                : widget.peopleChats
                                    .map((e) => UserInfoModel(
                                        userId: e.userId,
                                        avatarUrl: e.avatarUrl,
                                        nameDisplay: e.nameDisplay,
                                        updateAt: 0,
                                        birthday: 0,
                                        gender: true,
                                        email: '',
                                        createAt: 0))
                                    .toList(),
                            cubit: widget.messageCubit,
                            title: title(),
                          ),
                        );
                        log('${widget.messageCubit.listFriend}');
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cellButton({
    required Widget icon,
    required String title,
    required Function() onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          SizedBox(width: 20, height: 20, child: icon),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: borderItemCalender))),
              child: Text(
                title,
                style: textNormal(Colors.black, 14),
              ),
            ),
          )
        ],
      ),
    );
  }

  String title() {
    return widget.peopleChats.length == 1 ? 'Nhóm mới' : 'Thành viên';
  }
}
