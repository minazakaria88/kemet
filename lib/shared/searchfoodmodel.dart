class SearchFoodModel
{
  String? name;
  String ?image;
  String? category;
  String? origin;
  String ?instruction;
  String?video;
  SearchFoodModel.fromJson(Map<String,dynamic> json)
  {
    name=json['strMeal'];
    image=json['strMealThumb'];
    category=json['strCategory'];
    origin=json['strArea'];
    instruction=json['strInstructions'];
    video=json['strYoutube'];
  }

}