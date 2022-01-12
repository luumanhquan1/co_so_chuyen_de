
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/day_time_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/info_user_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/mequee_widget.dart';

import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';

class HeaderTabletWidget extends StatelessWidget {
  const HeaderTabletWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      width: double.infinity,
      color: Colors.transparent,
      child: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -104),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.imgHeaderTablet),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.symmetric(vertical: 28),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff6566E9).withOpacity(0.1),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Color(0xffE2E8F0)),
                      ),
                    ),
                    child: const InfoUserWidget(),
                  ),
                ),
                const Expanded(
                  child: DayTimeWidget(),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: 30,
            right: 0,
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: const MarqueeWidget(),
            ),
          )
        ],
      ),
    );
  }
}
