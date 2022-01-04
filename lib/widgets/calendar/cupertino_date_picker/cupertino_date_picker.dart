import 'dart:math' as math;

import 'package:ccvc_mobile/widgets/calendar/cupertino_date_picker/build_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rounded_date_picker/src/era_mode.dart';
import 'cuper_date_picker_extension.dart';

const double kItemExtent = 32.0;

const bool kUseMagnifier = true;
const double kMagnification = 1.08;
const double kDatePickerPadSize = 12.0;
const double kSqueeze = 1.25;

const TextStyle _kDefaultPickerTextStyle = TextStyle(
  letterSpacing: -0.83,
);
TextStyle themeTextStyle(BuildContext context) {
  return CupertinoTheme.of(context).textTheme.dateTimePickerTextStyle;
}

class _DatePickerLayoutDelegate extends MultiChildLayoutDelegate {
  _DatePickerLayoutDelegate({
    required this.columnWidths,
    required this.textDirectionFactor,
  });

  final List<double> columnWidths;

  final int textDirectionFactor;

  @override
  void performLayout(Size size) {
    double remainingWidth = size.width;

    for (int i = 0; i < columnWidths.length; i++) {
      remainingWidth -= columnWidths[i] + kDatePickerPadSize * 2;
    }

    double currentHorizontalOffset = 0.0;

    for (int i = 0; i < columnWidths.length; i++) {
      final int index =
          textDirectionFactor == 1 ? i : columnWidths.length - i - 1;

      double childWidth = columnWidths[index] + kDatePickerPadSize * 2;
      if (index == 0 || index == columnWidths.length - 1) {
        childWidth += remainingWidth / 2;
      }

      // We can't actually assert here because it would break things badly for
      // semantics, which will expect that we laid things out here.
      assert(
        () {
          if (childWidth < 0) {
            FlutterError.reportError(
              FlutterErrorDetails(
                exception: FlutterError(
                  'Insufficient horizontal space to render the '
                  'CupertinoDatePicker because the parent is too narrow at '
                  '${size.width}px.\n'
                  'An additional ${-remainingWidth}px is needed to avoid '
                  'overlapping columns.',
                ),
              ),
            );
          }
          return true;
        }(),
      );
      layoutChild(
        index,
        BoxConstraints.tight(Size(math.max(0.0, childWidth), size.height)),
      );
      positionChild(index, Offset(currentHorizontalOffset, 0.0));

      currentHorizontalOffset += childWidth;
    }
  }

  @override
  bool shouldRelayout(_DatePickerLayoutDelegate oldDelegate) {
    return columnWidths != oldDelegate.columnWidths ||
        textDirectionFactor != oldDelegate.textDirectionFactor;
  }
}

enum PickerColumnType {
  dayOfMonth,

  month,

  year,
}

class FlutterRoundedCupertinoDatePickerWidget extends StatefulWidget {
  final TextStyle textStyleDate;
  FlutterRoundedCupertinoDatePickerWidget({
    Key? key,
    this.mode = CupertinoDatePickerMode.dateAndTime,
    required this.onDateTimeChanged,
    DateTime? initialDateTime,
    this.minimumDate,
    this.maximumDate,
    this.minimumYear = 1,
    this.maximumYear,
    this.minuteInterval = 1,
    this.use24hFormat = false,
    this.borderRadius = 16,
    this.era,
    this.fontFamily,
    this.background = Colors.white,
    this.textColor = Colors.black54,
    this.textStyleDate = const TextStyle(),
  })  : initialDateTime = initialDateTime ?? DateTime.now(),
        super(key: key);

  final CupertinoDatePickerMode mode;

  final DateTime initialDateTime;

  final DateTime? minimumDate;

  final DateTime? maximumDate;

  final int minimumYear;

  final int? maximumYear;

  final int minuteInterval;

  final bool use24hFormat;

  final ValueChanged<DateTime> onDateTimeChanged;

  /// Customize
  final EraMode? era;
  final Color background;
  final Color textColor;
  final double borderRadius;
  final String? fontFamily;

  @override
  State<StatefulWidget> createState() {
    return CupertinoDatePickerDateState();
  }

