import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/base_choose_time/bloc/base_choose_time_cubit.dart';
import 'package:ccvc_mobile/presentation/base_choose_time/ui/widgets/show_drop_down_button.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BaseChooseTimeScreen extends StatefulWidget {
  final DateTime today;

  const BaseChooseTimeScreen({Key? key, required this.today}) : super(key: key);

  @override
  _BaseChooseTimeScreenState createState() => _BaseChooseTimeScreenState();
}

class _BaseChooseTimeScreenState extends State<BaseChooseTimeScreen> {
  final BaseChooseTimeCubit baseChooseTimeCubit = BaseChooseTimeCubit();

  @override
  void initState() {
    baseChooseTimeCubit.getState(widget.today);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgDropDown.withOpacity(0.2),
      height: 56,
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spaceW8,
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: bgButtonDropDown.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: GestureDetector(
                onTap: () {
                  baseChooseTimeCubit.ontoDay();
                },
                child: Text(
                  S.current.today,
                  textAlign: TextAlign.center,
                  style: textNormalCustom(
                    color: bgButtonDropDown,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                      baseChooseTimeCubit.checkToOptionBackDay(
                        baseChooseTimeCubit.changeOption,
                      );
                    },
                    child: SvgPicture.asset(ImageAssets.icBackDropDown),
                  ),
                  spaceW12,
                  StreamBuilder<Object>(
                    stream: baseChooseTimeCubit.textDateTimeStream,
                    builder: (context, snapshot) {
                      return Text(
                        '${snapshot.data}',
                        style: textNormal(textDropDownColor, 14),
                      );
                    },
                  ),
                  spaceW12,
                  GestureDetector(
                    onTap: () {
                      baseChooseTimeCubit.checkToOption(
                        baseChooseTimeCubit.changeOption,
                      );
                    },
                    child: SvgPicture.asset(ImageAssets.icNextDropDown),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ShowDropDownButton(
              onChanged: (value) {
                baseChooseTimeCubit.changeOption = value;
              },
              baseChooseTimeCubit: BaseChooseTimeCubit(),
            ),
          ),
          spaceW8,
        ],
      ),
    );
  }
}
