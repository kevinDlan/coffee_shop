import 'dart:convert';

class Coffee {
  final int id;
  final String name;
  final String content;
  final double price;
  final double rating;
  final String image;
  Coffee({
    required this.id,
    required this.name,
    required this.content,
    required this.price,
    required this.rating,
    required this.image,
  });

  Coffee copyWith({
    int? id,
    String? name,
    String? content,
    double? price,
    double? rating,
    String? image,
  }) {
    return Coffee(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'content': content,
      'price': price,
      'rating': rating,
      'image': image,
    };
  }

  factory Coffee.fromMap(Map<String, dynamic> map) {
    return Coffee(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      content: map['content'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      rating: map['rating']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Coffee.fromJson(String source) => Coffee.fromMap(json.decode(source));
}
