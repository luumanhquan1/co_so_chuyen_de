import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:ccvc_mobile/presentation/relationship_screen/bloc/relationship_cubit.dart';
import 'package:ccvc_mobile/presentation/relationship_screen/widget/friend_cell_widget.dart';
import 'package:ccvc_mobile/presentation/relationship_screen/widget/skeleton_friend_widget.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/textformfield/base_search_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/views/state_loading_skeleton.dart';

class RelationshipScreen extends StatefulWidget {
  final String userId;
  const RelationshipScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _RelationshipScreenState createState() => _RelationshipScreenState();
}

class _RelationshipScreenState extends State<RelationshipScreen> {
  final RelationShipCubit cubit = RelationShipCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.fetchFriends(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack('Bạn bè'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: BaseSearchBar(
                onChange: (value){
                  cubit.searchUser(value.trim());
                },
              ),
            ),
            Expanded(
              child: StateLoadingSkeleton(
                stream: cubit.stateStream,
                skeleton: const SkeletonFriendWidget(),
                child: StreamBuilder<List<UserModel>>(
                    stream: cubit.getListFriend,
                    builder: (context, snapshot) {
                      final data = snapshot.data ?? <UserModel>[];
                      return ListView(
                        children: List.generate(data.length, (index) {
                          final result = data[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: FriendCellWidget(
                              avatarUrl: result.avatarUrl ?? '',
                              name: result.nameDisplay ?? '',
                              peopleType: result.peopleType,
                            ),
                          );
                        }),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