  static double _getColumnWidth(
    PickerColumnType columnType,
    CupertinoLocalizations localizations,
    BuildContext context,
  ) {
    String longestText = '';

    switch (columnType) {
      case PickerColumnType.dayOfMonth:
        for (int i = 1; i <= 31; i++) {
          final String dayOfMonth = localizations.datePickerDayOfMonth(i);
          if (longestText.length < dayOfMonth.length) longestText = dayOfMonth;
        }
        break;
      case PickerColumnType.month:
        for (int i = 1; i <= 12; i++) {
          final String month = localizations.datePickerMonth(i);
          if (longestText.length < month.length) {
            longestText = '${month}_____';
          }
        }
        break;
      case PickerColumnType.year:
        longestText = localizations.datePickerYear(2018);
        break;
    }

    final TextPainter painter = TextPainter(
      text: TextSpan(
        style: themeTextStyle(context),
        text: longestText,
      ),
      textDirection: Directionality.of(context),
    );

    painter.layout();
    return painter.maxIntrinsicWidth;
  }
}

typedef ColumnBuilder = Widget Function(
  double offAxisFraction,
  TransitionBuilder itemPositioningBuilder,
);

class CupertinoDatePickerDateState
    extends State<FlutterRoundedCupertinoDatePickerWidget> {
  late int textDirectionFactor;
  late CupertinoLocalizations localizations;

  Alignment? alignCenterLeft;
  Alignment? alignCenterRight;


  late int selectedDay;
  late int selectedMonth;
  late int selectedYear;

  late FixedExtentScrollController dayController;

  late FixedExtentScrollController monthController;
  late FixedExtentScrollController yearController;

  Map<int, double> estimatedColumnWidths = <int, double>{};

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialDateTime.day;
    selectedMonth = widget.initialDateTime.month;
    selectedYear = widget.initialDateTime.year;

    dayController = FixedExtentScrollController(initialItem: selectedDay - 1);
    monthController =
        FixedExtentScrollController(initialItem: selectedMonth - 1);
    yearController = FixedExtentScrollController(initialItem: selectedYear);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    textDirectionFactor =
        Directionality.of(context) == TextDirection.ltr ? 1 : -1;
    localizations = CupertinoLocalizations.of(context);

    alignCenterLeft =
        textDirectionFactor == 1 ? Alignment.centerLeft : Alignment.centerRight;
    alignCenterRight =
        textDirectionFactor == 1 ? Alignment.centerRight : Alignment.centerLeft;

    estimatedColumnWidths[PickerColumnType.dayOfMonth.index] =
        FlutterRoundedCupertinoDatePickerWidget._getColumnWidth(
      PickerColumnType.dayOfMonth,
      localizations,
      context,
    );
    estimatedColumnWidths[PickerColumnType.month.index] =
        FlutterRoundedCupertinoDatePickerWidget._getColumnWidth(
      PickerColumnType.month,
      localizations,
      context,
    );
    estimatedColumnWidths[PickerColumnType.year.index] =
        FlutterRoundedCupertinoDatePickerWidget._getColumnWidth(
      PickerColumnType.year,
      localizations,
      context,
    );
  }


  bool _keepInValidRange(ScrollEndNotification notification) {
    final int desiredDay =
        DateTime(selectedYear, selectedMonth, selectedDay).day;
    if (desiredDay != selectedDay) {
      SchedulerBinding.instance!.addPostFrameCallback((Duration timestamp) {
        dayController.animateToItem(
          dayController.selectedItem - desiredDay,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      });
    }
    setState(() {});
    return false;
  }

  @override
  Widget build(BuildContext context) {
    List<ColumnBuilder> pickerBuilders = <ColumnBuilder>[];
    List<double> columnWidths = <double>[];
    final List<Widget> pickers = <Widget>[];
    addPickerCell(pickerBuilders, columnWidths, pickers);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.borderRadius),
          topRight: Radius.circular(widget.borderRadius),
        ),
        color: widget.background,
      ),
      child: MediaQuery(
        data: const MediaQueryData(),
        child: NotificationListener<ScrollEndNotification>(
          onNotification: _keepInValidRange,
          child: DefaultTextStyle.merge(
            style: _kDefaultPickerTextStyle,
            child: CustomMultiChildLayout(
              delegate: _DatePickerLayoutDelegate(
                columnWidths: columnWidths,
                textDirectionFactor: textDirectionFactor,
              ),
              children: pickers,
            ),
          ),
        ),
      ),
    );
  }
}
