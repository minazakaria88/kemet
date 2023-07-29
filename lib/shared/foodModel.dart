class FoodModel
{
   List<FoodModelDetails> foods=[];

  FoodModel.fromJson(Map<String,dynamic> json)
  {
    for(var element in json['meals'])
      {
             foods.add(FoodModelDetails.fromJson(element));
      }
  }
}

class FoodModelDetails
{
  String ? name;
  String? image;
  FoodModelDetails.fromJson(Map<String,dynamic> json)
  {
    name=json['strMeal'];
    image=json['strMealThumb'];
  }
}