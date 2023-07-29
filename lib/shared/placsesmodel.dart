class PLacesModel{
  String ? image;
  String ? name;
  String ?location;
  String ? description;
  PLacesModel(
  {
    this.name,
    this.image,
    this.location,
    this.description,
}
      );

  PLacesModel.fromJson(Map<String,dynamic> json)
  {
    image=json['image'];
    name=json['name'];
    location=json['location'];
    description=json['description'];
  }
}