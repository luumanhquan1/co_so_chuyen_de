import 'package:ccvc_mobile/presentation/home_screen/ui/items/calendar_work_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/items/document_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/items/event_of_day_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/items/meeting_schedule_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/items/people_opinions_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/items/press_social_net_word_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/items/situation_of_handling_people_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/items/summary_of_task_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/items/word_processing_state_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/items/work_list_widget.dart';
import 'package:flutter/cupertino.dart';

enum HomeItemType {
  wordProcessState,
  document,
  summaryOfTask,
  situationHandlingPeople,
  peopleOpinions,
  workSchedule,
  meetingSchedule,
  pressSocialNetWork,
  listWork,
  eventOfDay
}

extension ItemExtension on HomeItemType {
  Widget getItems() {
    switch (this) {
      case HomeItemType.wordProcessState:
        return const WordProcessingStateWidget(
          homeItemType: HomeItemType.wordProcessState,
        );
      case HomeItemType.document:
        return const DocumentWidget(
            homeItemType: HomeItemType.document
        );
      case HomeItemType.summaryOfTask:
        return const SummaryOfTaskWidget(
            homeItemType: HomeItemType.summaryOfTask,
        );
      case HomeItemType.situationHandlingPeople:
        return const SituationOfHandlingPeopleWidget(
            homeItemType: HomeItemType.situationHandlingPeople,
        );
      case HomeItemType.peopleOpinions:
        return const PeopleOpinions(
          homeItemType: HomeItemType.peopleOpinions,
        );
      case HomeItemType.workSchedule:
        return const CalendarWorkWidget(
          homeItemType: HomeItemType.workSchedule,
        );
      case HomeItemType.meetingSchedule:
        return const MeetingScheduleWidget(
          homeItemType: HomeItemType.meetingSchedule,
        );
      case HomeItemType.pressSocialNetWork:
        return const PressSocialNetWork(
          homeItemType: HomeItemType.pressSocialNetWork,
        );
      case HomeItemType.listWork:
        return const WorkListWidget(
          homeItemType: HomeItemType.listWork,
        );
      case HomeItemType.eventOfDay:
        return const EventOfDayWidget(
          homeItemType: HomeItemType.eventOfDay,
        );
    }
  }
}
