class SearchModel{
  String ? name;
  String ? description;
  String ? image;
  SearchModel({
    this.name,
    this.description,
    this.image
});
  SearchModel.fromJson(Map<String,dynamic> json)
  {
    name=json['name'];
    image=json['image'];
    description=json['description'];
  }

}