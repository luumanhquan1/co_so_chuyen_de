import 'package:ccvc_mobile/config/themes/theme_color.dart';
import 'package:ccvc_mobile/domain/model/post_model.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/post/ui/post_screen.dart';
import 'package:ccvc_mobile/presentation/profile/ui/profile_screen.dart';
import 'package:ccvc_mobile/widgets/post_item/post_item.dart';
import 'package:ccvc_mobile/widgets/post_item/post_item_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostWidget extends StatefulWidget {
  final HomeCubit homeCubit;
  final String id;
  const PostWidget({Key? key, required this.homeCubit, required this.id})
      : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostModel>(
      stream: widget.homeCubit.postList(widget.id),
      builder: (BuildContext context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return SizedBox();
        }
        return Container(
          margin: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 24.sp),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: ThemeColor.gray77,
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(20), color: ThemeColor.white),
          child: PostCard(
            postModel: data,
            userId: data.author?.userId ?? '',
            onTapName: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        ProfileScreen(userId: data.author?.userId ?? ''))),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PostScreen(
                  postId: data.postId ?? '',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
