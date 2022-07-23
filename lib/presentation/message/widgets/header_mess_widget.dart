import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/image_asset.dart';

class HeaderMessWidget extends StatelessWidget {
  final List<PeopleChat> peopleChat;
  const HeaderMessWidget({Key? key, required this.peopleChat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: const BoxDecoration(
          color: Color(0xffE1F6F4),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(34),
              bottomRight: Radius.circular(34))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              avatar(),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          title(),
                          style: textNormal(colorBlack, 20),
                          maxLines: 2,
                          
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Text(
                        'Online',
                        style: textNormal(greyHide, 12),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget avatar() {
    return peopleChat.length == 1
        ? Container(
            height: 62,
            width: 62,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all()),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.teal),
              child: CachedNetworkImage(
                imageUrl: peopleChat.first.avatarUrl,
                errorWidget: (context, url, error) =>  SvgPicture.asset(ImageAssets.avatarDefault),
                fit: BoxFit.cover,
              ),
            ),
          )
        : avatarGroup();
  }

  Widget avatarGroup() {
    Widget avatar(String url, double size) {
      return Container(
        height: size,
        width: size,
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all()),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.teal),
          child: CachedNetworkImage(
            imageUrl: url,
            errorWidget: (context, url, error) =>
                SvgPicture.asset(ImageAssets.avatarDefault),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return peopleChat.length < 2? const SizedBox(): Container(
      width: 62,
      height: 62,
      child: Stack(
        children: [
          avatar(peopleChat.first.avatarUrl, 50),
          Positioned(
            top: 0,
            right: 0,
            child: avatar(peopleChat.last.avatarUrl, 40),
          )
        ],
      ),
    );
  }

  String title() {
    return peopleChat.map((e) => e.nameDisplay).join(',');
  }
}
