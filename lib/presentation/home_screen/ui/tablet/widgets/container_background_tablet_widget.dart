import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';

import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerBackgroundTabletWidget extends StatefulWidget {
  final Widget child;
  final String title;
  final String urlIcon;
  final Widget? leadingIcon;
  final Widget? dialogSelect;
  final EdgeInsetsGeometry? padding;
  final Function()? onTapIcon;
  final double spacingTitle;
  final EdgeInsetsGeometry paddingChild;
  final double? maxHeight;
  final double? minHeight;
  const ContainerBackgroundTabletWidget({
    Key? key,
    required this.child,
    required this.title,
    this.urlIcon = ImageAssets.icMore,
    this.leadingIcon,
    this.dialogSelect,
    this.padding,
    this.onTapIcon,
    this.spacingTitle = 20,
    this.maxHeight,
    this.minHeight,
    this.paddingChild = const EdgeInsets.symmetric(vertical: 20),
  }) : super(key: key);

  @override
  _ContainerBackgroudWidgetState createState() =>
      _ContainerBackgroudWidgetState();
}

class _ContainerBackgroudWidgetState
    extends State<ContainerBackgroundTabletWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: widget.minHeight ?? 0,
        maxHeight: widget.maxHeight ?? double.infinity,
      ),
      padding: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: AppTheme.getInstance().backGroundColor(),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: borderColor.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: shadowContainerColor.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          )
        ],
      ),
      child: Stack(
        children: [
          MouseRegion(
            onHover: (_) {
              HomeProvider.of(context).homeCubit.showDialog(null);
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: widget.spacingTitle,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (widget.leadingIcon == null)
                              const SizedBox()
                            else
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: widget.leadingIcon,
                              ),
                            Text(
                              widget.title,
                              style: textNormalCustom(
                                fontSize: 16.0.textScale(space: 4),
                                color: AppTheme.getInstance().titleColor(),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            if (widget.onTapIcon != null) {
                              widget.onTapIcon!();
                            } else {}
                          },
                          child: Container(
                            width: 20,
                            color: Colors.transparent,
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(widget.urlIcon),
                          ),
                        )
                      ],
                    ),
                  ),
                  widget.child
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 16,
            child: widget.dialogSelect ?? const SizedBox(),
          )
        ],
      ),
    );
  }
}
