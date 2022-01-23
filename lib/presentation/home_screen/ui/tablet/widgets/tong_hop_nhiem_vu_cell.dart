import 'package:flutter/material.dart';

class TongHopNhiemVuCell extends StatefulWidget {
  final Widget Function(BuildContext, int) builder;
  const TongHopNhiemVuCell({Key? key, required this.builder}) : super(key: key);

  @override
  State<TongHopNhiemVuCell> createState() => _TongHopNhiemVuCellState();
}

class _TongHopNhiemVuCellState extends State<TongHopNhiemVuCell> {
  @override
  Widget build(BuildContext context) {
    int indexCell = 0;
    return Column(
      children: List.generate(
        3,
        (indexColunm) {
          if (indexColunm != 0) {
            indexCell = indexCell + 2;
          }
          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: widget.builder(context, 0 + indexCell),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: widget.builder(context, 1 + indexCell),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
