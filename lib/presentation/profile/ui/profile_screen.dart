import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/images.dart';
import 'package:ccvc_mobile/config/resources/strings.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/theme_color.dart';
import 'package:ccvc_mobile/domain/model/post_model.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:ccvc_mobile/presentation/post/ui/post_screen.dart';
import 'package:ccvc_mobile/presentation/profile/bloc/profile_cubit.dart';
import 'package:ccvc_mobile/utils/app_utils.dart';
import 'package:ccvc_mobile/widgets/app_image.dart';
import 'package:ccvc_mobile/widgets/post_item/post_item.dart';
import 'package:ccvc_mobile/widgets/post_item/post_item_skeleton.dart';
import 'package:ccvc_mobile/widgets/refresh_widget.dart';
import 'package:ccvc_mobile/widgets/views/state_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, required this.userId}) : super(key: key);
  String userId;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  ProfileCubit _profileCubit = ProfileCubit();
  RelationshipType relationshipType = RelationshipType.stranger;

  @override
  void initState() {
    _profileCubit.getUserInfo(widget.userId);
    _profileCubit.getAllPosts(widget.userId);
    _profileCubit.getRelationship(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StateLayout>(
      stream: _profileCubit.stateStream,
      builder: (context, snapshot) => SafeArea(
          child:
              // Transform.translate(
              //   offset: const Offset(0, 40),
              //   child: AppImage.asset(path: bgProfile),
              // ),
              StreamBuilder<UserModel>(
                  stream: _profileCubit.user,
                  builder: (context, user) => Scaffold(
                        //  backgroundColor: Colors.white,
                        appBar: AppBar(
                          //backgroundColor: Color(0xFF339999),
                          elevation: 0,
                          leading: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              )),
                          automaticallyImplyLeading: true,
                          title: Text(user.data?.nameDisplay ?? '',
                              style: titleAppbar(
                                  color: ThemeColor.black, fontSize: 20.sp)),
                        ),
                        body: Stack(children: [
                          Positioned(
                              top: 0, child: AppImage.asset(path: bgProfile)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 24.sp),
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.max,
                              //     children: [
                              //       Text(Strings.app_name,
                              //           style: titleAppbar(color: ThemeColor.black)),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 27.sp,
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 24.sp),
                              //   child: Text(Strings.feed,
                              //       style: heading2(color: ThemeColor.black)),
                              // ),
                              // SizedBox(
                              //   height: 27.sp,
                              // ),
                              // StreamBuilder(
                              //   stream: _profileCubit.posts,
                              //   builder: (context, snapshot) =>

                              Expanded(
                                  child: RefreshWidget(
                                      // enableLoadMore: controller.canLoadMore.value,
                                      //  onLoadMore: () async {
                                      //    double oldPosition =
                                      //        controller.scrollController.position.pixels;
                                      //    await controller.getWeights();
                                      //    controller.scrollController.position.jumpTo(oldPosition);
                                      //  },
                                      controller: refreshController,
                                      onRefresh: () async {
                                        await _profileCubit
                                            .getAllPosts(widget.userId);
                                        refreshController.refreshCompleted();
                                      },
                                      child: snapshot.data == null
                                          ? SizedBox()
                                          : _buildBody(
                                              snapshot.data!, user.data!))),
                              //  )
                            ],

                            //   )),
                          ),
                        ]),
                      ))),
    );
  }

  Widget _buildBody(StateLayout state, UserModel userModel) {
    //ProfileCubit _profileCubit = ProfileCubit(widget.userId);
    if (state == StateLayout.showLoading) {
      return CustomScrollView(
          //   controller: controller.scrollController,
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate(
              [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  _loadingPost(),
                  _loadingPost(),
                  _loadingPost(),
                  _loadingPost(),
                  _loadingPost(),
                ])
              ],
            ))
          ]);
    }
    if (state == StateLayout.showContent) {
      return SingleChildScrollView(
          child: StreamBuilder<RelationshipType>(
              stream: _profileCubit.relationshipType,
              builder: (context, type) {
                log(relationshipType.toString());
                return StreamBuilder<List<PostModel>>(
                    stream: _profileCubit.posts,
                    builder: (context, snapshot) => snapshot.data == null
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                SizedBox(
                                  height: 66.sp,
                                ),
                                Center(
                                  child: _buildAvatar(
                                      avatarUrl: userModel.avatarUrl),
                                ),
                                SizedBox(
                                  height: 16.sp,
                                ),
                                Center(
                                    child: Text(userModel.nameDisplay ?? '',
                                        style:
                                            heading2(color: ThemeColor.black))),
                                SizedBox(
                                  height: 16.sp,
                                ),

                                Visibility(
                                  visible:
                                      !(type.data! == RelationshipType.owner),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.sp, vertical: 12.sp),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          width: 16.sp,
                                        ),
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              EdgeInsets.only(right: 16.sp),
                                          child:
                                              getRelationshipButton(type.data!),
                                        )),
                                        SizedBox(
                                          width: 16.sp,
                                        ),
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              EdgeInsets.only(right: 16.sp),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: colorPrimary,
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: Center(
                                                  child: Text('Nhắn tin',
                                                      style: button(
                                                          color: Colors.white)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: ListView.builder(
                                //       shrinkWrap: true,
                                //       physics: NeverScrollableScrollPhysics(),
                                //       itemCount: snapshot.data!.length,
                                //       itemBuilder: (context, index) => Container(
                                //             margin: EdgeInsets.symmetric(
                                //                 vertical: 16.sp,
                                //                 horizontal: 24.sp),
                                //             decoration: BoxDecoration(
                                //                 boxShadow: [
                                //                   BoxShadow(
                                //                     color: ThemeColor.gray77,
                                //                     spreadRadius: 0,
                                //                     blurRadius: 5,
                                //                     offset: Offset(0,
                                //                         3), // changes position of shadow
                                //                   ),
                                //                 ],
                                //                 borderRadius:
                                //                     BorderRadius.circular(20),
                                //                 color: ThemeColor.white),
                                //             child: PostCard(
                                //               postModel: snapshot.data![index],
                                //               userId: userModel
                                //                       .userId ??
                                //                   '',
                                //               onTap: () => Navigator.push(
                                //                   context,
                                //                   MaterialPageRoute(
                                //                       builder: (_) => PostScreen(
                                //                             postId: snapshot
                                //                                     .data?[index]
                                //                                     .postId ??
                                //                                 '',
                                //                           ))),
                                //             ),
                                //           )),
                                // )

                                //]
                                Column(
                                  children: (snapshot.data! as List)
                                      .map((e) => Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 16.sp,
                                                horizontal: 24.sp),
                                            decoration: BoxDecoration(
                                                //     boxShadow: [
                                                //   BoxShadow(
                                                //     color: ThemeColor.gray77,
                                                //     spreadRadius: 0,
                                                //     blurRadius: 5,
                                                //     offset: Offset(0, 3), // changes position of shadow
                                                //   ),
                                                // ],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: ThemeColor.white),
                                            child: PostCard(
                                              postModel: e,
                                              userId: userModel.userId ?? '',
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          PostScreen(
                                                            postId: e.postId,
                                                          ))),
                                            ),
                                          ))
                                      .toList(),
                                )
                              ]));
              }));
    }
    if (state == StateLayout.showError) {
      return Center(
        child: Text('Đã xảy ra lỗi. Vui lòng thử lại sau'),
      );
    }

    return SizedBox();
  }

  Widget _buildAvatar({String? avatarUrl}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(160),
      child: Container(
        height: 80.sp,
        width: 80.sp,
        decoration: BoxDecoration(
          //   shape: BoxShape.circle,
          color: ThemeColor.paleGrey,
        ),
        child: avatarUrl == null || avatarUrl.isEmpty
            ? SizedBox()
            : AppImage.network(
                path: avatarUrl,
                //'https://img.freepik.com/free-vector/vector-set-two-different-dog-breeds-dog-illustration-flat-style_619130-447.jpg?w=1480',

                height: 80.sp,
                width: 80.sp,
              ),
      ),
    );
  }

  Widget _loadingPost() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 24.sp),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ThemeColor.gray77,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(20), color: ThemeColor.white),
        child: PostItemSkeleton());
  }

  Widget getRelationshipButton(RelationshipType type) {
    //
    // switch (type) {
    //   case RelationshipType.stranger:
    //     return Expanded(
    //       child: Padding(
    //         padding: EdgeInsets.only(right: 16.sp),
    //         child: GestureDetector(
    //           onTap: () => _profileCubit.sendFriendRequest(),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: colorPrimaryTransparent,
    //               borderRadius: BorderRadius.circular(35),
    //             ),
    //             child: Padding(
    //               padding: EdgeInsets.only(top: 8.0, bottom: 8),
    //               child: Center(
    //                 child:
    //                 Text('Kết bạn', style: button(color: Colors.white)),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //
    //   case RelationshipType.requestSender:
    //     return Expanded(child: Padding(
    //       padding: EdgeInsets.only(right: 16.sp),
    //       child: GestureDetector(
    //         onTap: () => _profileCubit.cancelOrDeclineFriendRequest(),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             color: colorPrimaryTransparent,
    //             borderRadius: BorderRadius.circular(35),
    //           ),
    //           child: Padding(
    //             padding: EdgeInsets.only(top: 8.0, bottom: 8),
    //             child: Center(
    //               child: Text('Hủy kết bạn',
    //                   style: button(color: Colors.white)),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ));
    //   case RelationshipType.requestReceiver:
    //     return Row(children: [
    //       Expanded(
    //
    //         child: Padding(
    //           padding: EdgeInsets.only(right: 16.sp),
    //           child: GestureDetector(
    //             onTap: () => _profileCubit.acceptFriendRequest(),
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 color: colorPrimaryTransparent,
    //                 borderRadius: BorderRadius.circular(35),
    //               ),
    //               child: Padding(
    //                 padding: EdgeInsets.only(top: 8.0, bottom: 8),
    //                 child: Center(
    //                   child: Text('Đồng ý kết bạn',
    //                       softWrap: true,
    //                       style: button(color: Colors.white)),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: Padding(
    //           padding: EdgeInsets.only(right: 16.sp),
    //           child: GestureDetector(
    //             onTap: () => _profileCubit.cancelOrDeclineFriendRequest(),
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 color: colorPrimaryTransparent,
    //                 borderRadius: BorderRadius.circular(35),
    //               ),
    //               child: Padding(
    //                 padding: EdgeInsets.only(top: 8.0, bottom: 8),
    //                 child: Center(
    //                   child: Text('Từ chối kết bạn',
    //                       softWrap: true,
    //                       style: button(color: Colors.white)),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       )
    //     ],);
    //
    //
    //   case RelationshipType.friend:
    return GestureDetector(
      onTap: () => showFriendBottomSheet(context),
      child: Container(
        decoration: BoxDecoration(
          color: colorPrimaryTransparent,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8),
          child: Center(
            child: Text('Bạn bè', style: button(color: Colors.white)),
          ),
        ),
      ),
    );
    //  }
    // return GestureDetector(
    //   onTap: () => _profileCubit.sendFriendRequest(),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: colorPrimaryTransparent,
    //       borderRadius: BorderRadius.circular(35),
    //     ),
    //     child: Padding(
    //       padding: EdgeInsets.only(top: 8.0, bottom: 8),
    //       child: Center(
    //         child: Text('Kết bạn', style: button(color: Colors.white)),
    //       ),
    //     ),
    //   ),
    // );
  }

  void showFriendBottomSheet(BuildContext context) =>
      showModalBottomSheet<void>(
        //  isDismissible: false,
          context: context,
          builder: (BuildContext bottomContext) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // SizedBox(height: 8.sp,),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: IconButton(
                  //       onPressed: () => Navigator.pop(context),
                  //       icon: Icon(Icons.close)),
                  // ),
                  GestureDetector(
                    onTap: () async {
                      final result = await showOkCancelAlertDialog(
                        context: context,
                        title: 'Hủy kết bạn',
                        message: 'Bạn có chắc chắn muốn hủy kết bạn?',
                        okLabel: 'Ok',
                        cancelLabel: 'Hủy',
                        fullyCapitalizedForMaterial: false,
                      );
                      log(result.name.toString());

                      if (result.name == 'ok') {
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 16.sp, top: 16.sp, right: 16.sp, bottom: 8.sp),
                      decoration: BoxDecoration(
                        color: colorPrimaryTransparent,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Center(
                          child: Text('Hủy kết bạn',
                              style: button(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final result = await showOkCancelAlertDialog(
                        context: context,
                        title: 'Chặn',
                        message: 'Bạn có chắc chắn muốn chặn người này?',
                        okLabel: 'Ok',
                        cancelLabel: 'Hủy',
                        fullyCapitalizedForMaterial: false,
                      );
                      log(result.name.toString());

                      if (result.name == 'ok') {
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 16.sp, top: 16.sp, right: 16.sp, bottom: 24.sp),
                      decoration: BoxDecoration(
                        color: colorPrimaryTransparent,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Center(
                          child:
                              Text('Chặn', style: button(color: Colors.white)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
}
