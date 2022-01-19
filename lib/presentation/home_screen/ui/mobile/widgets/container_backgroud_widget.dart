import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerBackgroundWidget extends StatefulWidget {
  final Widget child;
  final String title;
  final String urlIcon;
  final Widget? leadingIcon;
  final Widget? dialogSelect;
  final EdgeInsetsGeometry? padding;
  final Function()? onTapIcon;
  final double spacingTitle;
  final EdgeInsetsGeometry paddingChild;
  const ContainerBackgroundWidget({
    Key? key,
    required this.child,
    required this.title,
    this.urlIcon = ImageAssets.icMore,
    this.leadingIcon,
    this.dialogSelect,
    this.padding,
    this.onTapIcon,
    this.spacingTitle = 20,
    this.paddingChild = const EdgeInsets.symmetric(vertical: 20),
  }) : super(key: key);

  @override
  _ContainerBackgroudWidgetState createState() =>
      _ContainerBackgroudWidgetState();
}

class _ContainerBackgroudWidgetState extends State<ContainerBackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.getInstance().backGroundColor(),
      padding: widget.paddingChild,
      margin: const EdgeInsets.only(top: 6),
      child: Stack(
        children: [
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MouseRegion(
                        onHover: (_) {
                          HomeProvider.of(context).homeCubit.closeDialog();
                        },
                        child: Row(
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
                                fontSize: 16,
                                color: AppTheme.getInstance().titleColor(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (widget.onTapIcon != null) {
                            widget.onTapIcon!();
                          } else {}
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          color: Colors.transparent,
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(widget.urlIcon),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: widget.spacingTitle,
                ),
                MouseRegion(
                  onHover: (_) {
                    HomeProvider.of(context).homeCubit.closeDialog();
                  },
                  child: Padding(
                    padding: widget.padding ??
                        const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                    child: widget.child,
                  ),
                )
              ],
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
