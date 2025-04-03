import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/view/acount/acount_view.dart';
import 'package:delivery_food/view/cart/cart_view.dart';
import 'package:delivery_food/view/explore/explore_view.dart';
import 'package:delivery_food/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> with SingleTickerProviderStateMixin {
  late TabController controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    controller = TabController(length:4, vsync: this);
    controller.addListener(() {
      setState(() {
        selectTab = controller.index;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: [
            HomeView(navigateToExploreView: navigateToExploreView),
            const ExploreView(initTab: 0), // Change these to your actual widgets
            const CartView(), // Change these to your actual widgets
            const AcountView(), // Change these to your actual widgets// Change these to your actual widgets
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.red.withOpacity(0.9),
          elevation: 1,
          child: TabBar(
            padding: const EdgeInsets.symmetric(vertical: 5),
            dividerColor: Colors.transparent,
            controller: controller,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            indicatorWeight: 1,
            labelColor: TColor.whiteColor,
            labelStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: Colors.black87,
            unselectedLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
              ,
            ),
            tabs: [
              _buildTabItem(
                index: 0,
                iconPath: "assets/images/store_tab.png",
                text: "Trang chủ",
              ),
              _buildTabItem(
                index: 1,
                iconPath: "assets/images/order-food.png",
                text: "Thực đơn",
              ),
              _buildTabItem(
                index: 2,
                iconPath: "assets/images/cart_tab.png",
                text: "Giỏ hàng",
              ),
              _buildTabItem(
                index: 3,
                iconPath: "assets/images/account_tab.png",
                text: "Tài khoản",
              ),
            ],
          ),

        ),
      ),
    );
  }


  void navigateToExploreView() {
    controller.animateTo(1);
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context)=>const ExploreView(initTab: 1)));
  }

  Widget _buildTabItem({required int index, required String iconPath, required String text}) {
    final isSelected = selectTab == index;
    return Tab(
      icon: SizedBox(
        child: ColorFiltered(
          colorFilter: isSelected ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : ColorFilter.mode(TColor.primaryText, BlendMode.srcIn),
          child: Image.asset(
            iconPath,
            width: 28,
          ),
        ),
      ),
      text: text,
    );
  }
}


