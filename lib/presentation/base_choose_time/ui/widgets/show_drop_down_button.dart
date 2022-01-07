import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/base_choose_time/bloc/base_choose_time_cubit.dart';
import 'package:ccvc_mobile/presentation/base_choose_time/ui/widgets/form_display_text.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowDropDownButton extends StatefulWidget {
  final Function(String) onChanged;
  final BaseChooseTimeCubit baseChooseTimeCubit;

  const ShowDropDownButton({
    Key? key,
    required this.onChanged,
    required this.baseChooseTimeCubit,
  }) : super(key: key);

  @override
  _ShowDropDownButtonState createState() => _ShowDropDownButtonState();
}

class _ShowDropDownButtonState extends State<ShowDropDownButton> {
  GlobalKey globalKey = GlobalKey();
  double x = 0.0;
  double y = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Offset getPosition() {
    final box = globalKey.currentContext?.findRenderObject() as RenderBox?;
    final Offset position =
        box?.localToGlobal(Offset.zero) ?? Offset.zero; //thi

    setState(() {
      x = position.dx;
      y = position.dy;
    });
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          key: globalKey,
          width: 190,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: bgDropDown),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: FormDisplayText(widget.baseChooseTimeCubit.textContent),
              ),
              Expanded(
                flex: 4,
                child: widget.baseChooseTimeCubit.isCheck
                    ? RotatedBox(
                        quarterTurns: 2,
                        child: IconButton(
                          icon: SvgPicture.asset(ImageAssets.icDropDownButton),
                          onPressed: () {},
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          _showMyDialog(getPosition());
                          setState(() {
                            widget.baseChooseTimeCubit.isCheck = true;
                          });
                        },
                        icon: SvgPicture.asset(ImageAssets.icDropDownButton),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _showMyDialog(Offset position) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent, // user must tap button!
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              widget.baseChooseTimeCubit.isCheck = false;
            });
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned(
                  top: position.dy + 10,
                  right: 8,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent,
                      border: Border.all(
                        color: bgDropDown,
                      ),
                    ),
                    child: Column(
                      children: List.generate(
                        3,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.baseChooseTimeCubit.textContent =
                                  widget.baseChooseTimeCubit.listText[index];
                            });
                            Navigator.pop(context);
                            widget.baseChooseTimeCubit.isCheck = false;
                            widget.onChanged(
                              widget.baseChooseTimeCubit.textContent,
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  widget.baseChooseTimeCubit.listText[index],
                                  style: textNormal(textDropDownColor, 14),
                                ),
                              ),
                              if (index == 2)
                                Container()
                              else
                                Container(
                                  height: 1,
                                  color: bgDropDown,
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
