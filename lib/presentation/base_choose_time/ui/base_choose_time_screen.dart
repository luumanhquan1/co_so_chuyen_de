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
        height: 56,
        color: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal:30),
        child: Row(

          children: [
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.yellow,
                child: Row(
                  children: [
                    spaceW8,
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 32,
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
                        height: 32,
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
                              child: SvgPicture.asset(ImageAssets.ic_prev_box),
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
                              child: SvgPicture.asset(ImageAssets.ic_next_box),
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
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                height: 20,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      // width: 50,
                      // height: 14,
                      child: SvgPicture.asset(ImageAssets.ic_search),
                    ),
                    // prefixIconConstraints: BoxConstraints(
                    //   maxWidth: 40.0.textScale(space: 16.0),
                    //   maxHeight: 14,
                    // ),
                    contentPadding: const EdgeInsets.only(left: 20),
                    isCollapsed: true,
                    fillColor: bgDropDown.withOpacity(0.1),
                    filled: true,
                    hintText: S.current.tiem_kiem,
                    hintStyle: textNormal(
                      sideTextInactiveColor,
                      14,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: bgDropDown),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
