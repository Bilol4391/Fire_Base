class ExamCategoryModel {
  final String? name;
  final String? image;

  ExamCategoryModel({required this.name, required this.image});

  factory ExamCategoryModel.fromJson(Map data) {
    return ExamCategoryModel(name: data["name"], image: data["image"]);
  }

  toJson() {
    return {
      "name": name,
      "image": image,

    };
  }
}