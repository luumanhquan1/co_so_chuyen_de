import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';

import '../../../config/resources/color.dart';
import '../../../config/resources/styles.dart';

class FriendCellWidget extends StatelessWidget {
  final String name;
  final String avatarUrl;
  const FriendCellWidget(
      {Key? key, required this.name, required this.avatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 62,
            width: 62,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.teal),
              child: CachedNetworkImage(
                imageUrl: avatarUrl,
                errorWidget: (context, url, error) =>
                    Image.asset(ImageAssets.avatarDefault),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            name,
            style: textNormal(colorBlack, 16),
          ),
         const Expanded(child: SizedBox()),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}
