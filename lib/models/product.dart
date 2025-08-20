class Product {
  final String id;
  final String name;
  final String brand;
  final double price;
  final String image;
  final List<String> images;
  final String description;
  final String category;
  final List<String> sizes;
  final double rating;
  final int reviews;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    required this.images,
    required this.description,
    required this.category,
    required this.sizes,
    required this.rating,
    required this.reviews,
  });
}

class Category {
  final String id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });
}

class CartItem {
  final String id;
  final Product product;
  final String size;
  int quantity;

  CartItem({
    required this.id,
    required this.product,
    required this.size,
    required this.quantity,
  });
}