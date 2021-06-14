class MealDetails {
  String id;
  String name;
  String drinkAlternate;
  String category;
  String area;
  String instructions;
  String image;
  String tags;
  String video;
  List<String> ingredients;
  List<String> measures;

  MealDetails({
    this.id,
    this.name,
    this.drinkAlternate,
    this.category,
    this.area,
    this.instructions,
    this.image,
    this.tags,
    this.video,
    this.ingredients,
    this.measures,
  });

  factory MealDetails.fromJson(Map<String, dynamic> map) {
    List<String> ingredientList = [];
    for (int i = 1; i <= 20; i++) {
      if (map['strIngredient$i'] != null && map['strIngredient$i'] != "") {
        ingredientList.add(map['strIngredient$i']);
      }
    }

    List<String> measureList = [];
    for (int i = 1; i <= 20; i++) {
      if (map['strMeasure$i'] != null && map['strMeasure$i'] != "") {
        measureList.add(map['strMeasure$i']);
      }
    }

    return MealDetails(
      id: map['idMeal'],
      name: map['strMeal'],
      drinkAlternate: map['strDrinkAlternate'],
      category: map['strCategory'],
      area: map['strArea'],
      instructions: map['strInstructions'],
      image: map['strMealThumb'],
      tags: map['strTags'],
      video: map['strYoutube'],
      ingredients: ingredientList,
      measures: measureList,
    );
  }

  @override
  String toString() {
    return '''
        Title: $name
        
        Category: $category
        
        Instructions: $instructions
        
        Video: $video
        ''';
  }
}
