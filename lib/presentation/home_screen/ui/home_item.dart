import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/calendar_work_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/document_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/event_of_day_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/meeting_schedule_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/people_opinions_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/press_social_net_word_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/sinh_nhat_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/situation_of_handling_people_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/summary_of_task_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/word_processing_state_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/items/work_list_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/calendar_work_tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/document__tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/event_of_day_tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/meeting_schedule__tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/people_opinions__tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/press_social_net_word__tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/sinh_nhat__tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/situation_of_handling_people__tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/summary_of_task_tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/word_processing_state_tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/items/work_list_tablet_widget.dart';

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
  eventOfDay,
  sinhNhat
}

extension ItemExtension on HomeItemType {
  Widget getItemsMobile() {
    switch (this) {
      case HomeItemType.wordProcessState:
        return const WordProcessingStateWidget(
          homeItemType: HomeItemType.wordProcessState,
        );
      case HomeItemType.document:
        return const DocumentWidget(homeItemType: HomeItemType.document);
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
      case HomeItemType.sinhNhat:
        return const SinhNhatWidget(homeItemType: HomeItemType.sinhNhat);
    }
  }

  Widget getItemsTablet() {
    switch (this) {
      case HomeItemType.wordProcessState:
        return const WordProcessingStateTabletWidget(
          homeItemType: HomeItemType.wordProcessState,
        );
      case HomeItemType.document:
        return const DocumentTabletWidget(homeItemType: HomeItemType.document);
      case HomeItemType.summaryOfTask:
        return const SummaryOfTaskTabletWidget(
          homeItemType: HomeItemType.summaryOfTask,
        );
      case HomeItemType.situationHandlingPeople:
        return const SituationOfHandlingPeopleTabletWidget(
          homeItemType: HomeItemType.situationHandlingPeople,
        );
      case HomeItemType.peopleOpinions:
        return const PeopleOpinionsTabletWidget(
          homeItemType: HomeItemType.peopleOpinions,
        );
      case HomeItemType.workSchedule:
        return const CalendarWorkTabletWidget(
          homeItemType: HomeItemType.workSchedule,
        );
      case HomeItemType.meetingSchedule:
        return const MeetingScheduleTabletWidget(
          homeItemType: HomeItemType.meetingSchedule,
        );
      case HomeItemType.pressSocialNetWork:
        return const PressSocialNetWorkTabletWidget(
          homeItemType: HomeItemType.pressSocialNetWork,
        );
      case HomeItemType.listWork:
        return const WorkListTabletWidget(
          homeItemType: HomeItemType.listWork,
        );
      case HomeItemType.eventOfDay:
        return const EventOfDayTabletWidget(
          homeItemType: HomeItemType.eventOfDay,
        );

      case HomeItemType.sinhNhat:
        return const SinhNhatTabletWidget(homeItemType: HomeItemType.sinhNhat);
    }
  }
}
