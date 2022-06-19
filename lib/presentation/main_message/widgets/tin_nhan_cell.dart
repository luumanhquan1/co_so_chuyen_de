import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/message_model/room_chat_model.dart';
import 'package:flutter/material.dart';

class TinNhanCell extends StatelessWidget {
  final PeopleChat peopleChat;
  const TinNhanCell({Key? key,required this.peopleChat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = peopleChat;
    return Container(
      height: 103,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Row(
        children: [
          Container(
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
                imageUrl:
                data.avatarUrl,
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.nameDisplay,
                    style: textNormal(colorBlack, 12),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Expanded(
                      child: Text(
                    'Amir said we’d be staying over for a while wekewp o pwekpor kơpep kwp ewkpwrkpo kepwk pewo kweopr wkpo kw',
                    style: textNormal(greyHide, 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
