import 'dart:ui';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'hot_new.dart';
import 'item_list_new.dart';
import 'item_table_topic.dart';
import 'item_infomation.dart';

class TatCaChuDeScreen extends StatelessWidget {
  const TatCaChuDeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 2.3,
                    children: const [
                      ItemInfomation(ImageAssets.icTongTin, textColorTongTin,
                          'Tổng tin', '2032'),
                      ItemInfomation(ImageAssets.icBaoChi, textColorBaoChi,
                          'Báo chí', '2032'),
                      ItemInfomation(ImageAssets.icMangXaHoi,
                          textColorMangXaHoi, 'Mạng xã hội', '2032'),
                      ItemInfomation(
                          ImageAssets.icForum, textColorForum, 'Forum', '2032'),
                      ItemInfomation(
                          ImageAssets.icBlog, textColorBlog, 'Blog', '2032'),
                      ItemInfomation(ImageAssets.icNguonKhac,
                          textColorNguonKhac, 'Nguồn khác', '2032'),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        ItemTableTopic('Tin tổng hợp', '11295'),
                        ItemTableTopic("Các địa phoning", '11295'),
                        ItemTableTopic('Uỷ ban nhân dân tỉnh', '11295'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Tin nổi bật",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF3D5586)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const HotNews(
                      'https://recmiennam.com/wp-content/uploads/2018/01/phong-canh-thien-nhien-dep-1.jpg',
                      'abc aosfn abscissas oans',
                      'ascmascas',
                      'nascoanao'),
                  ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const ItemListNews(
                            'https://phunugioi.com/wp-content/uploads/2020/01/anh-avatar-supreme-dep-lam-dai-dien-facebook.jpg',
                            'Nguyen Dang Hung',
                            "Essa");
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
