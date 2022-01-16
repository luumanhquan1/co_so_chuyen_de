import 'package:flutter/material.dart';
class TabBarSliver extends SliverPersistentHeaderDelegate{
  TabBar tabBar;
  TabBarSliver(this.tabBar);
  @override
  Widget build(Object context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.white,
        child: tabBar,);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw false;
  }
}