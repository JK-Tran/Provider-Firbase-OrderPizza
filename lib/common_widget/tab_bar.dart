import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/models/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController
  });

  List<Tab> _buildCategoryTabs(){
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.description.toString(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.9),
      padding: const EdgeInsets.all(5),
      child: TabBar(
        // dividerColor: Colors.transparent,
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight:5,
        isScrollable: true,
        indicatorColor: TColor.whiteColor,
        labelStyle: const TextStyle(
          fontSize: 20, // Chỉnh kích thước chữ
          color: TColor.whiteColor, // Chỉnh màu chữ
          fontWeight: FontWeight.w700, // Chỉnh đậm
        ),
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
