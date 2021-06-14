class Category {
  String id;
  String name;
  String image;
  String description;

  Category({this.id, this.name, this.image, this.description});

  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(
      id: map['idCategory'],
      name: map['strCategory'],
      image: map['strCategoryThumb'],
      description: map['strCategoryDescription'],
    );
  }
}
