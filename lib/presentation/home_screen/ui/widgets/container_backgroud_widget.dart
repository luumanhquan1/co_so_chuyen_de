import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerBackgroudWidget extends StatefulWidget {
  final Widget child;
  final String title;
  final String urlIcon;
  final Widget? leadingIcon;
  const ContainerBackgroudWidget(
      {Key? key,
      required this.child,
      required this.title,
      this.urlIcon = 'assets/icons/ic_more.svg',
      this.leadingIcon,})
      : super(key: key);

  @override
  _ContainerBackgroudWidgetState createState() =>
      _ContainerBackgroudWidgetState();
}

class _ContainerBackgroudWidgetState extends State<ContainerBackgroudWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      constraints: const BoxConstraints(minHeight: 300),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      margin: const EdgeInsets.only(top: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                 if (widget.leadingIcon==null) const SizedBox() else Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: widget.leadingIcon,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: AppTheme.getInstance().titleColor(),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,),
                  ),
                ],
              ),
              SvgPicture.asset(widget.urlIcon)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          widget.child
        ],
      ),
    );
  }
}
