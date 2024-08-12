class Recomendationfoodmodel {
  final String id;
  final String title;
  final String time;
  final String code;
  final String imageUrl;
  final String category;
  final String description;
  final String restaurant;
  final bool isAvailable;
  final List<String> foodType;
  final List<String> foodTags;
  final double rating;
  final double price;
  final List<Additive> additives;
  final String ratingCount;
  final int v;

  Recomendationfoodmodel({
    required this.id,
    required this.title,
    required this.time,
    required this.code,
    required this.imageUrl,
    required this.category,
    required this.description,
    required this.restaurant,
    required this.isAvailable,
    required this.foodType,
    required this.foodTags,
    required this.rating,
    required this.price,
    required this.additives,
    required this.ratingCount,
    required this.v,
  });

  factory Recomendationfoodmodel.fromJson(Map<String, dynamic> json) {
    var additivesList = json['additives'] as List;
    List<Additive> additives = additivesList.map((e) => Additive.fromJson(e)).toList();

    return Recomendationfoodmodel(
      id: json['_id'],
      title: json['title'],
      time: json['time'],
      code: json['code'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      description: json['description'],
      restaurant: json['restaurant'],
      isAvailable: json['isAvailable'],
      foodType: List<String>.from(json['foodType']),
      foodTags: List<String>.from(json['foodTags']),
      rating: json['rating'].toDouble(),
      price: json['price'].toDouble(),
      additives: additives,
      ratingCount: json['ratingCount'],
      v: json['__v'],
    );
  }
}

class Additive {
  final String title;
  final double price;
  final String id;

  Additive({
    required this.title,
    required this.price,
    required this.id,
  });

  factory Additive.fromJson(Map<String, dynamic> json) {
    return Additive(
      title: json['title'],
      price: json['price'].toDouble(),
      id: json['_id'],
    );
  }
}