class CartItem {
  final String name;
  final double price;
  final int quantity;
  final Map restaurant; 

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.restaurant,
  });
}

class CartData {
  static List<CartItem> items = [];


}