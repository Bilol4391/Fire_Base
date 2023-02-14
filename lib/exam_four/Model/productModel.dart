class ExamProductModel {
  final String? name;
  final String? image;
  final num? price;
  final String? category;
  final String? desc;

  ExamProductModel(
      {required this.name,
        required this.image,
        required this.price,
        required this.category,
        required this.desc,
      });

  factory ExamProductModel.fromJson(Map? data,bool? isLike) {
    return ExamProductModel(
      name: data?["name"],
      image: data?["image"],
      price: data?["price"],
      category: data?["category"], desc: data?["desc"],
    );
  }

  toJson() {
    return {
      "name": name,
      "image": image,
      "price": price,
      "category": category,
      "desc": desc,
    };
  }
}