import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/tab_calender_form/ui/in_calender_form.dart';
import 'package:ccvc_mobile/presentation/calender_work/tab_list_form/ui/in_list_form.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class MainTabarCalenderWork extends StatefulWidget {
  const MainTabarCalenderWork({Key? key}) : super(key: key);

  @override
  _MainTabarCalenderWorkState createState() => _MainTabarCalenderWorkState();
}

class _MainTabarCalenderWorkState extends State<MainTabarCalenderWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/add_button_calender.svg"),
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/images/menu_calender.svg"))
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: BaseSearchBar(),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: const Color(0xffffffff),
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(48.0),
                  child: AppBar(
                    backgroundColor: const Color(0xfffffff),
                    elevation: 0.0,
                    bottom: TabBar(
                      labelColor: const Color(0xff7966FF),
                      unselectedLabelColor: const Color(0xff667793),
                      indicatorColor: const Color(0xff7966FF),
                      tabs: [
                        Tab(text: S.current.inlistform),
                        Tab(text: S.current.incalenderform),

                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    InListForm(),
                    InCalenderForm(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
