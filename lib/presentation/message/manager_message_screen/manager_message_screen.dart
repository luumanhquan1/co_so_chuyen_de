import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:ccvc_mobile/presentation/message/bloc/message_cubit.dart';
import 'package:ccvc_mobile/presentation/message/manager_message_screen/create_group_screen.dart';
import 'package:ccvc_mobile/presentation/message/manager_message_screen/people_group_message.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ManagerMessagerScreen extends StatefulWidget {
  final List<PeopleChat> peopleChats;
  final MessageCubit messageCubit;
  final bool isGroup;
  const ManagerMessagerScreen(
      {Key? key,
      required this.peopleChats,
      required this.messageCubit,
      required this.isGroup})
      : super(key: key);

  @override
  _ManagerMessagerScreenState createState() => _ManagerMessagerScreenState();
}

class _ManagerMessagerScreenState extends State<ManagerMessagerScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final people = widget.peopleChats.first;
    return Scaffold(
      appBar: AppBarDefaultBack(''),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            widget.peopleChats.isNotEmpty ? avatar() : SizedBox(),
            const SizedBox(
              height: 16,
            ),
            Text(
              titleGroup(),
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
                      title: !widget.isGroup ? 'Tạo nhóm chat' : 'Thành viên',
                      onTap: () {
                        showCupertinoModalBottomSheet(
                          context: context,
                          builder: (context) => screen(),
                        ).whenComplete(() {
                          setState(() {});
                        });
                      }),
                  widget.isGroup
                      ? cellButton(
                          icon: const Icon(Icons.exit_to_app),
                          title: 'Rời nhóm chat',
                          onTap: () {})
                      : SizedBox.shrink(),
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
    return !widget.isGroup ? 'Nhóm mới' : 'Thành viên';
  }

  Widget avatar() {
    Widget avatarWidget(String url) {
      return Container(
        width: 100,
        height: 100,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.circle,
        ),
        child: CachedNetworkImage(
          imageUrl: url,
          errorWidget: (context, url, error) =>
              SvgPicture.asset(ImageAssets.avatarDefault),
          fit: BoxFit.cover,
        ),
      );
    }

    return widget.peopleChats.length == 1
        ? avatarWidget(widget.peopleChats.first.avatarUrl)
        : Stack(
            children: List.generate(
                widget.peopleChats.length > 2 ? 2 : widget.peopleChats.length,
                (index) {
              final data = widget.peopleChats[index];
              return Padding(
                padding: EdgeInsets.only(left: 40.0 * index),
                child: avatarWidget(data.avatarUrl),
              );
            }),
          );
  }

  String titleGroup() {
    return widget.peopleChats.map((e) => e.nameDisplay).join(',');
  }

  Widget screen() {
    if (!widget.isGroup) {
      return CreateGroupScreen(
        listFriend: widget.messageCubit.listFriend,
        cubit: widget.messageCubit,
        title: title(),
      );
    }
    return PeopleGroupScreen(
      listFriend: widget.peopleChats
          .map(
            (e) => UserModel(
              userId: e.userId,
              avatarUrl: e.avatarUrl,
              nameDisplay: e.nameDisplay,
              updateAt: 0,
              birthday: 0,
              gender: true,
              email: '',
              createAt: 0,
            ),
          )
          .toList(),
      cubit: widget.messageCubit,
      title: title(),
    );
  }
}
