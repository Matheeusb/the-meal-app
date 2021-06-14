class Meal {
  String id;
  String name;
  String image;

  Meal({this.id, this.name, this.image});

  factory Meal.fromJson(Map<String, dynamic> map) {
    return Meal(
      id: map['idMeal'],
      name: map['strMeal'],
      image: map['strMealThumb'],
    );
  }
}
