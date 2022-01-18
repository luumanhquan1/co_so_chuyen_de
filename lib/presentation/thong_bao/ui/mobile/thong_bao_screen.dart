import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/thong_bao/thong_bao_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/thong_bao/bloc/thong_bao_cubit.dart';
import 'package:ccvc_mobile/presentation/thong_bao/ui/widget/item_thong_bao_mobile.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/mobile/base_app_bar_mobile.dart';
import 'package:ccvc_mobile/widgets/button_switch/flutter_switch_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';

class ThongBaoScreen extends StatefulWidget {
  const ThongBaoScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ThongBaoScreenState createState() => _ThongBaoScreenState();
}

class _ThongBaoScreenState extends State<ThongBaoScreen> {
  final ThongBaoCubit thongBaoCubit = ThongBaoCubit();

  @override
  void initState() {
    super.initState();
    thongBaoCubit.getThongBao();
  }

  @override
  Widget build(BuildContext context) {
    return ThongBaoInherted(
      thongBaoCubit: thongBaoCubit,
      child: Scaffold(
        appBar: BaseAppBarMobile(
          title: S.current.thong_bao,
          leadingIcon: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: unselectLabelColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<List<ThongBaoModel>>(
                  stream: thongBaoCubit.thongBaoStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }

                    final data = snapshot.data ?? [];

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ItemThongBaoMobile(
                          image: data[index].image,
                          title: data[index].title,
                          content: data[index].content,
                          time: data[index].time,
                          status: data[index].status,
                          typeNotify: data[index].typeNotify,
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 26.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.current.thong_bao_khan,
                      style: textNormalCustom(
                        color: titleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    customSwitch(
                      onToggle: (value) {
                        thongBaoCubit.isSwitch = value;
                        setState(() {});
                      },
                      value: thongBaoCubit.isSwitch,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18.5,
                ),
                if (thongBaoCubit.isSwitch)
                  StreamBuilder<List<ThongBaoModel>>(
                    stream: thongBaoCubit.canhBaoStream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }

                      final data = snapshot.data ?? [];

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ItemThongBaoMobile(
                            image: data[index].image,
                            title: data[index].title,
                            content: data[index].content,
                            time: data[index].time,
                            status: data[index].status,
                            typeNotify: data[index].typeNotify,
                          );
                        },
                      );
                    },
                  )
                else
                  Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThongBaoInherted extends InheritedWidget {
  final ThongBaoCubit thongBaoCubit;

  const ThongBaoInherted({
    Key? key,
    required this.thongBaoCubit,
    required Widget child,
  }) : super(key: key, child: child);

  static ThongBaoInherted of(BuildContext context) {
    final ThongBaoInherted? result =
        context.dependOnInheritedWidgetOfExactType<ThongBaoInherted>();
    assert(result != null, 'No element');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

Widget customSwitch({required bool value, required Function(bool) onToggle}) {
  return FlutterSwitchWidget(
    height: 24,
    width: 42,
    toggleSize: 14,
    inactiveIcon: SvgPicture.asset(ImageAssets.icX),
    activeIcon: SvgPicture.asset(ImageAssets.icV),
    inactiveColor: borderColor,
    activeColor: labelColor,
    value: value,
    onToggle: onToggle,
  );
}
