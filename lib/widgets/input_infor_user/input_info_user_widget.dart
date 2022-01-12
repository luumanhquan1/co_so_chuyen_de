import 'package:flutter/material.dart';

class InputInfoUserWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final bool isObligatory;
  final bool needMargin;

  const InputInfoUserWidget(
      {Key? key,
      required this.title,
      required this.child,
      this.isObligatory = false,
      this.needMargin = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: needMargin ? 20 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              isObligatory
                  ? const Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  : const SizedBox()
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          child
        ],
      ),
    );
  }
}
