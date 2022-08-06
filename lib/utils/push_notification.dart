import 'dart:convert';

import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:ccvc_mobile/presentation/message/manager_message_screen/people_group_message.dart';
import 'package:http/http.dart' as http;

class FCMModel {
  final String title;
  final String body;

  FCMModel(this.title, this.body);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['body'] = body;
    map['sound'] = 'tin_nhan.mp3';
    map['mutable_content'] = true;
    return map;
  }
}
class DataChat{
  final RoomChatModel? chatModel;
  final List<PeopleChat> peopleChat;
  final List<PeopleChat>? peopleGroupChat;
  final bool isRoomGroup;

  DataChat(this.chatModel, this.peopleChat, this.peopleGroupChat, this.isRoomGroup);

  Map<String,dynamic> toJson(){
    final map = <String,dynamic>{};
    map['chatModel'] = chatModel;
    map['peopleChat'] = peopleChat.map((e) => e.toJsonMessage()).toList();
    map['peopleGroupChat'] = peopleGroupChat?.map((e) => e.toJsonMessage()).toList();
    map['isRoomGroup'] = isRoomGroup;
    return map;
  }
 factory DataChat.fromJson(Map<String,dynamic> json){
    final peopleChat = <PeopleChat>[];
   if(json['peopleChat'] != null){
     json['peopleChat'].forEach((element) {
       final data = PeopleChat.fromJson(element);
       peopleChat.add(data);
     });
   }
    List<PeopleChat>? peopleChatGroup;
    if(json['peopleGroupChat'] != null){
      json['peopleGroupChat'].forEach((element) {
        final data = PeopleChat.fromJson(element);
        if(peopleChatGroup == null){
          peopleChatGroup = [data];
        }else {
          peopleChatGroup?.add(data);
        }
      });
    }
    bool isRoomGroup = json['isRoomGroup'] ?? false;
     RoomChatModel? chatModel;
    if(json['chatModel'] != null){
      chatModel = RoomChatModel.fromJson(json['chatModel']);
    }
    return DataChat(chatModel,
        peopleChat,
        peopleChatGroup,
      isRoomGroup,
    );
  }
}

class PushFCM {
  static const _tokenAdmin =
      'AAAAUezENSU:APA91bHDhQKUTRX9p5NjmGvyY7x4wgQxQ4ipxYyA3V0uF3cuq-0OvTxzJF1MbFwoy33g1G8O0ONL9_jJgqfSjHsfgQ6zgUfgEdVUHpYkdHi8Ph55s_pgOLWAvKOcOecUX-BMt9iZR4uQ';
  static Future<void> _pushNotification(
      String toFCM, String idRoomChat, FCMModel fcmModel,DataChat dataChat) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$_tokenAdmin'
    };
    final request =
        http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.body = json.encode({
      "to": toFCM,
      "notification": fcmModel.toJson(),
      'data': {'idRoomChat': idRoomChat,
      'data' : dataChat.toJson()
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static void pushNoti(
      List<String> token, String idRoomChat, FCMModel fcmModel,DataChat dataChat) {
    for (final element in token) {
      _pushNotification(element, idRoomChat, fcmModel,dataChat);
    }
  }
}