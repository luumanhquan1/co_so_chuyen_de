import 'dart:developer';

import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:ccvc_mobile/presentation/message/message_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel id;
  const ProfileScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MessageScreen(
                  peopleChat: PeopleChat(
                      userId: widget.id.userId ?? '',
                      bietDanh: '',
                      nameDisplay: widget.id.nameDisplay ?? '',
                      avatarUrl: widget.id.avatarUrl ?? ''),
                ),
              ),
            );
          },
          child: Container(
            height: 50,
            width: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
