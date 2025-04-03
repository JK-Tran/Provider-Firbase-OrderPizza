class Food{
  final String name; //tên thức ăn
  final String description; //mô tả thức ăn
  final String imagePath; //đường dẫn ảnh
  final double price; //giá
  final FoodCategory category; //loại sản phẩm
  List<Addon> availableAddons; //s,m,l

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}
//danh mục
enum FoodCategory{
  combo,
  promotions,
  chickens,
  pizza,
  appetizes,
  drinks
}

extension FoodCategoryExtension on FoodCategory {
  String get description {
    switch (this) {
      case FoodCategory.combo:
        return 'Combo';
      case FoodCategory.promotions:
        return 'Khuyến mãi';
      case FoodCategory.chickens:
        return 'Gà';
      case FoodCategory.pizza:
        return 'Pizza';
      case FoodCategory.appetizes:
        return 'Món khai vị';
      case FoodCategory.drinks:
        return 'Đồ uống';
      default:
        return '';
    }
  }
}

class Addon{
  String name;
  double price;

  Addon({
    required this.name,
    required this.price
  });
}