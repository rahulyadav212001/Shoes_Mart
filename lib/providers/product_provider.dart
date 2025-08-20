import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Air Max Revolution',
      brand: 'Nike',
      price: 129.99,
      image: 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=400',
      images: [
        'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=400',
        'https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg?auto=compress&cs=tinysrgb&w=400',
      ],
      description: 'Revolutionary comfort meets iconic style in this premium sneaker designed for everyday wear.',
      category: 'sneakers',
      sizes: ['7', '8', '9', '10', '11', '12'],
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      id: '2',
      name: 'Urban Explorer',
      brand: 'Adidas',
      price: 89.99,
      image: 'https://images.pexels.com/photos/1598508/pexels-photo-1598508.jpeg?auto=compress&cs=tinysrgb&w=400',
      images: [
        'https://images.pexels.com/photos/1598508/pexels-photo-1598508.jpeg?auto=compress&cs=tinysrgb&w=400',
      ],
      description: 'Perfect for city adventures with superior comfort and modern design.',
      category: 'casual',
      sizes: ['7', '8', '9', '10', '11'],
      rating: 4.2,
      reviews: 95,
    ),
    Product(
      id: '3',
      name: 'Classic Leather Oxford',
      brand: 'Cole Haan',
      price: 199.99,
      image: 'https://images.pexels.com/photos/1598506/pexels-photo-1598506.jpeg?auto=compress&cs=tinysrgb&w=400',
      images: [
        'https://images.pexels.com/photos/1598506/pexels-photo-1598506.jpeg?auto=compress&cs=tinysrgb&w=400',
      ],
      description: 'Timeless elegance for the modern professional. Handcrafted with premium leather.',
      category: 'formal',
      sizes: ['8', '9', '10', '11', '12'],
      rating: 4.8,
      reviews: 67,
    ),
    Product(
      id: '4',
      name: 'Trail Runner Pro',
      brand: 'Merrell',
      price: 149.99,
      image: 'https://images.pexels.com/photos/2529157/pexels-photo-2529157.jpeg?auto=compress&cs=tinysrgb&w=400',
      images: [
        'https://images.pexels.com/photos/2529157/pexels-photo-2529157.jpeg?auto=compress&cs=tinysrgb&w=400',
      ],
      description: 'Built for outdoor adventures with superior grip and waterproof protection.',
      category: 'sports',
      sizes: ['7', '8', '9', '10', '11', '12', '13'],
      rating: 4.6,
      reviews: 89,
    ),
    Product(
      id: '5',
      name: 'Street Style High-Top',
      brand: 'Converse',
      price: 69.99,
      image: 'https://images.pexels.com/photos/1464625/pexels-photo-1464625.jpeg?auto=compress&cs=tinysrgb&w=400',
      images: [
        'https://images.pexels.com/photos/1464625/pexels-photo-1464625.jpeg?auto=compress&cs=tinysrgb&w=400',
      ],
      description: 'Classic high-top design with a modern twist. Perfect for casual streetwear.',
      category: 'sneakers',
      sizes: ['6', '7', '8', '9', '10', '11'],
      rating: 4.3,
      reviews: 156,
    ),
    Product(
      id: '6',
      name: 'Business Professional',
      brand: 'Allen Edmonds',
      price: 299.99,
      image: 'https://images.pexels.com/photos/1464625/pexels-photo-1464625.jpeg?auto=compress&cs=tinysrgb&w=400',
      images: [
        'https://images.pexels.com/photos/1464625/pexels-photo-1464625.jpeg?auto=compress&cs=tinysrgb&w=400',
      ],
      description: 'Executive-level dress shoes crafted with the finest materials and attention to detail.',
      category: 'formal',
      sizes: ['8', '9', '10', '11', '12'],
      rating: 4.9,
      reviews: 43,
    ),
  ];

  final List<Category> _categories = [
    Category(
      id: 'sneakers',
      name: 'Sneakers',
      image: 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=200',
    ),
    Category(
      id: 'formal',
      name: 'Formal',
      image: 'https://images.pexels.com/photos/1598506/pexels-photo-1598506.jpeg?auto=compress&cs=tinysrgb&w=200',
    ),
    Category(
      id: 'sports',
      name: 'Sports',
      image: 'https://images.pexels.com/photos/2529157/pexels-photo-2529157.jpeg?auto=compress&cs=tinysrgb&w=200',
    ),
    Category(
      id: 'casual',
      name: 'Casual',
      image: 'https://images.pexels.com/photos/1598508/pexels-photo-1598508.jpeg?auto=compress&cs=tinysrgb&w=200',
    ),
  ];

  List<Product> get products => _products;
  List<Category> get categories => _categories;

  Product? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Product> searchProducts(String query, {String? category}) {
    return _products.where((product) {
      final matchesQuery = product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.brand.toLowerCase().contains(query.toLowerCase());
      final matchesCategory = category == null || product.category == category;
      return matchesQuery && matchesCategory;
    }).toList();
  }

  List<Product> getFeaturedProducts() {
    return _products.take(6).toList();
  }
}