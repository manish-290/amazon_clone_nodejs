import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final double price;
  final String category;
  final double quantity;
  final List<String> images;
  final String description;
  final String? id;
  
  Product({
    required this.name,
    required this.price,
    required this.category,
    required this.quantity,
    required this.images,
    required this.description,
    this.id,
  });


  



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'category': category,
      'quantity': quantity,
      'images': images,
      'description': description,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
      quantity: map['quantity'] as double,
      images: List<String>.from((map['images'] as List<String>), 
    ),
     description: map['description'] as String,
      id: map['id'] != null ? map['id'] as String : null,);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
