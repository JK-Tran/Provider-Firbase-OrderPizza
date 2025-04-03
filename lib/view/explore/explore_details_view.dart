import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/common_widget/round_button.dart';
import 'package:delivery_food/models/food.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreDetailsView extends StatefulWidget {
  final Food food;
  Addon? selectedAddon; // Biến để theo dõi mục đã chọn

  ExploreDetailsView({
    super.key,
    required this.food,
  }) {
    // Khởi tạo _selectedAddon là null ban đầu
    selectedAddon = null;
  }

  @override
  State<ExploreDetailsView> createState() => _ExploreDetailsViewState();
}

class _ExploreDetailsViewState extends State<ExploreDetailsView> {
  void addToCart(Food food,Addon selectedAddon ){
    List<Addon> currentSelectedAddons = [selectedAddon];
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Expanded(
            child: Text(
              'Đã thêm vào giỏ hàng',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Màu nền của hình tròn
            ),
            padding: const EdgeInsets.all(8), // Đảm bảo kích thước của hình tròn
            child: const IconTheme(
              data: IconThemeData(
                color: Colors.green, // Màu của icon
                size: 20,
              ),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontWeight: FontWeight.w900, // Trọng lượng phông chữ của icon
                ),
                child: Icon(
                  Icons.check,
                ),
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 2), // Thời gian hiển thị snackbar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

// Đóng màn hình hiện tại
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //ảnh món ăn
                const SizedBox(height: 50),
                Image.asset(
                  widget.food.imagePath,
                  height: 220,
                  fit: BoxFit.fill,
                ),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //tên món ăn
                      Text(
                        widget.food.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 15),
                      Text(
                        "Giá: ${widget.food.price.toStringAsFixed(3)} đ",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),
                      //tên món ăn
                      Text(
                        widget.food.description,
                        style: const TextStyle(
                          color: TColor.fontGrey,
                          fontSize: 19,
                        ),
                      ),

                      const SizedBox(height: 15),

                      //thêm món
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: TColor.secondaryText,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            //lấy dữ liệu của Addon
                            Addon addon = widget.food.availableAddons[index];
                            return RadioListTile<Addon>(
                              title: Text(
                                addon.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                addon.price != 0 ? '${addon.price.toStringAsFixed(3)} đ' : '${addon.price.toStringAsFixed(0)} đ',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              value: addon,
                              groupValue: widget.selectedAddon,
                              onChanged: (Addon? value) {
                                setState(() {
                                  widget.selectedAddon = value;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundButton(
                    title: "Thêm vào giỏ hàng",
                    onPressed: () {
                      addToCart(widget.food, widget.selectedAddon!);
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(left: 5, top: 5),
              decoration: BoxDecoration(
                color: TColor.placeholder.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded,size: 25),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
