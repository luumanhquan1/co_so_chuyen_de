import 'package:ccvc_mobile/config/resources/images.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/theme_color.dart';
import 'package:ccvc_mobile/domain/model/post_model.dart';
import 'package:ccvc_mobile/widgets/app_image.dart';
import 'package:ccvc_mobile/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RefreshController refreshController = = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:,
      builder:(context, snapshot) => Scaffold(
        body: Column(
          children: [

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
                _buildPostItem(postModel: postModel)
                                  
                                  // controller.rxLoadedList.value ==
                                  //     LoadedType.start
                                  //     ? historyListSkeleton
                                  //     : controller.weightsList.value
                                  //     .map((e) => _buildWeightListTile(e))
                                  //     .toList()),
                            ])
                            ],
                          )
                      )
                    ]),
              )),
            ),
          ],
        )),
      )  ,
    );
  }

  Widget _buildPostItem({required PostModel postModel, }){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
color: ThemeColor.white
      ),
      child: Stack(
        children: [
          postModel.type != null && postModel.type ==1 ?SizedBox(): AppImage.network(path: postModel.data!, fit: BoxFit.scaleDown,),
          Positioned(
              top: 10,
              child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  child: AppImage.network(path: ''),
                ),
              ),
             // SizedBox(width: 12.sp,),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text('abcs', style: textNormal(ThemeColor.white, 12.sp),),
                    SizedBox(width: 12.sp,),
                    Text('2 hrs ago', style: textNormal(ThemeColor.iron, 14.sp),),
                  ],

                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(onPressed: (){}, icon: AppImage.asset(path: icOption, width: 18.sp, height: 18.sp,), ))
            ],
          )),
          Positioned(child: Row(
            children: [
              Expanded(child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: ThemeColor.iron
                ),
                child: Row(
                  children: [
                    AppImage.asset(path: icHeart, color: ThemeColor.white,),
                    SizedBox(width: 5.sp,),
                    Text('5.2K', style:textNormal(ThemeColor.white, 12.sp) ,)
                  ],
                ),
              )),
              Expanded(child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: ThemeColor.iron
                ),
                child: Row(
                  children: [
                    AppImage.asset(path: icMessage, color: ThemeColor.white,),
                    SizedBox(width: 5.sp,),
                    Text('5.2K', style:textNormal(ThemeColor.white, 12.sp) ,)
                  ],
                ),
              ))
            ],
          ))
        ],
      ),
    );
  }
}
