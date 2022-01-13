import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/calendar/event.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarWidget extends StatefulWidget {
  const TableCalendarWidget({Key? key}) : super(key: key);

  @override
  _TableCalendarWidgetState createState() => _TableCalendarWidgetState();
}

class _TableCalendarWidgetState extends State<TableCalendarWidget> {
  String convertDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  bool isSearch = false;
  bool isFomat = true;
  DateTime _selectedDay = DateTime.now();
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat _calendarFormatWeek = CalendarFormat.week;
  CalendarFormat _calendarFormatMonth = CalendarFormat.month;
  final TextEditingController _eventController = TextEditingController();

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowContainerColor.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isSearch) Expanded(
                      child: TextField(

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tìm kiếm',
                          hintStyle: textNormalCustom(
                            color: textBodyTime,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                          )
                        ),
                      ),
                    ) else Row(
                      children: [
                        Text(
                          convertDate(DateTime.now()),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: titleColor,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: textBodyTime,
                          ),
                          onPressed: () {
                            isFomat = !isFomat;
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isSearch = !isSearch;
                          });
                        },
                        child:
                            SvgPicture.asset(ImageAssets.ic_search_calendar)),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              TableCalendar(
                eventLoader: _getEventsfromDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (date, events) {
                  if (!isSameDay(_selectedDay, date)) {
                    setState(() {
                      _selectedDay = date;
                      _focusedDay.value = _selectedDay;
                    });
                  }
                },
                daysOfWeekVisible: true,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    isFomat
                        ? _calendarFormatWeek = _format
                        : _calendarFormatMonth = _format;
                  });
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                calendarStyle: CalendarStyle(
                  weekendTextStyle: textNormalCustom(
                    color: titleCalenderWork,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  defaultTextStyle: textNormalCustom(
                    color: titleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  selectedTextStyle: textNormalCustom(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  todayDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: toDayColor,
                  ),
                  todayTextStyle: textNormalCustom(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: buttonColor,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: radioFocusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                headerVisible: false,
                calendarFormat:
                    isFomat ? _calendarFormatWeek : _calendarFormatMonth,
                firstDay: DateTime.utc(2021, 8, 20),
                lastDay: DateTime.utc(2030, 8, 20),
                focusedDay: _selectedDay,
              ),
              ..._getEventsfromDay(_selectedDay).map(
                (Event event) => ListTile(
                  title: Text(
                    event.title,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
