import 'dart:developer';

import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/clock_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/mequee_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'fake_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {

  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEEF3FF),
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/back.png'),
                    fit: BoxFit.fill)),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
               const HeaderWidget(),
                Column(
                  children: [

                  ],
                )
              ],
            ),
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -120),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/back_header.png'),
                      fit: BoxFit.fill)),
            ),
          ),
          Container(
            height: 166,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 16, right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20, color:const Color(0xff6566E9).withOpacity(0.1))
                ],),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: const BoxDecoration(
                      border:
                      Border(bottom: BorderSide(color: Color(0xffE2E8F0))),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Xin chào, ',
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Cao Tiến Dũng',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                         const SizedBox(
                            height: 4,
                          ),
                          Text('Chủ tịch UBND tỉnh')
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          const  ClockWidget(),
                            RichText(
                              text: TextSpan(
                                text: 'AQI: ',
                                style: DefaultTextStyle.of(context).style,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: "49 (Tốt)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Thứ 3, ngày 27 tháng 04 năm 2021",
                              style: TextStyle(
                                  color: Color(0xff3D5586),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "16 tháng 3 (Đ), Tân Sửu",
                              style: TextStyle(
                                  color:
                                  const Color(0xffA2AEBD).withOpacity(0.8)),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffFF9F43)),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Ngày hoàng đạo",
                                  style: TextStyle(
                                      color: const Color(0xffA2AEBD)
                                          .withOpacity(0.8)),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 65,
                color: Colors.transparent,
                margin: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Image.network(
                      'https://ccvc-uat.chinhquyendientu.vn/img/restricted.873d878b.gif',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: MequeeWidget(
                          spacing: 16,
                          child: List.generate(FakeData.tinhKhanCap.length,
                                  (index) {
                                return GestureDetector(
                                  onTap: () {
                                    log("${FakeData.tinhKhanCap[index]['linkOrContent']}");
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 6,
                                        width: 6,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffEB5757),
                                            shape: BoxShape.circle),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "${FakeData.tinhKhanCap[index]['title']}",
                                        style:const TextStyle(
                                            color: Color(0xffEB5757),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                );
                              })),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
