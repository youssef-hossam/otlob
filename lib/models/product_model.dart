class ProductModel {
  // final int id;
  final String title;
  // final String description;
  // final String category;
  // final num price;
  // final num discountPercentage;
  // final num rating;
  // final num stock;
  final String thumbnail;

  ProductModel({
    // required this.id,
    required this.title,
    // required this.description,
    // required this.category,
    // required this.price,
    // required this.discountPercentage,
    // required this.rating,
    // required this.stock,
    required this.thumbnail,
  });

  //json convert => object
  // factoy constructor to create a ProductModel from JSON data

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
        // id: json['id'],
        title: json['title'],
        // description: json['description'],
        // category: json['category'],
        // price: json['price'],
        // discountPercentage: json['discountPercentage'],
        // rating: json['rating'],
        // stock: json['stock'],
        thumbnail: json['thumbnail']);
  }
}
// "id": 1,
// "title": "Essence Mascara Lash Princess",
// "description": "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
// "category": "beauty",
// "price": 9.99,
// "discountPercentage": 10.48,
// "rating": 2.56,
// "stock": 99,
