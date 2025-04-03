import 'package:delivery_food/common/images.dart';
import 'package:delivery_food/common/lists.dart';
import 'package:delivery_food/common/strings.dart';
import 'package:delivery_food/common_widget/food_title.dart';
import 'package:delivery_food/common_widget/section_view.dart';
import 'package:delivery_food/models/food.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:delivery_food/view/explore/explore_details_view.dart';
import 'package:delivery_food/view/main_tabview/main_tabview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatefulWidget {
  final VoidCallback navigateToExploreView;// Hàm callback
  const HomeView({super.key,required this.navigateToExploreView});



  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  //hiển thị danh sách thực đơn dựa vào danh mục
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  Widget _buildFoodItem(Food food) {
    return SizedBox(
      width: 410, // Chiều rộng cố định cho mỗi item
      child: FoodTitle(
        food: food,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExploreDetailsView(food: food),
            ),
          );
        },
      ),
    );
  }

  ListView getComboFoodListView(List<Food> fullMenu) {
    // Lọc danh sách food chỉ lấy các food có category là combo
    List<Food> comboFoods = _filterMenuByCategory(FoodCategory.combo, fullMenu);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: comboFoods.length,
      itemBuilder: (context, index) {
        final food = comboFoods[index];
        return _buildFoodItem(food);
      },
    );
  }

  ListView getComboPromotionsListView(List<Food> fullMenu) {
    // Lọc danh sách food chỉ lấy các food có category là combo
    List<Food> promotionsFoods = _filterMenuByCategory(
        FoodCategory.promotions, fullMenu);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: promotionsFoods.length,
      itemBuilder: (context, index) {
        final food = promotionsFoods[index];
        return _buildFoodItem(food);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.deepOrange.withOpacity(0.4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.red.withOpacity(0.9),
            child: SizedBox(
              height: 70, // Chiều cao cố định của phần header
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainTabView()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(icAppLogo, width: 50,),
                      const SizedBox(width: 10),
                       Text(
                        appname,
                         style: GoogleFonts.lobster(
                           textStyle: const TextStyle(
                             fontSize: 40, // Thiết lập kích thước chữ
                             fontWeight: FontWeight.bold, // Thiết lập độ đậm
                             color: Colors.white, // Thiết lập màu sắc
                             // Bạn có thể thêm các thuộc tính TextStyle khác tại đây
                           ),
                         ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 290,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    itemCount: sliderList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        sliderList[index],
                        fit: BoxFit.fill,
                      ).box.rounded.clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),
                  //------------combo-------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SectionView(
                      title: "Combo",
                      onPressed: () {
                        widget.navigateToExploreView();
                      },
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.41,
                    // Thiết lập chiều rộng của listview
                    child: Consumer<Restaurant>(
                      builder: (context, restaurant, child) =>
                          getComboFoodListView(restaurant.menu),
                    ),
                  ),

                  //------------khuyến mãi---------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SectionView(
                      title: "Khuyến mãi",
                      onPressed: widget.navigateToExploreView,
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.41,
                    // Thiết lập chiều rộng của listview
                    child: Consumer<Restaurant>(
                      builder: (context, restaurant, child) =>
                          getComboPromotionsListView(restaurant.menu),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
