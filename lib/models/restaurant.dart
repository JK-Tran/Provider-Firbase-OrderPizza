import 'package:delivery_food/models/cart_item.dart';
import 'package:delivery_food/models/food.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [
    //combo
    Food(
        name: "Gà đánh lẻ",
        description: "Combo dành cho 2-3 người:"
            "01 Pizga Phô Mai/ Pizza ALC (Cỡ Vừa)"
            "01 Mì Ý Thịt Xông Khói Xốt Kem/ Cơm Chiên Hải Sản/ Xà Lách Cá Ngừ & Thịt Xông Khói"
            "01 Phần Cánh Gà 4 Miếng hoăc Gà Không Xương (Vị tùy chọn)"
            "Thức uống: 03 Lon Nước Ngọt/ Nước suối",
        imagePath: "assets/images/Ga_Danh_Le.jpg",
        price: 208.000,
        category: FoodCategory.combo,
        availableAddons: [
          Addon(name: "Cay", price: 0),
          Addon(name: "Không cay", price: 0),
        ]
    ),
    Food(
        name: "Gà Cả hội",
        description: "Combo dành cho 4-6 người:"
            "01 Pizga Phô Mai/ Pizza ALC (Cỡ Lớn)"
            "01 Mì Ý Thịt Xông Khói Xốt Kem/ Cơm Chiên Hải Sản/ Xà Lách Cá Ngừ & Thịt Xông Khói"
            "01 Phần Cánh Gà 6 Miếng hoăc Gà Không Xương (Vị tùy chọn)"
            "Thức uống: 06 Lon Nước Ngọt/ Nước suối",
        imagePath: "assets/images/Ga_Ca_Hoi.jpg",
        price: 248.000,
        category: FoodCategory.combo,
        availableAddons: [
          Addon(name: "Cay", price: 0),
          Addon(name: "Không cay", price: 0),
        ]
    ),
    Food(
        name: "Combo 1",
        description: "Dành cho 1-2 người: "
            " 01 Pizza Hawaiian/ Phô Mai Cao Cấp/ Gà Nướng Nấm/"
            "Pepperoni/ Bò BBQ Xốt Cay Hàn Quốc/ Rau Củ (Cỡ Vừa), 01 Khoai Tây Chiên/"
            "Bánh Cuộn Phô Mai/ Xúp Kem Nấm Thịt Gà, 02 Lon Nước Ngọt/ 02 Aquafina.",
        imagePath: "assets/images/Tiec_Ngon_ Tron_Niem_Vui_1.jpg",
        price: 239.000,
        category: FoodCategory.combo,
        availableAddons: [
          Addon(name: "Nước ngọt", price: 0),
          Addon(name: "Aquafina", price: 0),
        ]
    ),
    Food(
        name: "Combo 2",
        description: "Dành cho 2-3 người:"
            "01 Pizza ALC (Cỡ Vừa), 01 Mì Ý Thịt Xông Khói Xốt Kem/ "
            " Cơm Chiên Hải Sản/ Xà Lách Cá Ngừ & Thịt Xông Khói, 02 Lon Nước Ngọt/ 02 Aquafina",
        imagePath: "assets/images/Tiec_Ngon_ Tron_Niem_Vui_2.jpg",
        price: 309.000,
        category: FoodCategory.combo,
        availableAddons: [
          Addon(name: "Nước ngọt", price: 0),
          Addon(name: "Aquafina", price: 0),
        ]
    ),
    Food(
        name: "Combo 3",
        description: "Dành 3-4 người:"
            "01 Pizza ALC (Cỡ Lớn), 01 Mì Ý Thịt Xông Khói Xốt Kem/"
            "Cơm Chiên Hải Sản/ Xà Lách Cá Ngừ & Thịt Xông Khói, 01 Khoai Tây Chiên/"
            "Bánh Cuộn Phô Mai/ Xúp Kem Nấm Thịt Gà, "
            "04 Lon Nước Ngọt / 04 Aquafina.",
        imagePath: "assets/images/Tiec_Ngon_ Tron_Niem_Vui_3.jpg",
        price: 208.000,
        category: FoodCategory.combo,
        availableAddons: [
          Addon(name: "Nước ngọt", price: 0),
          Addon(name: "Aquafina", price: 0),
        ]
    ),
    Food(
        name: "Combo4",
        description: "Dành cho 5-6 người:"
            "01 Pizza ALC (Cỡ Lớn), 01 Pizza ALC (Cỡ Vừa)"
            "01 Mì Ý Thịt Xông Khói Xốt Kem/ Cơm Chiên Hải Sản, 01 Xà Lách Cá Ngừ & Thịt Xông Khói/"
            "Xà Lách Gà Pesto, 06 Lon Nước Ngọt / 06 Aquafina",
        imagePath: "assets/images/Tiec_Ngon_ Tron_Niem_Vui_4.jpg",
        price: 208.000,
        category: FoodCategory.combo,
        availableAddons: [
          Addon(name: "Nước ngọt", price: 0),
          Addon(name: "Aquafina", price: 0),
        ]
    ),

    //promotions
    Food(
        name: "Khuyến mãi 1",
        description: "Dành Cho 1-2 Người 01 Pizza Gà Nướng Nấm/"
            "Phô Mai Cao Cấp/Pepperoni (Cỡ Nhỏ) 01 Bánh Mì Bơ Tỏi/"
            "Bánh Cuộn Phô Mai/ Khoai Tây Chiên",
        imagePath: "assets/images/My_Box_1_Combo_jpg.jpg",
        price: 79.000,
        category: FoodCategory.promotions,
        availableAddons: [
          Addon(name: "7Up Lon", price: 0),
          Addon(name: "Aquafina", price: 0),
        ]
    ),
    Food(
        name: "Khuyến mãi 2",
        description: "01 Pizza Rau Củ/Pepperoni/Hawaiian/"
            "Phô Mai Cao Cấp/Gà Nướng Nấm/Bò BBQ Xốt Cay Hàn Quốc (Cỡ Nhỏ)"
            "01 Khoai Tây Chiên 01 Bánh Mì Bơ Tỏi/ Bánh Cuộn Phô Mai",
        imagePath: "assets/images/My_Box_2_Combo.jpg",
        price: 108.000,
        category: FoodCategory.promotions,
        availableAddons: [
          Addon(name: "7Up Lon", price: 0),
          Addon(name: "Aquafina", price: 0),
        ]
    ),
    Food(
        name: "Khuyến mãi 3",
        description: "01 Pizza (Cỡ Nhỏ) 01 Khoai Tây Chiên 01 Bánh Mì Bơ Tỏi/"
            "Bánh Cuộn Phô Mai",
        imagePath: "assets/images/My_Box_3_Combo.jpg",
        price: 98.000,
        category: FoodCategory.promotions,
        availableAddons: [
          Addon(name: "7Up Lon", price: 0),
          Addon(name: "Aquafina", price: 0),
        ]
    ),
    Food(
        name: "Khuyến mãi 4",
        description: "01 Pizza (Cỡ Nhỏ) 01 Khoai Tây Chiên/"
            "Bánh Mì Bơ Tỏi/ Bánh Cuộn Phô Mai 01 Cánh Gà BBQ Múa Lửa Hồng (2 Miếng)/"
            "Cánh Gà Xốt Cay-Pop Hàn Quốc (2 miếng)/Cánh Gà Giòn Karaage (2 Miếng)/"
            "Cánh Gà Xóc Mắm Tỏi Mekong (2 Miếng)",
        imagePath: "assets/images/My_Box_4_Combo.jpg",
        price: 68.000,
        category: FoodCategory.promotions,
        availableAddons: [
          Addon(name: "7Up Lon", price: 0),
          Addon(name: "Aquafina", price: 0),
        ]
    ),

    //pizza
    Food(
        name: "Pizza Hải Sản Nhiệt Đới Xốt Tiêu",
        description: "Xốt tiêu đen, Phô Mai Mozzarella, Phô Mai Cheddar, Thơm, Hành Tây, Tôm, Mực",
        imagePath: "assets/images/Pizzaminsea-Hai-San-Nhiet-Doi-Xot-Tieu.jpg",
        price: 117.000,
        category: FoodCategory.pizza,
        availableAddons: [
          Addon(name: "SMALL", price: 0),
          Addon(name: "MEDIUM", price: 80.000),
          Addon(name: "LARGE", price: 190.000),
        ]
    ),
    Food(
        name: "Pizza Gà Phô Mai Thịt Heo Xông Khói",
        description: "Xốt Phô Mai, Thịt Gà, Thịt Heo Muối, Phô Mai Mozzarella, Cà Chua",
        imagePath: "assets/images/Pizza-Ga-Pho-Mai-Thit-Heo-Xong-Khoi-Cheesy-Chicken-Bacon.jpg",
        price: 97.500,
        category: FoodCategory.pizza,
        availableAddons: [
          Addon(name: "SMALL", price: 0),
          Addon(name: "MEDIUM", price: 80.000),
          Addon(name: "LARGE", price: 190.000),
        ]
    ),
    Food(
        name: "Pizza Hải Sản Xốt Cà Chua",
        description: "Xốt Cà Chua, Phô Mai Mozzarella, Tôm, Mực, Thanh Cua, Hành Tây",
        imagePath: "assets/images/Pizza-Hai-San-Xot-Ca-Chua-Seafood-Delight.jpg",
        price: 117.000,
        category: FoodCategory.pizza,
        availableAddons: [
          Addon(name: "SMALL", price: 0),
          Addon(name: "MEDIUM", price: 80.000),
          Addon(name: "LARGE", price: 190.000),
        ]
    ),
    Food(
        name: "Pizza Thập Cẩm Thượng Hạng",
        description: "Xốt Cà Chua, Phô Mai Mozzarella,"
            "Xúc Xích Pepperoni, Thịt Dăm Bông, Xúc Xich Ý,"
            "Thịt Bò Viên, Ớt Chuông Xanh, Nấm Mỡ, Hành Tây, Ô-liu",
        imagePath: "assets/images/Pizza-Thap-Cam-Thuong-Hang-Extravaganza.jpg",
        price: 117.000,
        category: FoodCategory.pizza,
        availableAddons: [
          Addon(name: "SMALL", price: 0),
          Addon(name: "MEDIUM", price: 80.000),
          Addon(name: "LARGE", price: 190.000),
        ],
    ),

    //chicken
    Food(
      name: "Cánh gà giòn Karaage(4 miếng)",
      description: "Cánh gà chiên với từng xớ gà đậm vị cùng lớp da giòn rụm bên ngoài",
      imagePath: "assets/images/Ga_Khong_Xuong_Korean.jpg",
      price: 119.000,
      category: FoodCategory.chickens,
      availableAddons: [
        Addon(name: "SMALL(4 miếng)", price: 0),
        Addon(name: "MEDIUM(6 miếng)", price: 50.000),
      ],
    ),
    Food(
      name: "Gà không xương Hàn Quốc",
      description: "Nơi những chú gà không cần phải học tiếng Hàn,"
          "nhưng vẫn chuẩn vị Hàn cùng xốt cay đặc trưng cho trải nghiệm gà ngon thêm hấp dẫn",
      imagePath: "assets/images/Ga_Khong_Xuong_Korean.jpg",
      price: 119.000,
      category: FoodCategory.chickens,
      availableAddons: [
        Addon(name: "SMALL(4 miếng)", price: 0),
        Addon(name: "MEDIUM(6 miếng)", price: 50.000),
      ],
    ),
    Food(
      name: "Gà không xương Mêkong",
      description: "Thưởng thức vị gà không xương cùng xốt mắm tỏi Mekong cho trải nghiệm gà ngon được trọn vẹn",
      imagePath: "assets/images/Ga_Khong_Xuong_Mekong.jpg",
      price: 119.000,
      category: FoodCategory.chickens,
      availableAddons: [
        Addon(name: "SMALL(4 miếng)", price: 0),
        Addon(name: "MEDIUM(6 miếng)", price: 50.000),
      ],
    ),
    Food(
      name: "Gà Phủ Phô Mai",
      description: "Gấp đôi hương vị phô mai, phủ trọn từng xớ gà giòn Karaagee không xương cho trải nghiệm ăn gà thêm béo bùi",
      imagePath: "assets/images/Ga_Pho_Mai.jpg",
      price: 129.000,
      category: FoodCategory.chickens,
      availableAddons: [
        Addon(name: "SMALL(4 miếng)", price: 0),
        Addon(name: "MEDIUM(6 miếng)", price: 50.000),
      ],
    ),

    //appetizes
    Food(
      name: "Bánh cuộn phô mai",
      description: "Được Làm Từ 2 Loại Phô Mai",
      imagePath: "assets/images/Banh_Cuon_Pho_Mai_KV.jpg",
      price: 69.000,
      category: FoodCategory.appetizes,
      availableAddons: [
        Addon(name: "SMALL", price: 0),
        Addon(name: "MEDIUM", price: 20.000),
      ],
    ),
    Food(
      name: "Bánh mì bơ tỏi",
      description: "Bánh Mì Bơ Tỏi Nướng Giòn Ngon Phủ Xốt Bơ Tỏi Thơm Nồng",
      imagePath: "assets/images/Banh_Mi_Bo_Toi_KV.jpg",
      price: 29.000,
      category: FoodCategory.appetizes,
      availableAddons: [
        Addon(name: "SMALL", price: 0),
        Addon(name: "MEDIUM", price: 20.000),
      ],
    ),
    Food(
      name: "Bắp Nướng Phô Mai Thịt Xông Khói",
      description: "Bắp Ngọt, Thịt Xông Khói Kèm Xốt Cheesy Mayo Và Bơ Tỏi, Phủ Phô Mai Mozzarella Đút Lò",
      imagePath: "assets/images/Bap_Nuong_Pho_Mai_Thit_Xong_Khoi_KV.jpg",
      price: 79.000,
      category: FoodCategory.appetizes,
      availableAddons: [
        Addon(name: "SMALL", price: 0),
        Addon(name: "MEDIUM", price: 20.000),
      ],
    ),
    Food(
      name: "Cơm chiên tôm vị cay",
      description: "Cơm Chiên Tôm Vị Cay Nổi Tiếng Trên Nền Xốt Bơ Tỏi Độc Đáo",
      imagePath: "assets/images/Com_Chien_Tom_Vi_Cay_KV.jpg",
      price: 79.000,
      category: FoodCategory.appetizes,
      availableAddons: [
        Addon(name: "SMALL", price: 0),
        Addon(name: "MEDIUM", price: 20.000),
      ],
    ),

    //drinks
    Food(
      name: "Aquafina",
      description: "Aquafina 500ml",
      imagePath: "assets/images/Aquafina.jpg",
      price: 20.000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "500ml", price: 0),
        Addon(name: "1.5l", price: 10.000),
      ],
    ),
    Food(
      name: "7Up Lon",
      description: "7Up Lon 320ml",
      imagePath: "assets/images/7Up_Can.jpg",
      price: 30.000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "320ml", price: 0),
        Addon(name: "1.5l", price: 10.000),
      ],
    ),
    Food(
      name: "Trà đào hạt chia",
      description: "Trà Đào, Đào Miếng Và Hạt Chia",
      imagePath: "assets/images/Tra_Dao_Hat_Chia.jpg",
      price: 39.000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "SMALL", price: 0),
        Addon(name: "MEDIUM", price: 10.000)
      ],
    ),
    Food(
      name: "Trà vải",
      description: "Trà Vải",
      imagePath: "assets/images/Tra_Vai.jpg",
      price: 39.000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "SMALL", price: 0),
        Addon(name: "MEDIUM", price: 10.000)
      ],
    ),
  ];

  String _deliveryAdress = 'Hoàng Văn Thụ, Q.Tân Bình';



  //Getters
  List<Food> get menu => _menu;

  List<CartItem> get cart =>_cart;

  final List<CartItem> _cart =[];

  String get deliveryAdress => _deliveryAdress;



  //thêm vào giỏ hàng
  void addToCart(Food food , List<Addon> selectedAddons){
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      bool iSameAddons = const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && iSameAddons;
    });

    if(cartItem != null){
      cartItem.quantity++;
    }else{
      _cart.add(
        CartItem(
            food: food,
            selectedAddons: selectedAddons)
      );
    }
    notifyListeners();
  }

  //xóa giỏ hàng
  void removeAllFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      if(_cart[cartIndex].quantity>1){
        _cart[cartIndex].quantity--;
      }else{
        _cart[cartIndex].quantity = 1;
      }
      notifyListeners();
    }
  }

  //xóa items giỏ hàng
  void deleteFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      _cart.removeAt(cartIndex);
      notifyListeners();
    }
  }

  //cập nhật địa chỉ giao hàng
  void updateDeliveryAdress(String newAddress){
    _deliveryAdress = newAddress;
    notifyListeners();
  }












  //tính tổng giá của giỏ hàng
  double getTotalPrice(){
    double total = 0;
    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal+=addon.price;
      }
      total+= itemTotal*cartItem.quantity;
    }
    return total;
  }

  //Format price
  String formatPrice(double price) {
    // Chuyển đổi giá trị double thành chuỗi
    String priceString = price.toStringAsFixed(3);

    // Tìm vị trí của dấu chấm thập phân
    int dotIndex = priceString.indexOf('.');

    // Lấy phần nguyên của giá
    String integerPart = priceString.substring(0, dotIndex);

    // Lấy phần thập phân của giá
    String decimalPart = priceString.substring(dotIndex + 1);

    // Định dạng lại phần nguyên với dấu phân cách hàng nghìn
    String formattedIntegerPart = '';
    for (int i = 0; i < integerPart.length; i++) {
      formattedIntegerPart += integerPart[i];
      if ((integerPart.length - i - 1) % 3 == 0 && i != integerPart.length - 1) {
        formattedIntegerPart += '.';
      }
    }

    // Kết hợp phần nguyên và thập phân lại với nhau
    String formattedPrice = '$formattedIntegerPart.$decimalPartđ';

    return formattedPrice;
  }

  //format price addon
  String formatAddons(List<Addon> addon){
    return addon.map((addon) {
      if (addon.price == 0) {
        return "${addon.name} (0đ)";
      } else {
        return "${addon.name} (${formatPrice(addon.price)})";
      }
    }).join(",");
  }

  //hóa đơn tổng
  String displayReceipt(){
    final receipt = StringBuffer();
    String formattedDate =  DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln("_________________");
    receipt.writeln();

    for(final carItem in _cart){
      receipt.writeln(
        "${carItem.quantity} x ${carItem.food.name} - ${'${carItem.food.price.toStringAsFixed(3)}đ'}");
      if(carItem.selectedAddons.isNotEmpty){
        receipt.writeln("Chọn : ${formatAddons(carItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("_________________");
    receipt.writeln("");
    receipt.writeln("Tổng số lượng mua: ${getTotalIteamCount()}");
    receipt.writeln("");
    receipt.writeln("Phí giao hàng: 15.000đ");
    receipt.writeln("");
    receipt.writeln("Tổng tiền: ${formatPrice(getTotalPrice() + 15.000)}");
    receipt.writeln("");
    receipt.writeln("Giao hàng tới: $deliveryAdress");
    return receipt.toString();
  }


  //  đếm số lượng giỏ hàng
  int getTotalIteamCount(){
    int totalItemCount = 0;

    for(CartItem cartItem in _cart){
      totalItemCount+= cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear giỏ hàng
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }




}