import 'package:ccvc_mobile/config/resources/images.dart';
import 'package:ccvc_mobile/config/resources/strings.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/theme_color.dart';
import 'package:ccvc_mobile/domain/model/post_model.dart';
import 'package:ccvc_mobile/widgets/app_image.dart';
import 'package:ccvc_mobile/widgets/refresh_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return
        // StreamBuilder(
        // stream:,
        // builder:(context, snapshot) =>
        SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(Strings.app_name,
                        style: titleAppbar(color: ThemeColor.black)),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: AppImage.asset(
                              path: icNoti,
                              height: 16.sp,
                              width: 16.sp,
                            )))
                  ],
                ),
              ),
              SizedBox(
                height: 27.sp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Text(Strings.feed, style: heading2(color: ThemeColor.black)),
              ),
              SizedBox(
                height: 27.sp,
              ),
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
                //       onRefresh: controller.onRefresh,
                child: CustomScrollView(
                    //   controller: controller.scrollController,
                    slivers: [
                      SliverList(
                          delegate: SliverChildListDelegate(
                        [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildPostItem(),
                                _buildPostItem(),
                                _buildPostItem(),
                                _buildPostItem(),

                                // controller.rxLoadedList.value ==
                                //     LoadedType.start
                                //     ? historyListSkeleton
                                //     : controller.weightsList.value
                                //     .map((e) => _buildWeightListTile(e))
                                //     .toList()),
                              ])
                        ],
                      ))
                    ]),
              )),
            ]),

        //   )),
        // )  ,
      ),
    );
  }

  Widget _buildPostItem(
      //{
      //  required PostModel postModel,
      //}
      ) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 16.sp, horizontal: 24.sp),
      child: Container(
        // height: 200,
        // width: 200,
        //margin: EdgeInsets.symmetric(vertical: 8.sp),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ThemeColor.gray77,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(20), color: ThemeColor.white),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 40.sp,
                    width: 40.sp,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: AppImage.network(
                      path:
                          //postModel.author?.avatarUrl ?? ''
                          'https://img.freepik.com/free-vector/vector-set-two-different-dog-breeds-dog-illustration-flat-style_619130-447.jpg?w=1480',
                      height: 40.sp,
                      width: 40.sp,
                    ),
                  ),
                ),
                // SizedBox(width: 12.sp,),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'abcs',
                        style: caption(color: ThemeColor.black),
                      ),
                      SizedBox(
                        width: 12.sp,
                      ),
                      Text(
                        '2 hrs ago',
                        style: caption(color: ThemeColor.black),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: AppImage.asset(
                        path: icOption,
                        width: 18.sp,
                        height: 18.sp,
                        color: ThemeColor.grey,
                      ),
                    ))
              ],
            ),

            //postModel.type != null && postModel.type ==1 ?SizedBox():
            AppImage.network(
              path:
                  'https://img.freepik.com/free-vector/vector-set-two-different-dog-breeds-dog-illustration-flat-style_619130-447.jpg?w=1480'
              // postModel.imageUrl!

              ,
              height: 200,
              width: 200,
              fit: BoxFit.scaleDown,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 33.sp, vertical: 15.sp),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(right: 8.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: ThemeColor.paleGrey),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 6.sp),
                        child: Row(
                          children: [
                            AppImage.asset(
                              path: icHeart,
                              color: ThemeColor.grey,
                              width: 20.sp,
                              height: 20.sp,
                            ),
                            SizedBox(
                              width: 11.sp,
                            ),
                            Text(
                              '5.2K',
                              style: textNormal(ThemeColor.grey, 12.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(right: 8.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: ThemeColor.paleGrey),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 6.sp),
                        child: Row(
                          children: [
                            AppImage.asset(
                              path: icMessage,
                              color: ThemeColor.grey,
                              width: 20.sp,
                              height: 20.sp,
                            ),
                            SizedBox(
                              width: 5.sp,
                            ),
                            Text(
                              '5.2K',
                              style: textNormal(ThemeColor.grey, 12.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
