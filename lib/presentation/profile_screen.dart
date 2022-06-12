import 'dart:developer';

import 'package:ccvc_mobile/data/services/profile_service.dart';
import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:ccvc_mobile/presentation/message/message_screen.dart';
import 'package:ccvc_mobile/presentation/relationship_screen/relationship_screen.dart';
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
          onTap: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RelationshipScreen(userId: 'G50uaqIsy0QiZ9AgckORnl1ZHhl2',)));
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
