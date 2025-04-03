import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/common_widget/current_location.dart';
import 'package:delivery_food/common_widget/description_box.dart';
import 'package:delivery_food/common_widget/food_title.dart';
import 'package:delivery_food/common_widget/my_silver_app_bar.dart';
import 'package:delivery_food/common_widget/tab_bar.dart';
import 'package:delivery_food/models/food.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:delivery_food/view/explore/explore_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreView extends StatefulWidget {
   final int initTab;
   const ExploreView({super.key, required this.initTab});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView>with SingleTickerProviderStateMixin {

  late TabController _tabController;
  late int seletedTab;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seletedTab = widget.initTab;
    //Hàm đánh index danh mục theo số lượng values
    _tabController = TabController(initialIndex:widget.initTab,length: FoodCategory.values.length, vsync: this);
    _tabController.addListener(() {
      seletedTab = _tabController.index;
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  //hiển thị danh sách thực đơn dựa vào danh mục
  List<Food> _filterMenuByCategory(FoodCategory category,List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category) {

      //danh sach mon an trong danh muc
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            final food = categoryMenu[index];
            return FoodTitle(
                food: food,
                onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ExploreDetailsView(food: food)));
            }
            );
          });
    }).toList();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: TColor.redColor.withOpacity(0.2),
        body: NestedScrollView(
          headerSliverBuilder: (context , innerBoxIsScrolled) =>[
            MySilverAppBar(
              title: MyTabBar(tabController:_tabController),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(
                    indent: 25,
                    endIndent: 25,
                    thickness: 1,
                    color: TColor.redColor,
                  ),
      
                  CurrentLocation(),
      
                  const DescriptioBox(),
                ],
              ),
            ),
          ],
      
          body: Consumer<Restaurant>(
            builder: (context,restaurant,child)=> TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            ),
          ),
        ),
      ),
    );
  }
}

